;;; wrapper.lisp — Hand-maintained ergonomic wrapper over the raw nuklear bindings.
;;; Provides with-* lifecycle macros and convenience constructors.
;;; See https://github.com/borodust/bodge-nuklear for inspiration.
;;;
;;; NOTE: This is a minimal initial implementation. A follow-up ticket covers expanding
;;; coverage to styling, layouts, tree/combo widgets, and input handling.
(in-package :nuklear)

;;; ---------------------------------------------------------------------------
;;; Context lifecycle
;;; ---------------------------------------------------------------------------

(defmacro with-context ((ctx-var font-atlas-var &key (font-size 13.0)) &body body)
  "Bake the default font atlas, init a nuklear context, and run BODY.
CTX-VAR is bound to a foreign nk_context pointer.
FONT-ATLAS-VAR is bound to a foreign nk_font_atlas pointer.

The atlas backing memory is valid for the lifetime of BODY.
BODY receives a second value: the baked pixel data pointer and dimensions via
  (values pixel-ptr baked-width baked-height)
stored as dynamic vars *atlas-pixels*, *atlas-width*, *atlas-height*.

NOTE: Callers must upload the atlas pixels to a GPU texture during BODY, before
the atlas memory is cleaned up. The renderer's MAKE-NUKLEAR-RENDERER handles this."
  (let ((font (gensym "FONT"))
        (w (gensym "W"))
        (h (gensym "H"))
        (pixels (gensym "PIXELS")))
    #-ecl
    `(cffi:with-foreign-objects ((,ctx-var '(:struct nk-context))
                                 (,font-atlas-var '(:struct nk-font-atlas))
                                 (,w :int)
                                 (,h :int))
       (nk-font-atlas-init-default ,font-atlas-var)
       (nk-font-atlas-begin ,font-atlas-var)
       (let* ((,font (nk-font-atlas-add-default ,font-atlas-var ,font-size (cffi:null-pointer)))
              (,pixels (nk-font-atlas-bake ,font-atlas-var ,w ,h :nk-font-atlas-rgba32)))
         (declare (ignorable ,pixels))
         (let ((*atlas-pixels* ,pixels)
               (*atlas-width*  (cffi:mem-ref ,w :int))
               (*atlas-height* (cffi:mem-ref ,h :int)))
           (declare (special *atlas-pixels* *atlas-width* *atlas-height*))
           (unwind-protect
               (progn ,@body)
             (nk-font-atlas-cleanup ,font-atlas-var)
             (nk-free ,ctx-var)))
         (let ((handle-ptr (cffi:foreign-slot-pointer ,font '(:struct nk-font) 'handle)))
           (nk-init-default ,ctx-var handle-ptr))))
    #+ecl
    `(let* ((,ctx-var (ffi:allocate-foreign-object '(:struct nk-context)))
            (,font-atlas-var (ffi:allocate-foreign-object '(:struct nk-font-atlas)))
            (,w (ffi:allocate-foreign-object :int))
            (,h (ffi:allocate-foreign-object :int)))
       (unwind-protect
            (progn
              (nk-font-atlas-init-default ,font-atlas-var)
              (nk-font-atlas-begin ,font-atlas-var)
              (let* ((,font (nk-font-atlas-add-default ,font-atlas-var ,font-size
                                                        (ffi:make-foreign-pointer :void :address 0)))
                     (,pixels (nk-font-atlas-bake ,font-atlas-var ,w ,h :nk-font-atlas-rgba32)))
                (declare (ignorable ,pixels))
                (let ((*atlas-pixels* ,pixels)
                      (*atlas-width*  (ffi:deref-pointer ,w :int))
                      (*atlas-height* (ffi:deref-pointer ,h :int)))
                  (declare (special *atlas-pixels* *atlas-width* *atlas-height*))
                  (unwind-protect
                      (progn ,@body)
                    (nk-font-atlas-cleanup ,font-atlas-var)
                    (nk-free ,ctx-var)))
                (nk-init-default ,ctx-var ,font)))
         (ffi:deallocate-foreign-object ,ctx-var)
         (ffi:deallocate-foreign-object ,font-atlas-var)
         (ffi:deallocate-foreign-object ,w)
         (ffi:deallocate-foreign-object ,h)))))

;;; ---------------------------------------------------------------------------
;;; Panel / window macros
;;; ---------------------------------------------------------------------------

(defmacro with-panel ((ctx bounds-x bounds-y bounds-w bounds-h title &key (flags 0)) &body body)
  "Begin a nuklear panel/window and run BODY; calls nk-end on exit.
BOUNDS-* are pixel coordinates. FLAGS is a bitmask of nk-panel-flags values."
  (let ((rect (gensym "RECT"))
        (result (gensym "RESULT")))
    #-ecl
    `(cffi:with-foreign-object (,rect '(:struct nk-rect))
       (setf (cffi:foreign-slot-value ,rect '(:struct nk-rect) 'x) (float ,bounds-x)
             (cffi:foreign-slot-value ,rect '(:struct nk-rect) 'y) (float ,bounds-y)
             (cffi:foreign-slot-value ,rect '(:struct nk-rect) 'w) (float ,bounds-w)
             (cffi:foreign-slot-value ,rect '(:struct nk-rect) 'h) (float ,bounds-h))
       (let ((,result (nk-begin ,ctx ,title ,rect ,flags)))
         (unwind-protect
             (when (= ,result 1)
               ,@body)
           (nk-end ,ctx))))
    #+ecl
    `(let* ((,rect (ffi:allocate-foreign-object '(:struct nk-rect))))
       (setf (nk-rect-x ,rect) (float ,bounds-x)
             (nk-rect-y ,rect) (float ,bounds-y)
             (nk-rect-w ,rect) (float ,bounds-w)
             (nk-rect-h ,rect) (float ,bounds-h))
       (let ((,result (nk-begin ,ctx ,title ,rect ,flags)))
         (unwind-protect
             (when (= ,result 1)
               ,@body)
           (nk-end ,ctx))
         (ffi:deallocate-foreign-object ,rect)))))

;;; ---------------------------------------------------------------------------
;;; nk_buffer scoped allocation
;;; ---------------------------------------------------------------------------

(defmacro with-nk-buffer ((var) &body body)
  "Bind VAR to a default-allocated nk_buffer; frees it on exit."
  #-ecl
  `(cffi:with-foreign-object (,var '(:struct nk-buffer))
     (nk-buffer-init-default ,var)
     (unwind-protect (progn ,@body)
       (nk-buffer-free ,var)))
  #+ecl
  `(let ((,var (ffi:allocate-foreign-object '(:struct nk-buffer))))
     (nk-buffer-init-default ,var)
     (unwind-protect (progn ,@body)
       (nk-buffer-free ,var)
       (ffi:deallocate-foreign-object ,var))))

;;; ---------------------------------------------------------------------------
;;; Convenience constructors for by-value types (allocate on stack)
;;; ---------------------------------------------------------------------------

(defmacro with-color ((var r g b a) &body body)
  "Bind VAR to a foreign nk_color struct with the given RGBA byte values."
  #-ecl
  `(cffi:with-foreign-object (,var '(:struct nk-color))
     (setf (cffi:foreign-slot-value ,var '(:struct nk-color) 'r) ,r
           (cffi:foreign-slot-value ,var '(:struct nk-color) 'g) ,g
           (cffi:foreign-slot-value ,var '(:struct nk-color) 'b) ,b
           (cffi:foreign-slot-value ,var '(:struct nk-color) 'a) ,a)
     ,@body)
  #+ecl
  `(let ((,var (ffi:allocate-foreign-object '(:struct nk-color))))
     (setf (nk-color-r ,var) ,r
           (nk-color-g ,var) ,g
           (nk-color-b ,var) ,b
           (nk-color-a ,var) ,a)
     (unwind-protect
          (progn ,@body)
       (ffi:deallocate-foreign-object ,var))))

(defmacro with-vec2 ((var x y) &body body)
  "Bind VAR to a foreign nk_vec2 struct."
  #-ecl
  `(cffi:with-foreign-object (,var '(:struct nk-vec2))
     (setf (cffi:foreign-slot-value ,var '(:struct nk-vec2) 'x) (float ,x)
           (cffi:foreign-slot-value ,var '(:struct nk-vec2) 'y) (float ,y))
     ,@body)
  #+ecl
  `(let ((,var (ffi:allocate-foreign-object '(:struct nk-vec2))))
     (setf (nk-vec2-x ,var) (float ,x)
           (nk-vec2-y ,var) (float ,y))
     (unwind-protect
          (progn ,@body)
       (ffi:deallocate-foreign-object ,var))))
