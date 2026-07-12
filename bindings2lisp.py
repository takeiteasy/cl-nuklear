#!/usr/bin/env python3
"""
bindings2lisp.py — Generate CFFI (SBCL) + ECL FFI Lisp bindings from nuklear_api.json.

Uses reader conditionals (#-ecl / #+ecl) so the same files work on both:
  - CFFI path: cffi:defcfun + cffi:defcstruct + cffi:defcenum (struct-by-value via C shims)
  - ECL path:  ffi:def-function + ffi:def-c-struct + defconstant (struct-by-value native)

Usage:
    python bindings2lisp.py nuklear_api.json <project-root>

Writes into <project-root>:
    package.lisp        — defpackage with reader conditional
    library.lisp        — foreign library loading (CFFI/ECL)
    enums.lisp          — defcenum (#-ecl) / defconstant (#+ecl) for each nk enum
    structs.lisp        — defcstruct / defcunion (#-ecl) / ffi:def-c-struct (#+ecl)
    functions.lisp      — defcfun (#-ecl) / ffi:def-function (#+ecl) for each nk function
    nuklear_shims.c     — thin C wrappers for struct-by-value (CFFI-only, #-ecl)
    cl-nuklear.asd      — ASDF system definition
"""

import sys
import json
from pathlib import Path


PRIMITIVE_MAP = {
    "bool":               ":bool",
    "char":               ":char",
    "unsigned char":      ":unsigned-char",
    "short":              ":short",
    "unsigned short":     ":unsigned-short",
    "int":                ":int",
    "unsigned int":       ":unsigned-int",
    "long":               ":long",
    "unsigned long":      ":unsigned-long",
    "long long":          ":long-long",
    "unsigned long long": ":unsigned-long-long",
    "float":              ":float",
    "double":             ":double",
}

ECL_PRIMITIVE_MAP = {
    "bool":               ":int",
    "char":               ":char",
    "unsigned char":      ":unsigned-char",
    "short":              ":short",
    "unsigned short":     ":unsigned-short",
    "int":                ":int",
    "unsigned int":       ":unsigned-int",
    "long":               ":long",
    "unsigned long":      ":unsigned-long",
    "long long":          ":long-long",
    "unsigned long long": ":unsigned-long-long",
    "float":              ":float",
    "double":             ":double",
}


def c2l(name: str) -> str:
    """Convert C snake_case identifier to Lisp hyphenated.  nk_foo_bar -> nk-foo-bar"""
    return name.replace("_", "-")


def type_to_cffi(ty: dict, tdmap: dict, depth: int = 0) -> str:
    """Return a CFFI type expression string for the given type JSON node."""
    if depth > 6:
        return ":pointer"

    kind = ty.get("kind")

    if kind == "void":
        return ":void"

    if kind == "primitive":
        return PRIMITIVE_MAP.get(ty["name"], ":int")

    if kind == "pointer":
        return ":pointer"

    if kind == "record":
        # Struct by value — CFFI (:struct ...) form
        return f"(:struct {c2l(ty['name'])})"

    if kind == "enum":
        return c2l(ty["name"])

    if kind == "typedef":
        td_name = ty["name"]
        # Typedef resolves to a struct — still by value
        if ty.get("canonical_kind") == "record":
            struct_name = c2l(ty.get("canonical_name") or td_name)
            return f"(:struct {struct_name})"
        # Resolve through the typedef map first
        if td_name in tdmap:
            return type_to_cffi(tdmap[td_name], tdmap, depth + 1)
        # Use the pre-computed canonical type from the parser (resolves system typedefs)
        if "canonical" in ty:
            return type_to_cffi(ty["canonical"], tdmap, depth + 1)
        # Unknown typedef — treat as opaque int
        return ":int"

    if kind == "array":
        elem = type_to_cffi(ty["element"], tdmap, depth + 1)
        size = ty.get("size")
        if size is not None:
            return f"(:array {elem} {size})"
        return ":pointer"

    if kind in ("function_pointer", "unknown", "opaque"):
        return ":pointer"

    return ":pointer"


def type_to_ecl(ty: dict, tdmap: dict, depth: int = 0) -> str:
    """Return an ECL FFI type expression string for the given type JSON node."""
    if depth > 6:
        return ":pointer"

    kind = ty.get("kind")

    if kind == "void":
        return ":void"

    if kind == "primitive":
        return ECL_PRIMITIVE_MAP.get(ty["name"], ":int")

    if kind == "pointer":
        return ":pointer"

    if kind == "record":
        return f"(:struct {c2l(ty['name'])})"

    if kind == "enum":
        return ":int"

    if kind == "typedef":
        td_name = ty["name"]
        if ty.get("canonical_kind") == "record":
            struct_name = c2l(ty.get("canonical_name") or td_name)
            return f"(:struct {struct_name})"
        if td_name in tdmap:
            return type_to_ecl(tdmap[td_name], tdmap, depth + 1)
        if "canonical" in ty:
            return type_to_ecl(ty["canonical"], tdmap, depth + 1)
        return ":int"

    if kind == "array":
        return ":pointer"

    if kind in ("function_pointer", "unknown", "opaque"):
        return ":pointer"

    return ":pointer"


# ---------------------------------------------------------------------------
# C shim helpers
# ---------------------------------------------------------------------------

def c_type_str(ty: dict, tdmap: dict) -> str:
    """Return a C type spelling for a type JSON node (used in shim generation)."""
    kind = ty.get("kind")
    is_const = ty.get("const", False)
    if kind == "void":
        return "void"
    if kind == "primitive":
        prefix = "const " if is_const else ""
        return f"{prefix}{ty['name']}"
    if kind == "pointer":
        pointee = ty.get("pointee", {})
        inner = c_type_str(pointee, tdmap)
        # const after * means the pointer itself is const: "int *const"
        const_suffix = " const" if is_const else ""
        return f"{inner}*{const_suffix}"
    if kind == "record":
        prefix = "const " if is_const else ""
        return f"{prefix}struct {ty['name']}"
    if kind == "enum":
        return f"enum {ty['name']}"
    if kind == "typedef":
        prefix = "const " if is_const else ""
        return f"{prefix}{ty['name']}"
    if kind == "array":
        elem = c_type_str(ty["element"], tdmap)
        size = ty.get("size")
        return f"{elem}[{size}]" if size else f"{elem}*"
    return "void*"


def struct_type_name(ty: dict) -> str:
    """Return just the struct/typedef name from a by-value type node."""
    if ty.get("kind") == "record":
        return f"struct {ty['name']}"
    if ty.get("kind") == "typedef":
        if ty.get("canonical_kind") == "record":
            return ty["name"]
    return ty.get("name", "void")


# ---------------------------------------------------------------------------
# File generators
# ---------------------------------------------------------------------------

def gen_package() -> str:
    return """\
#-ecl
(defpackage :nuklear
  (:use :cl :cffi)
  (:nicknames :nk))

#+ecl
(defpackage :nuklear
  (:use :cl :ffi)
  (:nicknames :nk))

(in-package :nuklear)
"""


def gen_enums(api: dict) -> str:
    lines = ["(in-package :nuklear)", "", ";;; Enumerations", ""]
    for enum in api["enums"]:
        raw_name = enum["name"]
        # Anonymous enums (e.g. "enum (unnamed at nuklear.h:455:1)") — emit constants directly.
        if not raw_name.startswith("nk") and not raw_name.startswith("NK"):
            for c in enum["constants"]:
                lines.append(f"(defconstant {c2l(c['name']).lower()} {c['value']})")
            lines.append("")
            continue
        lisp_name = c2l(raw_name)

        # CFFI path — defcenum with keyword values
        lines.append(f"; {raw_name}")
        lines.append("#-ecl")
        lines.append(f"(cffi:defcenum {lisp_name}")
        for c in enum["constants"]:
            lines.append(f"  (:{c2l(c['name']).lower()} {c['value']})")
        lines.append(")")

        # ECL path — defconstant for each value
        lines.append("#+ecl")
        lines.append("(eval-when (:compile-toplevel :load-toplevel :execute)")
        for c in enum["constants"]:
            lines.append(f"  (defconstant {c2l(c['name']).lower()} {c['value']})")
        lines.append(")")
        lines.append("")
    return "\n".join(lines)


def gen_structs(api: dict) -> str:
    tdmap = {td["name"]: td["underlying"] for td in api["typedefs"]}
    lines = ["(in-package :nuklear)", "", ";;; Structure definitions", ""]
    for struct in api["structs"]:
        lisp_name = c2l(struct["name"])

        # CFFI path
        cffi_form = "cffi:defcunion" if "union" in struct.get("kind", "") else "cffi:defcstruct"
        lines.append(f"; {struct['name']}")
        lines.append("#-ecl")
        lines.append(f"({cffi_form} {lisp_name}")
        for field in struct["fields"]:
            fname = c2l(field["name"]) if field["name"] else "padding"
            ftype = type_to_cffi(field["type"], tdmap)
            bw = field.get("bit_width")
            if bw is not None:
                lines.append(f"  ({fname} {ftype} :count {bw})")
            else:
                lines.append(f"  ({fname} {ftype})")
        lines.append(")")

        # ECL path
        ecl_form = "ffi:def-c-union" if "union" in struct.get("kind", "") else "ffi:def-c-struct"
        lines.append("#+ecl")
        lines.append(f"({ecl_form} {lisp_name}")
        for field in struct["fields"]:
            fname = c2l(field["name"]) if field["name"] else "padding"
            ftype = type_to_ecl(field["type"], tdmap)
            lines.append(f"    ({fname} {ftype})")
        lines.append(")")
        lines.append("")
    return "\n".join(lines)


def gen_functions(api: dict) -> str:
    tdmap = {td["name"]: td["underlying"] for td in api["typedefs"]}
    lines = [
        "(in-package :nuklear)",
        "",
        ";;; Function bindings.",
        ";;; CFFI path (#-ecl): struct-by-value handled via C shims (nuklear_shims.c).",
        ";;; ECL path   (#+ecl): native ffi:def-function handles struct-by-value directly.",
        "",
    ]
    for fn in api["functions"]:
        name = fn["name"]
        lisp_name = c2l(name)
        needs_shim = fn["needs_shim"]
        variadic = fn["variadic"]

        if variadic:
            lines.append(f"; {name} — variadic, skipped (wrap manually if needed)")
            lines.append("")
            continue

        sbv_params = set(fn["struct_by_value_params"])
        sbv_return = fn["struct_by_value_return"]

        # ----- CFFI path (#-ecl) -----
        lines.append(f"; {name}")
        lines.append("#-ecl")
        if needs_shim:
            shim_c_name = f"cl_{name}"
            lines.append(f"; [SHIM] {name} — struct-by-value replaced with pointers")
            ret_cffi = ":void" if sbv_return else type_to_cffi(fn["return_type"], tdmap)
            lines.append(f'(cffi:defcfun ("{shim_c_name}" {lisp_name}) {ret_cffi}')
            for i, p in enumerate(fn["params"]):
                pname = c2l(p["name"]) or f"arg{i}"
                ptype = ":pointer" if i in sbv_params else type_to_cffi(p["type"], tdmap)
                lines.append(f"  ({pname} {ptype})")
            if sbv_return:
                lines.append("  (result-out :pointer)  ; caller allocates; filled with return value")
            lines.append(")")
        else:
            ret_cffi = type_to_cffi(fn["return_type"], tdmap)
            lines.append(f'(cffi:defcfun ("{name}" {lisp_name}) {ret_cffi}')
            for p in fn["params"]:
                pname = c2l(p["name"]) or "arg"
                ptype = type_to_cffi(p["type"], tdmap)
                lines.append(f"  ({pname} {ptype})")
            lines.append(")")

        # ----- ECL path (#+ecl) — no shims, struct-by-value handled natively -----
        lines.append("#+ecl")
        lines.append(f'(ffi:def-function ("{name}" {lisp_name})')
        lines.append("    (")
        for i, p in enumerate(fn["params"]):
            pname = c2l(p["name"]) or f"arg{i}"
            ptype = type_to_ecl(p["type"], tdmap)
            lines.append(f"     ({pname} {ptype})")
        lines.append("    )")
        ret_ecl = type_to_ecl(fn["return_type"], tdmap)
        if ret_ecl != ":void":
            lines.append(f"  :returning {ret_ecl}")
        lines.append(")")

        lines.append("")
    return "\n".join(lines)


def gen_shims_c(api: dict) -> str:
    tdmap = {td["name"]: td["underlying"] for td in api["typedefs"]}
    shim_fns = [f for f in api["functions"] if f["needs_shim"] and not f["variadic"]]

    defines = "\n".join(f"#define {d}" for d in api.get("defines", []))
    lines = [
        "/* nuklear_shims.c — Auto-generated C wrappers for struct-by-value functions.",
        " * Do not edit by hand — regenerate with:",
        " *   python nuklear2json.py nuklear.h nuklear_api.json",
        " *   python bindings2lisp.py nuklear_api.json .",
        " *",
        " * Compile with -I<path-to-nuklear.h-dir>.",
        " */",
        "",
        defines,
        "#define NK_IMPLEMENTATION",
        '#include "nuklear.h"',
        "",
    ]

    for fn in shim_fns:
        name = fn["name"]
        shim_name = f"cl_{name}"
        sbv_return = fn["struct_by_value_return"]
        sbv_params = set(fn["struct_by_value_params"])

        # Return type of shim
        shim_ret = "void" if sbv_return else c_type_str(fn["return_type"], tdmap)

        # Parameters of shim: by-value struct params become pointers
        param_parts = []
        for i, p in enumerate(fn["params"]):
            pname = p["name"] or f"arg{i}"
            if i in sbv_params:
                base = struct_type_name(p["type"])
                param_parts.append(f"{base}* {pname}")
            else:
                param_parts.append(f"{c_type_str(p['type'], tdmap)} {pname}")
        if sbv_return:
            ret_base = struct_type_name(fn["return_type"])
            param_parts.append(f"{ret_base}* result_out")

        params_str = ", ".join(param_parts) or "void"
        lines.append(f"{shim_ret} {shim_name}({params_str})")
        lines.append("{")

        # Build call to original function
        call_args = []
        for i, p in enumerate(fn["params"]):
            pname = p["name"] or f"arg{i}"
            call_args.append(f"*{pname}" if i in sbv_params else pname)

        call = f"{name}({', '.join(call_args)})"
        if sbv_return:
            lines.append(f"    *result_out = {call};")
        elif fn["return_type"].get("kind") == "void":
            lines.append(f"    {call};")
        else:
            lines.append(f"    return {call};")
        lines.append("}")
        lines.append("")

    return "\n".join(lines)


def gen_library() -> str:
    return """\
(in-package :nuklear)

;;; Foreign library definition.
;;; Build the shared library first:  make lib
;;; The bundled directory is pushed onto cffi:*foreign-library-directories*
;;; at load time so cffi:use-foreign-library finds it automatically.

#-ecl
(progn
  (cffi:define-foreign-library libnuklear
    (:darwin "libnuklear.dylib")
    (:unix   "libnuklear.so")
    (t       (:default "libnuklear")))

  (eval-when (:load-toplevel :execute)
    (let ((bundled (asdf:system-relative-pathname :cl-nuklear "")))
      (when (probe-file bundled)
        (pushnew (truename bundled) cffi:*foreign-library-directories* :test #'equal))))

  (cffi:use-foreign-library libnuklear))

#+ecl
(eval-when (:load-toplevel :execute)
  ;; ECL: load the shared library via native FFI.
  ;; Adjust the filename/extension for your platform as needed.
  (ffi:load-foreign-library "libnuklear.dylib"))
"""


def gen_asd() -> str:
    return """\
(asdf:defsystem "cl-nuklear"
  :description "CFFI/ECL bindings for the Nuklear immediate-mode GUI library"
  :version "0.1.0"
  :license "MIT"
  :depends-on (#-ecl :cffi)
  :serial t
  :components ((:file "package")
               (:file "library")    ; static — loads libnuklear shared lib
               (:file "enums")
               (:file "structs")
               (:file "functions")
               (:file "variadic")   ; static — Lisp wrappers for printf-style functions
               (:file "exports")    ; static — exports all home symbols from the nuklear package
               (:file "wrapper")))  ; static — ergonomic with-* lifecycle macros
"""


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

def main():
    if len(sys.argv) < 3:
        sys.exit(f"Usage: {sys.argv[0]} nuklear_api.json <project-root>")

    api_path = Path(sys.argv[1])
    root = Path(sys.argv[2])

    if not api_path.exists():
        sys.exit(f"File not found: {api_path}")

    api = json.loads(api_path.read_text())

    (root / "c").mkdir(exist_ok=True)

    outputs = {
        root / "package.lisp":    gen_package(),
        root / "library.lisp":    gen_library(),
        root / "enums.lisp":      gen_enums(api),
        root / "structs.lisp":    gen_structs(api),
        root / "functions.lisp":  gen_functions(api),
        root / "c" / "nuklear_shims.c": gen_shims_c(api),
        root / "cl-nuklear.asd":  gen_asd(),
    }

    for path, content in outputs.items():
        path.write_text(content)
        print(f"Wrote {path}", file=sys.stderr)

    shim_fns = [f for f in api["functions"] if f["needs_shim"] and not f["variadic"]]
    variadic = [f for f in api["functions"] if f["variadic"]]
    print("", file=sys.stderr)
    print("Summary:", file=sys.stderr)
    print(f"  {len(api['enums'])} enums", file=sys.stderr)
    print(f"  {len(api['structs'])} structs", file=sys.stderr)
    print(f"  {len(api['functions'])} functions", file=sys.stderr)
    print(f"    {len(shim_fns)} with C shims (struct-by-value)", file=sys.stderr)
    print(f"    {len(variadic)} variadic (skipped, wrap manually)", file=sys.stderr)


if __name__ == "__main__":
    main()
