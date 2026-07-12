#!/usr/bin/env python3
"""
nuklear2json.py — Parse nuklear.h with libclang and emit a JSON API description.

Usage:
    python nuklear2json.py nuklear.h [output.json]
    Defaults output to nuklear_api.json next to nuklear.h.

Requirements:
    pip install libclang
"""

import sys
import json
from pathlib import Path

try:
    import clang.cindex as ci
except ImportError:
    sys.exit("Error: install libclang bindings with:  pip install libclang")


NUKLEAR_DEFINES = [
    "NK_INCLUDE_FIXED_TYPES",
    "NK_INCLUDE_DEFAULT_ALLOCATOR",
    "NK_INCLUDE_STANDARD_IO",
    "NK_INCLUDE_STANDARD_VARARGS",
    "NK_INCLUDE_VERTEX_BUFFER_OUTPUT",
    "NK_INCLUDE_FONT_BAKING",
    "NK_INCLUDE_DEFAULT_FONT",
    "NK_INCLUDE_COMMAND_USERDATA",
]


def type_to_json(ty, depth=0):
    """Recursively convert a clang Type to a JSON-serialisable dict."""
    if depth > 8:
        return {"kind": "opaque", "spelling": ty.spelling}

    kind = ty.kind

    # Elaborated types wrap "struct foo" / typedef spellings — unwrap to the named type.
    if kind == ci.TypeKind.ELABORATED:
        return type_to_json(ty.get_named_type(), depth)

    # Unexposed usually means a typedef or elaborated type libclang didn't resolve further.
    if kind == ci.TypeKind.UNEXPOSED:
        named = ty.get_named_type()
        if named.kind != ci.TypeKind.UNEXPOSED:
            return type_to_json(named, depth)
        canon = ty.get_canonical()
        if canon.kind != ci.TypeKind.UNEXPOSED:
            return type_to_json(canon, depth)
        return {"kind": "opaque", "spelling": ty.spelling}

    if kind == ci.TypeKind.VOID:
        return {"kind": "void"}

    if kind == ci.TypeKind.BOOL:
        return {"kind": "primitive", "name": "bool"}

    def prim(name):
        node = {"kind": "primitive", "name": name}
        if ty.is_const_qualified():
            node["const"] = True
        return node

    if kind in (ci.TypeKind.CHAR_U, ci.TypeKind.UCHAR):
        return prim("unsigned char")

    if kind in (ci.TypeKind.CHAR_S, ci.TypeKind.SCHAR):
        return prim("char")

    if kind == ci.TypeKind.SHORT:
        return prim("short")

    if kind == ci.TypeKind.USHORT:
        return prim("unsigned short")

    if kind == ci.TypeKind.INT:
        return prim("int")

    if kind == ci.TypeKind.UINT:
        return prim("unsigned int")

    if kind == ci.TypeKind.LONG:
        return prim("long")

    if kind == ci.TypeKind.ULONG:
        return prim("unsigned long")

    if kind == ci.TypeKind.LONGLONG:
        return prim("long long")

    if kind == ci.TypeKind.ULONGLONG:
        return prim("unsigned long long")

    if kind == ci.TypeKind.FLOAT:
        return prim("float")

    if kind == ci.TypeKind.DOUBLE:
        return prim("double")

    if kind == ci.TypeKind.POINTER:
        pointee = ty.get_pointee()
        if pointee.kind in (ci.TypeKind.FUNCTIONPROTO, ci.TypeKind.FUNCTIONNOPROTO):
            return {"kind": "function_pointer", "spelling": ty.spelling}
        node = {"kind": "pointer", "pointee": type_to_json(pointee, depth + 1)}
        if ty.is_const_qualified():
            node["const"] = True
        return node

    if kind == ci.TypeKind.RECORD:
        decl = ty.get_declaration()
        return {
            "kind": "record",
            "name": decl.spelling or ty.spelling,
            "by_value": True,
        }

    if kind == ci.TypeKind.ENUM:
        decl = ty.get_declaration()
        return {"kind": "enum", "name": decl.spelling or ty.spelling}

    if kind == ci.TypeKind.TYPEDEF:
        canon = ty.get_canonical()
        result = {"kind": "typedef", "name": ty.spelling}
        if canon.kind == ci.TypeKind.RECORD:
            result["canonical_kind"] = "record"
            result["canonical_name"] = canon.get_declaration().spelling
        else:
            # Store the fully-resolved canonical so the generator can use it
            # as a fallback when the typedef chain isn't in our map.
            canon_json = type_to_json(canon, depth + 1)
            if canon_json.get("kind") not in ("typedef", "unknown", "opaque"):
                result["canonical"] = canon_json
        return result

    if kind == ci.TypeKind.CONSTANTARRAY:
        return {
            "kind": "array",
            "element": type_to_json(ty.element_type, depth + 1),
            "size": ty.element_count,
        }

    if kind == ci.TypeKind.INCOMPLETEARRAY:
        return {
            "kind": "array",
            "element": type_to_json(ty.element_type, depth + 1),
            "size": None,
        }

    if kind in (ci.TypeKind.FUNCTIONPROTO, ci.TypeKind.FUNCTIONNOPROTO):
        return {"kind": "function_pointer", "spelling": ty.spelling}

    return {"kind": "unknown", "spelling": ty.spelling, "type_kind": str(kind)}


def is_struct_by_value(ty_json):
    """True if this type JSON node is a struct/union passed by value (not via pointer)."""
    kind = ty_json.get("kind")
    if kind == "record":
        return True
    if kind == "typedef" and ty_json.get("canonical_kind") == "record":
        return True
    return False


def clang_resource_dir() -> str | None:
    """Ask the system clang for its resource directory (provides stdarg.h etc.)."""
    import subprocess
    try:
        out = subprocess.check_output(
            ["clang", "-print-resource-dir"], text=True
        ).strip()
        return out if out else None
    except Exception:
        return None


def parse_header(header_path: Path) -> dict:
    index = ci.Index.create()

    args = ["-x", "c", "-std=c99"]
    resource_dir = clang_resource_dir()
    if resource_dir:
        args += ["-resource-dir", resource_dir]
    for d in NUKLEAR_DEFINES:
        args.append(f"-D{d}")

    tu = index.parse(
        str(header_path),
        args=args,
        options=(
            ci.TranslationUnit.PARSE_DETAILED_PROCESSING_RECORD
            | ci.TranslationUnit.PARSE_SKIP_FUNCTION_BODIES
        ),
    )

    errors = [d for d in tu.diagnostics if d.severity >= ci.Diagnostic.Error]
    if errors:
        print("  clang parse errors (may be harmless):", file=sys.stderr)
        for d in errors[:5]:
            print(f"    {d.spelling}", file=sys.stderr)

    header_realpath = str(header_path.resolve())

    functions = []
    structs = []
    enums = []
    typedefs = []

    seen_structs: set[str] = set()
    seen_enums: set[str] = set()
    seen_functions: set[str] = set()
    seen_typedefs: set[str] = set()

    def in_nuklear(cursor) -> bool:
        loc = cursor.location
        return bool(loc.file and str(Path(loc.file.name).resolve()) == header_realpath)

    def visit_struct(cursor, name_override=None):
        name = name_override or cursor.spelling
        if not name or name in seen_structs:
            return
        fields = []
        for child in cursor.get_children():
            if child.kind == ci.CursorKind.FIELD_DECL:
                fields.append({
                    "name": child.spelling,
                    "type": type_to_json(child.type),
                    "bit_width": child.get_bitfield_width() if child.is_bitfield() else None,
                })
        if not fields:
            return  # forward declaration, skip
        seen_structs.add(name)
        structs.append({
            "name": name,
            "kind": cursor.kind.name.lower().replace("_decl", ""),
            "fields": fields,
        })

    def visit_enum(cursor, name_override=None):
        name = name_override or cursor.spelling
        if not name or name in seen_enums:
            return
        constants = []
        for child in cursor.get_children():
            if child.kind == ci.CursorKind.ENUM_CONSTANT_DECL:
                constants.append({"name": child.spelling, "value": child.enum_value})
        if not constants:
            return
        seen_enums.add(name)
        enums.append({"name": name, "constants": constants})

    def visit_function(cursor):
        name = cursor.spelling
        if not name or name in seen_functions:
            return
        if not name.startswith("nk_"):
            return
        seen_functions.add(name)

        ret = type_to_json(cursor.result_type)
        params = []
        for i, arg in enumerate(cursor.get_arguments()):
            params.append({
                "name": arg.spelling or f"arg{i}",
                "type": type_to_json(arg.type),
            })

        sbv_return = is_struct_by_value(ret)
        sbv_params = [i for i, p in enumerate(params) if is_struct_by_value(p["type"])]

        functions.append({
            "name": name,
            "return_type": ret,
            "params": params,
            "variadic": cursor.type.is_function_variadic(),
            "struct_by_value_return": sbv_return,
            "struct_by_value_params": sbv_params,
            "needs_shim": sbv_return or bool(sbv_params),
        })

    def visit_typedef(cursor):
        name = cursor.spelling
        if not name or name in seen_typedefs:
            return
        seen_typedefs.add(name)
        typedefs.append({
            "name": name,
            "underlying": type_to_json(cursor.underlying_typedef_type),
        })
        # Typedef wrapping an anonymous struct or enum: expose it under the typedef name
        for child in cursor.get_children():
            if child.kind in (ci.CursorKind.STRUCT_DECL, ci.CursorKind.UNION_DECL):
                visit_struct(child, name_override=name if not child.spelling else None)
            elif child.kind == ci.CursorKind.ENUM_DECL:
                visit_enum(child, name_override=name if not child.spelling else None)

    for cursor in tu.cursor.get_children():
        if not in_nuklear(cursor):
            continue
        if cursor.kind == ci.CursorKind.STRUCT_DECL:
            visit_struct(cursor)
        elif cursor.kind == ci.CursorKind.UNION_DECL:
            visit_struct(cursor)
        elif cursor.kind == ci.CursorKind.ENUM_DECL:
            visit_enum(cursor)
        elif cursor.kind == ci.CursorKind.FUNCTION_DECL:
            visit_function(cursor)
        elif cursor.kind == ci.CursorKind.TYPEDEF_DECL:
            visit_typedef(cursor)

    return {
        "source": str(header_path),
        "defines": NUKLEAR_DEFINES,
        "enums": enums,
        "structs": structs,
        "typedefs": typedefs,
        "functions": functions,
    }


def main():
    if len(sys.argv) < 2:
        sys.exit(f"Usage: {sys.argv[0]} nuklear.h [output.json]")

    header = Path(sys.argv[1])
    if not header.exists():
        sys.exit(f"File not found: {header}")

    output = Path(sys.argv[2]) if len(sys.argv) > 2 else header.parent / "nuklear_api.json"

    print(f"Parsing {header} ...", file=sys.stderr)
    api = parse_header(header)

    shim_count = sum(1 for f in api["functions"] if f["needs_shim"])
    variadic_count = sum(1 for f in api["functions"] if f["variadic"])
    print(f"  {len(api['enums'])} enums", file=sys.stderr)
    print(f"  {len(api['structs'])} structs", file=sys.stderr)
    print(f"  {len(api['typedefs'])} typedefs", file=sys.stderr)
    print(f"  {len(api['functions'])} functions  "
          f"({shim_count} need shims, {variadic_count} variadic)", file=sys.stderr)

    output.write_text(json.dumps(api, indent=2))
    print(f"Wrote {output}", file=sys.stderr)


if __name__ == "__main__":
    main()
