(in-package :nuklear)

;;; Wrappers for nuklear's printf-style variadic functions.
;;; Each formats the string in Lisp (via FORMAT NIL) and calls the
;;; fixed-argument binding.  Struct-by-value arguments (color,
;;; offset) are passed as :pointer to caller-allocated CFFI structs,
;;; matching the shim signatures in nuklear_shims.c.

(defun nk-labelf (ctx flags fmt &rest args)
  #-ecl
  (cffi:with-foreign-string (s (apply #'format nil fmt args))
    (nk-label ctx s flags))
  #+ecl
  (let* ((str (apply #'format nil fmt args))
         (s (ffi:c-string str)))
    (unwind-protect
         (nk-label ctx s flags)
      (ffi:free-foreign-pointer s))))

(defun nk-labelf-colored (ctx flags color fmt &rest args)
  "COLOR — :pointer to an (cffi:with-foreign-object (c '(:struct nk-color)) ...) allocation."
  #-ecl
  (cffi:with-foreign-string (s (apply #'format nil fmt args))
    (nk-label-colored ctx s flags color))
  #+ecl
  (let* ((str (apply #'format nil fmt args))
         (s (ffi:c-string str)))
    (unwind-protect
         (nk-label-colored ctx s flags color)
      (ffi:free-foreign-pointer s))))

(defun nk-labelf-wrap (ctx fmt &rest args)
  #-ecl
  (cffi:with-foreign-string (s (apply #'format nil fmt args))
    (nk-label-wrap ctx s))
  #+ecl
  (let* ((str (apply #'format nil fmt args))
         (s (ffi:c-string str)))
    (unwind-protect
         (nk-label-wrap ctx s)
      (ffi:free-foreign-pointer s))))

(defun nk-labelf-colored-wrap (ctx color fmt &rest args)
  "COLOR — :pointer to an nk-color struct."
  #-ecl
  (cffi:with-foreign-string (s (apply #'format nil fmt args))
    (nk-label-colored-wrap ctx s color))
  #+ecl
  (let* ((str (apply #'format nil fmt args))
         (s (ffi:c-string str)))
    (unwind-protect
         (nk-label-colored-wrap ctx s color)
      (ffi:free-foreign-pointer s))))

(defun nk-tooltipf (ctx fmt &rest args)
  #-ecl
  (cffi:with-foreign-string (s (apply #'format nil fmt args))
    (nk-tooltip ctx s))
  #+ecl
  (let* ((str (apply #'format nil fmt args))
         (s (ffi:c-string str)))
    (unwind-protect
         (nk-tooltip ctx s)
      (ffi:free-foreign-pointer s))))

(defun nk-tooltipf-offset (ctx pos offset fmt &rest args)
  "OFFSET — :pointer to an nk-vec2 struct."
  #-ecl
  (cffi:with-foreign-string (s (apply #'format nil fmt args))
    (nk-tooltip-offset ctx s pos offset))
  #+ecl
  (let* ((str (apply #'format nil fmt args))
         (s (ffi:c-string str)))
    (unwind-protect
         (nk-tooltip-offset ctx s pos offset)
      (ffi:free-foreign-pointer s))))
