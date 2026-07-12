(in-package :nuklear)

;;; Wrappers for nuklear's printf-style variadic functions.
;;; Each formats the string in Lisp (via FORMAT NIL) and calls the
;;; fixed-argument CFFI binding.  Struct-by-value arguments (color,
;;; offset) are passed as :pointer to caller-allocated CFFI structs,
;;; matching the shim signatures in nuklear_shims.c.

(defun nk-labelf (ctx flags fmt &rest args)
  (cffi:with-foreign-string (s (apply #'format nil fmt args))
    (nk-label ctx s flags)))

(defun nk-labelf-colored (ctx flags color fmt &rest args)
  "COLOR — :pointer to an (cffi:with-foreign-object (c '(:struct nk-color)) ...) allocation."
  (cffi:with-foreign-string (s (apply #'format nil fmt args))
    (nk-label-colored ctx s flags color)))

(defun nk-labelf-wrap (ctx fmt &rest args)
  (cffi:with-foreign-string (s (apply #'format nil fmt args))
    (nk-label-wrap ctx s)))

(defun nk-labelf-colored-wrap (ctx color fmt &rest args)
  "COLOR — :pointer to an nk-color struct."
  (cffi:with-foreign-string (s (apply #'format nil fmt args))
    (nk-label-colored-wrap ctx s color)))

(defun nk-tooltipf (ctx fmt &rest args)
  (cffi:with-foreign-string (s (apply #'format nil fmt args))
    (nk-tooltip ctx s)))

(defun nk-tooltipf-offset (ctx pos offset fmt &rest args)
  "OFFSET — :pointer to an nk-vec2 struct."
  (cffi:with-foreign-string (s (apply #'format nil fmt args))
    (nk-tooltip-offset ctx s pos offset)))
