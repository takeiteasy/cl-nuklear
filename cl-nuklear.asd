(asdf:defsystem "cl-nuklear"
  :description "CFFI bindings for the Nuklear immediate-mode GUI library"
  :version "0.1.0"
  :license "MIT"
  :depends-on (:cffi)
  :serial t
  :components ((:file "package")
               (:file "library")    ; static — loads libnuklear shared lib
               (:file "enums")
               (:file "structs")
               (:file "functions")
               (:file "variadic")   ; static — Lisp wrappers for printf-style functions
               (:file "exports")    ; static — exports all home symbols from the nuklear package
               (:file "wrapper")))  ; static — ergonomic with-* lifecycle macros
