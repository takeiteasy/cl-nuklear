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
