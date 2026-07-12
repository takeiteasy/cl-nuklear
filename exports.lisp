;;; exports.lisp — Hand-maintained: export all CFFI bindings from the nuklear package.
;;; Runs after the generated files so every home symbol becomes externally accessible.
;;; Regenerating via `make bindings` does NOT touch this file.
(in-package :nuklear)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (do-symbols (s (find-package :nuklear))
    (when (eq (symbol-package s) (find-package :nuklear))
      (export s :nuklear))))
