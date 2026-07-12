#-ecl
(defpackage :nuklear
  (:use :cl :cffi)
  (:nicknames :nk))

#+ecl
(defpackage :nuklear
  (:use :cl :ffi)
  (:nicknames :nk))

(in-package :nuklear)
