(in-package :nuklear)

;;; Structure definitions

; nk_color
#-ecl
(cffi:defcstruct nk-color
  (r :unsigned-char)
  (g :unsigned-char)
  (b :unsigned-char)
  (a :unsigned-char)
)
#+ecl
(ffi:def-c-struct nk-color
    (r :unsigned-char)
    (g :unsigned-char)
    (b :unsigned-char)
    (a :unsigned-char)
)

; nk_colorf
#-ecl
(cffi:defcstruct nk-colorf
  (r :float)
  (g :float)
  (b :float)
  (a :float)
)
#+ecl
(ffi:def-c-struct nk-colorf
    (r :float)
    (g :float)
    (b :float)
    (a :float)
)

; nk_vec2
#-ecl
(cffi:defcstruct nk-vec2
  (x :float)
  (y :float)
)
#+ecl
(ffi:def-c-struct nk-vec2
    (x :float)
    (y :float)
)

; nk_vec2i
#-ecl
(cffi:defcstruct nk-vec2i
  (x :short)
  (y :short)
)
#+ecl
(ffi:def-c-struct nk-vec2i
    (x :short)
    (y :short)
)

; nk_rect
#-ecl
(cffi:defcstruct nk-rect
  (x :float)
  (y :float)
  (w :float)
  (h :float)
)
#+ecl
(ffi:def-c-struct nk-rect
    (x :float)
    (y :float)
    (w :float)
    (h :float)
)

; nk_recti
#-ecl
(cffi:defcstruct nk-recti
  (x :short)
  (y :short)
  (w :short)
  (h :short)
)
#+ecl
(ffi:def-c-struct nk-recti
    (x :short)
    (y :short)
    (w :short)
    (h :short)
)

; nk_handle
#-ecl
(cffi:defcunion nk-handle
  (ptr :pointer)
  (id :int)
)
#+ecl
(ffi:def-c-union nk-handle
    (ptr :pointer)
    (id :int)
)

; nk_image
#-ecl
(cffi:defcstruct nk-image
  (handle (:struct nk-handle))
  (w :unsigned-short)
  (h :unsigned-short)
  (region (:array :unsigned-short 4))
)
#+ecl
(ffi:def-c-struct nk-image
    (handle (:struct nk-handle))
    (w :unsigned-short)
    (h :unsigned-short)
    (region :pointer)
)

; nk_nine_slice
#-ecl
(cffi:defcstruct nk-nine-slice
  (img (:struct nk-image))
  (l :unsigned-short)
  (t :unsigned-short)
  (r :unsigned-short)
  (b :unsigned-short)
)
#+ecl
(ffi:def-c-struct nk-nine-slice
    (img (:struct nk-image))
    (l :unsigned-short)
    (t :unsigned-short)
    (r :unsigned-short)
    (b :unsigned-short)
)

; nk_cursor
#-ecl
(cffi:defcstruct nk-cursor
  (img (:struct nk-image))
  (size (:struct nk-vec2))
  (offset (:struct nk-vec2))
)
#+ecl
(ffi:def-c-struct nk-cursor
    (img (:struct nk-image))
    (size (:struct nk-vec2))
    (offset (:struct nk-vec2))
)

; nk_scroll
#-ecl
(cffi:defcstruct nk-scroll
  (x :unsigned-int)
  (y :unsigned-int)
)
#+ecl
(ffi:def-c-struct nk-scroll
    (x :unsigned-int)
    (y :unsigned-int)
)

; nk_allocator
#-ecl
(cffi:defcstruct nk-allocator
  (userdata (:struct nk-handle))
  (alloc :pointer)
  (free :pointer)
)
#+ecl
(ffi:def-c-struct nk-allocator
    (userdata (:struct nk-handle))
    (alloc :pointer)
    (free :pointer)
)

; nk_draw_null_texture
#-ecl
(cffi:defcstruct nk-draw-null-texture
  (texture (:struct nk-handle))
  (uv (:struct nk-vec2))
)
#+ecl
(ffi:def-c-struct nk-draw-null-texture
    (texture (:struct nk-handle))
    (uv (:struct nk-vec2))
)

; nk_convert_config
#-ecl
(cffi:defcstruct nk-convert-config
  (global-alpha :float)
  (line-AA nk-anti-aliasing)
  (shape-AA nk-anti-aliasing)
  (circle-segment-count :unsigned-int)
  (arc-segment-count :unsigned-int)
  (curve-segment-count :unsigned-int)
  (tex-null (:struct nk-draw-null-texture))
  (vertex-layout :pointer)
  (vertex-size :unsigned-long)
  (vertex-alignment :unsigned-long)
)
#+ecl
(ffi:def-c-struct nk-convert-config
    (global-alpha :float)
    (line-AA :int)
    (shape-AA :int)
    (circle-segment-count :unsigned-int)
    (arc-segment-count :unsigned-int)
    (curve-segment-count :unsigned-int)
    (tex-null (:struct nk-draw-null-texture))
    (vertex-layout :pointer)
    (vertex-size :unsigned-long)
    (vertex-alignment :unsigned-long)
)

; nk_list_view
#-ecl
(cffi:defcstruct nk-list-view
  (begin :int)
  (end :int)
  (count :int)
  (total-height :int)
  (ctx :pointer)
  (scroll-pointer :pointer)
  (scroll-value :unsigned-int)
)
#+ecl
(ffi:def-c-struct nk-list-view
    (begin :int)
    (end :int)
    (count :int)
    (total-height :int)
    (ctx :pointer)
    (scroll-pointer :pointer)
    (scroll-value :unsigned-int)
)

; nk_user_font_glyph
#-ecl
(cffi:defcstruct nk-user-font-glyph
  (uv (:array (:struct nk-vec2) 2))
  (offset (:struct nk-vec2))
  (width :float)
  (height :float)
  (xadvance :float)
)
#+ecl
(ffi:def-c-struct nk-user-font-glyph
    (uv :pointer)
    (offset (:struct nk-vec2))
    (width :float)
    (height :float)
    (xadvance :float)
)

; nk_user_font
#-ecl
(cffi:defcstruct nk-user-font
  (userdata (:struct nk-handle))
  (height :float)
  (width :pointer)
  (query :pointer)
  (texture (:struct nk-handle))
)
#+ecl
(ffi:def-c-struct nk-user-font
    (userdata (:struct nk-handle))
    (height :float)
    (width :pointer)
    (query :pointer)
    (texture (:struct nk-handle))
)

; nk_baked_font
#-ecl
(cffi:defcstruct nk-baked-font
  (height :float)
  (ascent :float)
  (descent :float)
  (glyph-offset :unsigned-int)
  (glyph-count :unsigned-int)
  (ranges :pointer)
)
#+ecl
(ffi:def-c-struct nk-baked-font
    (height :float)
    (ascent :float)
    (descent :float)
    (glyph-offset :unsigned-int)
    (glyph-count :unsigned-int)
    (ranges :pointer)
)

; nk_font_config
#-ecl
(cffi:defcstruct nk-font-config
  (next :pointer)
  (ttf-blob :pointer)
  (ttf-size :unsigned-long)
  (ttf-data-owned-by-atlas :unsigned-char)
  (merge-mode :unsigned-char)
  (pixel-snap :unsigned-char)
  (oversample-v :unsigned-char)
  (oversample-h :unsigned-char)
  (padding (:array :unsigned-char 3))
  (size :float)
  (coord-type nk-font-coord-type)
  (spacing (:struct nk-vec2))
  (range :pointer)
  (font :pointer)
  (fallback-glyph :unsigned-int)
  (n :pointer)
  (p :pointer)
)
#+ecl
(ffi:def-c-struct nk-font-config
    (next :pointer)
    (ttf-blob :pointer)
    (ttf-size :unsigned-long)
    (ttf-data-owned-by-atlas :unsigned-char)
    (merge-mode :unsigned-char)
    (pixel-snap :unsigned-char)
    (oversample-v :unsigned-char)
    (oversample-h :unsigned-char)
    (padding :pointer)
    (size :float)
    (coord-type :int)
    (spacing (:struct nk-vec2))
    (range :pointer)
    (font :pointer)
    (fallback-glyph :unsigned-int)
    (n :pointer)
    (p :pointer)
)

; nk_font_glyph
#-ecl
(cffi:defcstruct nk-font-glyph
  (codepoint :unsigned-int)
  (xadvance :float)
  (x0 :float)
  (y0 :float)
  (x1 :float)
  (y1 :float)
  (w :float)
  (h :float)
  (u0 :float)
  (v0 :float)
  (u1 :float)
  (v1 :float)
)
#+ecl
(ffi:def-c-struct nk-font-glyph
    (codepoint :unsigned-int)
    (xadvance :float)
    (x0 :float)
    (y0 :float)
    (x1 :float)
    (y1 :float)
    (w :float)
    (h :float)
    (u0 :float)
    (v0 :float)
    (u1 :float)
    (v1 :float)
)

; nk_font
#-ecl
(cffi:defcstruct nk-font
  (next :pointer)
  (handle (:struct nk-user-font))
  (info (:struct nk-baked-font))
  (scale :float)
  (glyphs :pointer)
  (fallback :pointer)
  (fallback-codepoint :unsigned-int)
  (texture (:struct nk-handle))
  (config :pointer)
)
#+ecl
(ffi:def-c-struct nk-font
    (next :pointer)
    (handle (:struct nk-user-font))
    (info (:struct nk-baked-font))
    (scale :float)
    (glyphs :pointer)
    (fallback :pointer)
    (fallback-codepoint :unsigned-int)
    (texture (:struct nk-handle))
    (config :pointer)
)

; nk_font_atlas
#-ecl
(cffi:defcstruct nk-font-atlas
  (pixel :pointer)
  (tex-width :int)
  (tex-height :int)
  (permanent (:struct nk-allocator))
  (temporary (:struct nk-allocator))
  (custom (:struct nk-recti))
  (cursors (:array (:struct nk-cursor) 7))
  (glyph-count :int)
  (glyphs :pointer)
  (default-font :pointer)
  (fonts :pointer)
  (config :pointer)
  (font-num :int)
)
#+ecl
(ffi:def-c-struct nk-font-atlas
    (pixel :pointer)
    (tex-width :int)
    (tex-height :int)
    (permanent (:struct nk-allocator))
    (temporary (:struct nk-allocator))
    (custom (:struct nk-recti))
    (cursors :pointer)
    (glyph-count :int)
    (glyphs :pointer)
    (default-font :pointer)
    (fonts :pointer)
    (config :pointer)
    (font-num :int)
)

; nk_memory_status
#-ecl
(cffi:defcstruct nk-memory-status
  (memory :pointer)
  (type :unsigned-int)
  (size :unsigned-long)
  (allocated :unsigned-long)
  (needed :unsigned-long)
  (calls :unsigned-long)
)
#+ecl
(ffi:def-c-struct nk-memory-status
    (memory :pointer)
    (type :unsigned-int)
    (size :unsigned-long)
    (allocated :unsigned-long)
    (needed :unsigned-long)
    (calls :unsigned-long)
)

; nk_buffer_marker
#-ecl
(cffi:defcstruct nk-buffer-marker
  (active :int)
  (offset :unsigned-long)
)
#+ecl
(ffi:def-c-struct nk-buffer-marker
    (active :int)
    (offset :unsigned-long)
)

; nk_memory
#-ecl
(cffi:defcstruct nk-memory
  (ptr :pointer)
  (size :unsigned-long)
)
#+ecl
(ffi:def-c-struct nk-memory
    (ptr :pointer)
    (size :unsigned-long)
)

; nk_buffer
#-ecl
(cffi:defcstruct nk-buffer
  (marker (:array (:struct nk-buffer-marker) 2))
  (pool (:struct nk-allocator))
  (type nk-allocation-type)
  (memory (:struct nk-memory))
  (grow-factor :float)
  (allocated :unsigned-long)
  (needed :unsigned-long)
  (calls :unsigned-long)
  (size :unsigned-long)
)
#+ecl
(ffi:def-c-struct nk-buffer
    (marker :pointer)
    (pool (:struct nk-allocator))
    (type :int)
    (memory (:struct nk-memory))
    (grow-factor :float)
    (allocated :unsigned-long)
    (needed :unsigned-long)
    (calls :unsigned-long)
    (size :unsigned-long)
)

; nk_str
#-ecl
(cffi:defcstruct nk-str
  (buffer (:struct nk-buffer))
  (len :int)
)
#+ecl
(ffi:def-c-struct nk-str
    (buffer (:struct nk-buffer))
    (len :int)
)

; nk_clipboard
#-ecl
(cffi:defcstruct nk-clipboard
  (userdata (:struct nk-handle))
  (paste :pointer)
  (copy :pointer)
)
#+ecl
(ffi:def-c-struct nk-clipboard
    (userdata (:struct nk-handle))
    (paste :pointer)
    (copy :pointer)
)

; nk_text_undo_record
#-ecl
(cffi:defcstruct nk-text-undo-record
  (where :int)
  (insert-length :short)
  (delete-length :short)
  (char-storage :short)
)
#+ecl
(ffi:def-c-struct nk-text-undo-record
    (where :int)
    (insert-length :short)
    (delete-length :short)
    (char-storage :short)
)

; nk_text_undo_state
#-ecl
(cffi:defcstruct nk-text-undo-state
  (undo-rec (:array (:struct nk-text-undo-record) 99))
  (undo-char (:array :unsigned-int 999))
  (undo-point :short)
  (redo-point :short)
  (undo-char-point :short)
  (redo-char-point :short)
)
#+ecl
(ffi:def-c-struct nk-text-undo-state
    (undo-rec :pointer)
    (undo-char :pointer)
    (undo-point :short)
    (redo-point :short)
    (undo-char-point :short)
    (redo-char-point :short)
)

; nk_text_edit
#-ecl
(cffi:defcstruct nk-text-edit
  (clip (:struct nk-clipboard))
  (string (:struct nk-str))
  (filter :pointer)
  (scrollbar (:struct nk-vec2))
  (cursor :int)
  (select-start :int)
  (select-end :int)
  (mode :unsigned-char)
  (cursor-at-end-of-line :unsigned-char)
  (initialized :unsigned-char)
  (has-preferred-x :unsigned-char)
  (single-line :unsigned-char)
  (active :unsigned-char)
  (padding1 :unsigned-char)
  (preferred-x :float)
  (undo (:struct nk-text-undo-state))
)
#+ecl
(ffi:def-c-struct nk-text-edit
    (clip (:struct nk-clipboard))
    (string (:struct nk-str))
    (filter :pointer)
    (scrollbar (:struct nk-vec2))
    (cursor :int)
    (select-start :int)
    (select-end :int)
    (mode :unsigned-char)
    (cursor-at-end-of-line :unsigned-char)
    (initialized :unsigned-char)
    (has-preferred-x :unsigned-char)
    (single-line :unsigned-char)
    (active :unsigned-char)
    (padding1 :unsigned-char)
    (preferred-x :float)
    (undo (:struct nk-text-undo-state))
)

; nk_command
#-ecl
(cffi:defcstruct nk-command
  (type nk-command-type)
  (next :unsigned-long)
  (userdata (:struct nk-handle))
)
#+ecl
(ffi:def-c-struct nk-command
    (type :int)
    (next :unsigned-long)
    (userdata (:struct nk-handle))
)

; nk_command_scissor
#-ecl
(cffi:defcstruct nk-command-scissor
  (header (:struct nk-command))
  (x :short)
  (y :short)
  (w :unsigned-short)
  (h :unsigned-short)
)
#+ecl
(ffi:def-c-struct nk-command-scissor
    (header (:struct nk-command))
    (x :short)
    (y :short)
    (w :unsigned-short)
    (h :unsigned-short)
)

; nk_command_line
#-ecl
(cffi:defcstruct nk-command-line
  (header (:struct nk-command))
  (line-thickness :unsigned-short)
  (begin (:struct nk-vec2i))
  (end (:struct nk-vec2i))
  (color (:struct nk-color))
)
#+ecl
(ffi:def-c-struct nk-command-line
    (header (:struct nk-command))
    (line-thickness :unsigned-short)
    (begin (:struct nk-vec2i))
    (end (:struct nk-vec2i))
    (color (:struct nk-color))
)

; nk_command_curve
#-ecl
(cffi:defcstruct nk-command-curve
  (header (:struct nk-command))
  (line-thickness :unsigned-short)
  (begin (:struct nk-vec2i))
  (end (:struct nk-vec2i))
  (ctrl (:array (:struct nk-vec2i) 2))
  (color (:struct nk-color))
)
#+ecl
(ffi:def-c-struct nk-command-curve
    (header (:struct nk-command))
    (line-thickness :unsigned-short)
    (begin (:struct nk-vec2i))
    (end (:struct nk-vec2i))
    (ctrl :pointer)
    (color (:struct nk-color))
)

; nk_command_rect
#-ecl
(cffi:defcstruct nk-command-rect
  (header (:struct nk-command))
  (rounding :unsigned-short)
  (line-thickness :unsigned-short)
  (x :short)
  (y :short)
  (w :unsigned-short)
  (h :unsigned-short)
  (color (:struct nk-color))
)
#+ecl
(ffi:def-c-struct nk-command-rect
    (header (:struct nk-command))
    (rounding :unsigned-short)
    (line-thickness :unsigned-short)
    (x :short)
    (y :short)
    (w :unsigned-short)
    (h :unsigned-short)
    (color (:struct nk-color))
)

; nk_command_rect_filled
#-ecl
(cffi:defcstruct nk-command-rect-filled
  (header (:struct nk-command))
  (rounding :unsigned-short)
  (x :short)
  (y :short)
  (w :unsigned-short)
  (h :unsigned-short)
  (color (:struct nk-color))
)
#+ecl
(ffi:def-c-struct nk-command-rect-filled
    (header (:struct nk-command))
    (rounding :unsigned-short)
    (x :short)
    (y :short)
    (w :unsigned-short)
    (h :unsigned-short)
    (color (:struct nk-color))
)

; nk_command_rect_multi_color
#-ecl
(cffi:defcstruct nk-command-rect-multi-color
  (header (:struct nk-command))
  (x :short)
  (y :short)
  (w :unsigned-short)
  (h :unsigned-short)
  (left (:struct nk-color))
  (top (:struct nk-color))
  (bottom (:struct nk-color))
  (right (:struct nk-color))
)
#+ecl
(ffi:def-c-struct nk-command-rect-multi-color
    (header (:struct nk-command))
    (x :short)
    (y :short)
    (w :unsigned-short)
    (h :unsigned-short)
    (left (:struct nk-color))
    (top (:struct nk-color))
    (bottom (:struct nk-color))
    (right (:struct nk-color))
)

; nk_command_triangle
#-ecl
(cffi:defcstruct nk-command-triangle
  (header (:struct nk-command))
  (line-thickness :unsigned-short)
  (a (:struct nk-vec2i))
  (b (:struct nk-vec2i))
  (c (:struct nk-vec2i))
  (color (:struct nk-color))
)
#+ecl
(ffi:def-c-struct nk-command-triangle
    (header (:struct nk-command))
    (line-thickness :unsigned-short)
    (a (:struct nk-vec2i))
    (b (:struct nk-vec2i))
    (c (:struct nk-vec2i))
    (color (:struct nk-color))
)

; nk_command_triangle_filled
#-ecl
(cffi:defcstruct nk-command-triangle-filled
  (header (:struct nk-command))
  (a (:struct nk-vec2i))
  (b (:struct nk-vec2i))
  (c (:struct nk-vec2i))
  (color (:struct nk-color))
)
#+ecl
(ffi:def-c-struct nk-command-triangle-filled
    (header (:struct nk-command))
    (a (:struct nk-vec2i))
    (b (:struct nk-vec2i))
    (c (:struct nk-vec2i))
    (color (:struct nk-color))
)

; nk_command_circle
#-ecl
(cffi:defcstruct nk-command-circle
  (header (:struct nk-command))
  (x :short)
  (y :short)
  (line-thickness :unsigned-short)
  (w :unsigned-short)
  (h :unsigned-short)
  (color (:struct nk-color))
)
#+ecl
(ffi:def-c-struct nk-command-circle
    (header (:struct nk-command))
    (x :short)
    (y :short)
    (line-thickness :unsigned-short)
    (w :unsigned-short)
    (h :unsigned-short)
    (color (:struct nk-color))
)

; nk_command_circle_filled
#-ecl
(cffi:defcstruct nk-command-circle-filled
  (header (:struct nk-command))
  (x :short)
  (y :short)
  (w :unsigned-short)
  (h :unsigned-short)
  (color (:struct nk-color))
)
#+ecl
(ffi:def-c-struct nk-command-circle-filled
    (header (:struct nk-command))
    (x :short)
    (y :short)
    (w :unsigned-short)
    (h :unsigned-short)
    (color (:struct nk-color))
)

; nk_command_arc
#-ecl
(cffi:defcstruct nk-command-arc
  (header (:struct nk-command))
  (cx :short)
  (cy :short)
  (r :unsigned-short)
  (line-thickness :unsigned-short)
  (a (:array :float 2))
  (color (:struct nk-color))
)
#+ecl
(ffi:def-c-struct nk-command-arc
    (header (:struct nk-command))
    (cx :short)
    (cy :short)
    (r :unsigned-short)
    (line-thickness :unsigned-short)
    (a :pointer)
    (color (:struct nk-color))
)

; nk_command_arc_filled
#-ecl
(cffi:defcstruct nk-command-arc-filled
  (header (:struct nk-command))
  (cx :short)
  (cy :short)
  (r :unsigned-short)
  (a (:array :float 2))
  (color (:struct nk-color))
)
#+ecl
(ffi:def-c-struct nk-command-arc-filled
    (header (:struct nk-command))
    (cx :short)
    (cy :short)
    (r :unsigned-short)
    (a :pointer)
    (color (:struct nk-color))
)

; nk_command_polygon
#-ecl
(cffi:defcstruct nk-command-polygon
  (header (:struct nk-command))
  (color (:struct nk-color))
  (line-thickness :unsigned-short)
  (point-count :unsigned-short)
  (points (:array (:struct nk-vec2i) 1))
)
#+ecl
(ffi:def-c-struct nk-command-polygon
    (header (:struct nk-command))
    (color (:struct nk-color))
    (line-thickness :unsigned-short)
    (point-count :unsigned-short)
    (points :pointer)
)

; nk_command_polygon_filled
#-ecl
(cffi:defcstruct nk-command-polygon-filled
  (header (:struct nk-command))
  (color (:struct nk-color))
  (point-count :unsigned-short)
  (points (:array (:struct nk-vec2i) 1))
)
#+ecl
(ffi:def-c-struct nk-command-polygon-filled
    (header (:struct nk-command))
    (color (:struct nk-color))
    (point-count :unsigned-short)
    (points :pointer)
)

; nk_command_polyline
#-ecl
(cffi:defcstruct nk-command-polyline
  (header (:struct nk-command))
  (color (:struct nk-color))
  (line-thickness :unsigned-short)
  (point-count :unsigned-short)
  (points (:array (:struct nk-vec2i) 1))
)
#+ecl
(ffi:def-c-struct nk-command-polyline
    (header (:struct nk-command))
    (color (:struct nk-color))
    (line-thickness :unsigned-short)
    (point-count :unsigned-short)
    (points :pointer)
)

; nk_command_image
#-ecl
(cffi:defcstruct nk-command-image
  (header (:struct nk-command))
  (x :short)
  (y :short)
  (w :unsigned-short)
  (h :unsigned-short)
  (img (:struct nk-image))
  (col (:struct nk-color))
)
#+ecl
(ffi:def-c-struct nk-command-image
    (header (:struct nk-command))
    (x :short)
    (y :short)
    (w :unsigned-short)
    (h :unsigned-short)
    (img (:struct nk-image))
    (col (:struct nk-color))
)

; nk_command_custom
#-ecl
(cffi:defcstruct nk-command-custom
  (header (:struct nk-command))
  (x :short)
  (y :short)
  (w :unsigned-short)
  (h :unsigned-short)
  (callback-data (:struct nk-handle))
  (callback :pointer)
)
#+ecl
(ffi:def-c-struct nk-command-custom
    (header (:struct nk-command))
    (x :short)
    (y :short)
    (w :unsigned-short)
    (h :unsigned-short)
    (callback-data (:struct nk-handle))
    (callback :pointer)
)

; nk_command_text
#-ecl
(cffi:defcstruct nk-command-text
  (header (:struct nk-command))
  (font :pointer)
  (background (:struct nk-color))
  (foreground (:struct nk-color))
  (x :short)
  (y :short)
  (w :unsigned-short)
  (h :unsigned-short)
  (height :float)
  (length :int)
  (string (:array :char 2))
)
#+ecl
(ffi:def-c-struct nk-command-text
    (header (:struct nk-command))
    (font :pointer)
    (background (:struct nk-color))
    (foreground (:struct nk-color))
    (x :short)
    (y :short)
    (w :unsigned-short)
    (h :unsigned-short)
    (height :float)
    (length :int)
    (string :pointer)
)

; nk_command_buffer
#-ecl
(cffi:defcstruct nk-command-buffer
  (base :pointer)
  (clip (:struct nk-rect))
  (use-clipping :int)
  (userdata (:struct nk-handle))
  (begin :unsigned-long)
  (end :unsigned-long)
  (last :unsigned-long)
)
#+ecl
(ffi:def-c-struct nk-command-buffer
    (base :pointer)
    (clip (:struct nk-rect))
    (use-clipping :int)
    (userdata (:struct nk-handle))
    (begin :unsigned-long)
    (end :unsigned-long)
    (last :unsigned-long)
)

; nk_mouse_button
#-ecl
(cffi:defcstruct nk-mouse-button
  (down :int)
  (clicked :unsigned-int)
  (clicked-pos (:struct nk-vec2))
)
#+ecl
(ffi:def-c-struct nk-mouse-button
    (down :int)
    (clicked :unsigned-int)
    (clicked-pos (:struct nk-vec2))
)

; nk_mouse
#-ecl
(cffi:defcstruct nk-mouse
  (buttons (:array (:struct nk-mouse-button) 6))
  (pos (:struct nk-vec2))
  (prev (:struct nk-vec2))
  (delta (:struct nk-vec2))
  (scroll-delta (:struct nk-vec2))
  (grab :unsigned-char)
  (grabbed :unsigned-char)
  (ungrab :unsigned-char)
)
#+ecl
(ffi:def-c-struct nk-mouse
    (buttons :pointer)
    (pos (:struct nk-vec2))
    (prev (:struct nk-vec2))
    (delta (:struct nk-vec2))
    (scroll-delta (:struct nk-vec2))
    (grab :unsigned-char)
    (grabbed :unsigned-char)
    (ungrab :unsigned-char)
)

; nk_key
#-ecl
(cffi:defcstruct nk-key
  (down :int)
  (clicked :unsigned-int)
)
#+ecl
(ffi:def-c-struct nk-key
    (down :int)
    (clicked :unsigned-int)
)

; nk_keyboard
#-ecl
(cffi:defcstruct nk-keyboard
  (keys (:array (:struct nk-key) 43))
  (text (:array :char 16))
  (text-len :int)
)
#+ecl
(ffi:def-c-struct nk-keyboard
    (keys :pointer)
    (text :pointer)
    (text-len :int)
)

; nk_input
#-ecl
(cffi:defcstruct nk-input
  (keyboard (:struct nk-keyboard))
  (mouse (:struct nk-mouse))
)
#+ecl
(ffi:def-c-struct nk-input
    (keyboard (:struct nk-keyboard))
    (mouse (:struct nk-mouse))
)

; nk_draw_vertex_layout_element
#-ecl
(cffi:defcstruct nk-draw-vertex-layout-element
  (attribute nk-draw-vertex-layout-attribute)
  (format nk-draw-vertex-layout-format)
  (offset :unsigned-long)
)
#+ecl
(ffi:def-c-struct nk-draw-vertex-layout-element
    (attribute :int)
    (format :int)
    (offset :unsigned-long)
)

; nk_draw_command
#-ecl
(cffi:defcstruct nk-draw-command
  (elem-count :unsigned-int)
  (clip-rect (:struct nk-rect))
  (texture (:struct nk-handle))
  (userdata (:struct nk-handle))
)
#+ecl
(ffi:def-c-struct nk-draw-command
    (elem-count :unsigned-int)
    (clip-rect (:struct nk-rect))
    (texture (:struct nk-handle))
    (userdata (:struct nk-handle))
)

; nk_draw_list
#-ecl
(cffi:defcstruct nk-draw-list
  (clip-rect (:struct nk-rect))
  (circle-vtx (:array (:struct nk-vec2) 12))
  (config (:struct nk-convert-config))
  (buffer :pointer)
  (vertices :pointer)
  (elements :pointer)
  (element-count :unsigned-int)
  (vertex-count :unsigned-int)
  (cmd-count :unsigned-int)
  (cmd-offset :unsigned-long)
  (path-count :unsigned-int)
  (path-offset :unsigned-int)
  (line-AA nk-anti-aliasing)
  (shape-AA nk-anti-aliasing)
  (userdata (:struct nk-handle))
)
#+ecl
(ffi:def-c-struct nk-draw-list
    (clip-rect (:struct nk-rect))
    (circle-vtx :pointer)
    (config (:struct nk-convert-config))
    (buffer :pointer)
    (vertices :pointer)
    (elements :pointer)
    (element-count :unsigned-int)
    (vertex-count :unsigned-int)
    (cmd-count :unsigned-int)
    (cmd-offset :unsigned-long)
    (path-count :unsigned-int)
    (path-offset :unsigned-int)
    (line-AA :int)
    (shape-AA :int)
    (userdata (:struct nk-handle))
)

; nk_style_item_data
#-ecl
(cffi:defcunion nk-style-item-data
  (color (:struct nk-color))
  (image (:struct nk-image))
  (slice (:struct nk-nine-slice))
)
#+ecl
(ffi:def-c-union nk-style-item-data
    (color (:struct nk-color))
    (image (:struct nk-image))
    (slice (:struct nk-nine-slice))
)

; nk_style_item
#-ecl
(cffi:defcstruct nk-style-item
  (type nk-style-item-type)
  (data (:struct nk-style-item-data))
)
#+ecl
(ffi:def-c-struct nk-style-item
    (type :int)
    (data (:struct nk-style-item-data))
)

; nk_style_text
#-ecl
(cffi:defcstruct nk-style-text
  (color (:struct nk-color))
  (padding (:struct nk-vec2))
  (color-factor :float)
  (disabled-factor :float)
)
#+ecl
(ffi:def-c-struct nk-style-text
    (color (:struct nk-color))
    (padding (:struct nk-vec2))
    (color-factor :float)
    (disabled-factor :float)
)

; nk_style_button
#-ecl
(cffi:defcstruct nk-style-button
  (normal (:struct nk-style-item))
  (hover (:struct nk-style-item))
  (active (:struct nk-style-item))
  (border-color (:struct nk-color))
  (color-factor-background :float)
  (text-background (:struct nk-color))
  (text-normal (:struct nk-color))
  (text-hover (:struct nk-color))
  (text-active (:struct nk-color))
  (text-alignment :unsigned-int)
  (color-factor-text :float)
  (border :float)
  (rounding :float)
  (padding (:struct nk-vec2))
  (image-padding (:struct nk-vec2))
  (touch-padding (:struct nk-vec2))
  (disabled-factor :float)
  (userdata (:struct nk-handle))
  (draw-begin :pointer)
  (draw-end :pointer)
)
#+ecl
(ffi:def-c-struct nk-style-button
    (normal (:struct nk-style-item))
    (hover (:struct nk-style-item))
    (active (:struct nk-style-item))
    (border-color (:struct nk-color))
    (color-factor-background :float)
    (text-background (:struct nk-color))
    (text-normal (:struct nk-color))
    (text-hover (:struct nk-color))
    (text-active (:struct nk-color))
    (text-alignment :unsigned-int)
    (color-factor-text :float)
    (border :float)
    (rounding :float)
    (padding (:struct nk-vec2))
    (image-padding (:struct nk-vec2))
    (touch-padding (:struct nk-vec2))
    (disabled-factor :float)
    (userdata (:struct nk-handle))
    (draw-begin :pointer)
    (draw-end :pointer)
)

; nk_style_toggle
#-ecl
(cffi:defcstruct nk-style-toggle
  (normal (:struct nk-style-item))
  (hover (:struct nk-style-item))
  (active (:struct nk-style-item))
  (border-color (:struct nk-color))
  (cursor-normal (:struct nk-style-item))
  (cursor-hover (:struct nk-style-item))
  (text-normal (:struct nk-color))
  (text-hover (:struct nk-color))
  (text-active (:struct nk-color))
  (text-background (:struct nk-color))
  (text-alignment :unsigned-int)
  (padding (:struct nk-vec2))
  (touch-padding (:struct nk-vec2))
  (spacing :float)
  (border :float)
  (color-factor :float)
  (disabled-factor :float)
  (userdata (:struct nk-handle))
  (draw-begin :pointer)
  (draw-end :pointer)
)
#+ecl
(ffi:def-c-struct nk-style-toggle
    (normal (:struct nk-style-item))
    (hover (:struct nk-style-item))
    (active (:struct nk-style-item))
    (border-color (:struct nk-color))
    (cursor-normal (:struct nk-style-item))
    (cursor-hover (:struct nk-style-item))
    (text-normal (:struct nk-color))
    (text-hover (:struct nk-color))
    (text-active (:struct nk-color))
    (text-background (:struct nk-color))
    (text-alignment :unsigned-int)
    (padding (:struct nk-vec2))
    (touch-padding (:struct nk-vec2))
    (spacing :float)
    (border :float)
    (color-factor :float)
    (disabled-factor :float)
    (userdata (:struct nk-handle))
    (draw-begin :pointer)
    (draw-end :pointer)
)

; nk_style_selectable
#-ecl
(cffi:defcstruct nk-style-selectable
  (normal (:struct nk-style-item))
  (hover (:struct nk-style-item))
  (pressed (:struct nk-style-item))
  (normal-active (:struct nk-style-item))
  (hover-active (:struct nk-style-item))
  (pressed-active (:struct nk-style-item))
  (text-normal (:struct nk-color))
  (text-hover (:struct nk-color))
  (text-pressed (:struct nk-color))
  (text-normal-active (:struct nk-color))
  (text-hover-active (:struct nk-color))
  (text-pressed-active (:struct nk-color))
  (text-background (:struct nk-color))
  (text-alignment :unsigned-int)
  (rounding :float)
  (padding (:struct nk-vec2))
  (touch-padding (:struct nk-vec2))
  (image-padding (:struct nk-vec2))
  (color-factor :float)
  (disabled-factor :float)
  (userdata (:struct nk-handle))
  (draw-begin :pointer)
  (draw-end :pointer)
)
#+ecl
(ffi:def-c-struct nk-style-selectable
    (normal (:struct nk-style-item))
    (hover (:struct nk-style-item))
    (pressed (:struct nk-style-item))
    (normal-active (:struct nk-style-item))
    (hover-active (:struct nk-style-item))
    (pressed-active (:struct nk-style-item))
    (text-normal (:struct nk-color))
    (text-hover (:struct nk-color))
    (text-pressed (:struct nk-color))
    (text-normal-active (:struct nk-color))
    (text-hover-active (:struct nk-color))
    (text-pressed-active (:struct nk-color))
    (text-background (:struct nk-color))
    (text-alignment :unsigned-int)
    (rounding :float)
    (padding (:struct nk-vec2))
    (touch-padding (:struct nk-vec2))
    (image-padding (:struct nk-vec2))
    (color-factor :float)
    (disabled-factor :float)
    (userdata (:struct nk-handle))
    (draw-begin :pointer)
    (draw-end :pointer)
)

; nk_style_slider
#-ecl
(cffi:defcstruct nk-style-slider
  (normal (:struct nk-style-item))
  (hover (:struct nk-style-item))
  (active (:struct nk-style-item))
  (border-color (:struct nk-color))
  (bar-normal (:struct nk-color))
  (bar-hover (:struct nk-color))
  (bar-active (:struct nk-color))
  (bar-filled (:struct nk-color))
  (cursor-normal (:struct nk-style-item))
  (cursor-hover (:struct nk-style-item))
  (cursor-active (:struct nk-style-item))
  (border :float)
  (rounding :float)
  (bar-height :float)
  (padding (:struct nk-vec2))
  (spacing (:struct nk-vec2))
  (cursor-size (:struct nk-vec2))
  (color-factor :float)
  (disabled-factor :float)
  (show-buttons :int)
  (inc-button (:struct nk-style-button))
  (dec-button (:struct nk-style-button))
  (inc-symbol nk-symbol-type)
  (dec-symbol nk-symbol-type)
  (userdata (:struct nk-handle))
  (draw-begin :pointer)
  (draw-end :pointer)
)
#+ecl
(ffi:def-c-struct nk-style-slider
    (normal (:struct nk-style-item))
    (hover (:struct nk-style-item))
    (active (:struct nk-style-item))
    (border-color (:struct nk-color))
    (bar-normal (:struct nk-color))
    (bar-hover (:struct nk-color))
    (bar-active (:struct nk-color))
    (bar-filled (:struct nk-color))
    (cursor-normal (:struct nk-style-item))
    (cursor-hover (:struct nk-style-item))
    (cursor-active (:struct nk-style-item))
    (border :float)
    (rounding :float)
    (bar-height :float)
    (padding (:struct nk-vec2))
    (spacing (:struct nk-vec2))
    (cursor-size (:struct nk-vec2))
    (color-factor :float)
    (disabled-factor :float)
    (show-buttons :int)
    (inc-button (:struct nk-style-button))
    (dec-button (:struct nk-style-button))
    (inc-symbol :int)
    (dec-symbol :int)
    (userdata (:struct nk-handle))
    (draw-begin :pointer)
    (draw-end :pointer)
)

; nk_style_knob
#-ecl
(cffi:defcstruct nk-style-knob
  (normal (:struct nk-style-item))
  (hover (:struct nk-style-item))
  (active (:struct nk-style-item))
  (border-color (:struct nk-color))
  (knob-normal (:struct nk-color))
  (knob-hover (:struct nk-color))
  (knob-active (:struct nk-color))
  (knob-border-color (:struct nk-color))
  (cursor-normal (:struct nk-color))
  (cursor-hover (:struct nk-color))
  (cursor-active (:struct nk-color))
  (border :float)
  (knob-border :float)
  (padding (:struct nk-vec2))
  (spacing (:struct nk-vec2))
  (cursor-width :float)
  (color-factor :float)
  (disabled-factor :float)
  (userdata (:struct nk-handle))
  (draw-begin :pointer)
  (draw-end :pointer)
)
#+ecl
(ffi:def-c-struct nk-style-knob
    (normal (:struct nk-style-item))
    (hover (:struct nk-style-item))
    (active (:struct nk-style-item))
    (border-color (:struct nk-color))
    (knob-normal (:struct nk-color))
    (knob-hover (:struct nk-color))
    (knob-active (:struct nk-color))
    (knob-border-color (:struct nk-color))
    (cursor-normal (:struct nk-color))
    (cursor-hover (:struct nk-color))
    (cursor-active (:struct nk-color))
    (border :float)
    (knob-border :float)
    (padding (:struct nk-vec2))
    (spacing (:struct nk-vec2))
    (cursor-width :float)
    (color-factor :float)
    (disabled-factor :float)
    (userdata (:struct nk-handle))
    (draw-begin :pointer)
    (draw-end :pointer)
)

; nk_style_progress
#-ecl
(cffi:defcstruct nk-style-progress
  (normal (:struct nk-style-item))
  (hover (:struct nk-style-item))
  (active (:struct nk-style-item))
  (border-color (:struct nk-color))
  (cursor-normal (:struct nk-style-item))
  (cursor-hover (:struct nk-style-item))
  (cursor-active (:struct nk-style-item))
  (cursor-border-color (:struct nk-color))
  (rounding :float)
  (border :float)
  (cursor-border :float)
  (cursor-rounding :float)
  (padding (:struct nk-vec2))
  (color-factor :float)
  (disabled-factor :float)
  (userdata (:struct nk-handle))
  (draw-begin :pointer)
  (draw-end :pointer)
)
#+ecl
(ffi:def-c-struct nk-style-progress
    (normal (:struct nk-style-item))
    (hover (:struct nk-style-item))
    (active (:struct nk-style-item))
    (border-color (:struct nk-color))
    (cursor-normal (:struct nk-style-item))
    (cursor-hover (:struct nk-style-item))
    (cursor-active (:struct nk-style-item))
    (cursor-border-color (:struct nk-color))
    (rounding :float)
    (border :float)
    (cursor-border :float)
    (cursor-rounding :float)
    (padding (:struct nk-vec2))
    (color-factor :float)
    (disabled-factor :float)
    (userdata (:struct nk-handle))
    (draw-begin :pointer)
    (draw-end :pointer)
)

; nk_style_scrollbar
#-ecl
(cffi:defcstruct nk-style-scrollbar
  (normal (:struct nk-style-item))
  (hover (:struct nk-style-item))
  (active (:struct nk-style-item))
  (border-color (:struct nk-color))
  (cursor-normal (:struct nk-style-item))
  (cursor-hover (:struct nk-style-item))
  (cursor-active (:struct nk-style-item))
  (cursor-border-color (:struct nk-color))
  (border :float)
  (rounding :float)
  (border-cursor :float)
  (rounding-cursor :float)
  (padding (:struct nk-vec2))
  (color-factor :float)
  (disabled-factor :float)
  (show-buttons :int)
  (inc-button (:struct nk-style-button))
  (dec-button (:struct nk-style-button))
  (inc-symbol nk-symbol-type)
  (dec-symbol nk-symbol-type)
  (userdata (:struct nk-handle))
  (draw-begin :pointer)
  (draw-end :pointer)
)
#+ecl
(ffi:def-c-struct nk-style-scrollbar
    (normal (:struct nk-style-item))
    (hover (:struct nk-style-item))
    (active (:struct nk-style-item))
    (border-color (:struct nk-color))
    (cursor-normal (:struct nk-style-item))
    (cursor-hover (:struct nk-style-item))
    (cursor-active (:struct nk-style-item))
    (cursor-border-color (:struct nk-color))
    (border :float)
    (rounding :float)
    (border-cursor :float)
    (rounding-cursor :float)
    (padding (:struct nk-vec2))
    (color-factor :float)
    (disabled-factor :float)
    (show-buttons :int)
    (inc-button (:struct nk-style-button))
    (dec-button (:struct nk-style-button))
    (inc-symbol :int)
    (dec-symbol :int)
    (userdata (:struct nk-handle))
    (draw-begin :pointer)
    (draw-end :pointer)
)

; nk_style_edit
#-ecl
(cffi:defcstruct nk-style-edit
  (normal (:struct nk-style-item))
  (hover (:struct nk-style-item))
  (active (:struct nk-style-item))
  (border-color (:struct nk-color))
  (scrollbar (:struct nk-style-scrollbar))
  (cursor-normal (:struct nk-color))
  (cursor-hover (:struct nk-color))
  (cursor-text-normal (:struct nk-color))
  (cursor-text-hover (:struct nk-color))
  (text-normal (:struct nk-color))
  (text-hover (:struct nk-color))
  (text-active (:struct nk-color))
  (selected-normal (:struct nk-color))
  (selected-hover (:struct nk-color))
  (selected-text-normal (:struct nk-color))
  (selected-text-hover (:struct nk-color))
  (border :float)
  (rounding :float)
  (cursor-size :float)
  (scrollbar-size (:struct nk-vec2))
  (padding (:struct nk-vec2))
  (row-padding :float)
  (color-factor :float)
  (disabled-factor :float)
)
#+ecl
(ffi:def-c-struct nk-style-edit
    (normal (:struct nk-style-item))
    (hover (:struct nk-style-item))
    (active (:struct nk-style-item))
    (border-color (:struct nk-color))
    (scrollbar (:struct nk-style-scrollbar))
    (cursor-normal (:struct nk-color))
    (cursor-hover (:struct nk-color))
    (cursor-text-normal (:struct nk-color))
    (cursor-text-hover (:struct nk-color))
    (text-normal (:struct nk-color))
    (text-hover (:struct nk-color))
    (text-active (:struct nk-color))
    (selected-normal (:struct nk-color))
    (selected-hover (:struct nk-color))
    (selected-text-normal (:struct nk-color))
    (selected-text-hover (:struct nk-color))
    (border :float)
    (rounding :float)
    (cursor-size :float)
    (scrollbar-size (:struct nk-vec2))
    (padding (:struct nk-vec2))
    (row-padding :float)
    (color-factor :float)
    (disabled-factor :float)
)

; nk_style_property
#-ecl
(cffi:defcstruct nk-style-property
  (normal (:struct nk-style-item))
  (hover (:struct nk-style-item))
  (active (:struct nk-style-item))
  (border-color (:struct nk-color))
  (label-normal (:struct nk-color))
  (label-hover (:struct nk-color))
  (label-active (:struct nk-color))
  (sym-left nk-symbol-type)
  (sym-right nk-symbol-type)
  (border :float)
  (rounding :float)
  (padding (:struct nk-vec2))
  (color-factor :float)
  (disabled-factor :float)
  (edit (:struct nk-style-edit))
  (inc-button (:struct nk-style-button))
  (dec-button (:struct nk-style-button))
  (userdata (:struct nk-handle))
  (draw-begin :pointer)
  (draw-end :pointer)
)
#+ecl
(ffi:def-c-struct nk-style-property
    (normal (:struct nk-style-item))
    (hover (:struct nk-style-item))
    (active (:struct nk-style-item))
    (border-color (:struct nk-color))
    (label-normal (:struct nk-color))
    (label-hover (:struct nk-color))
    (label-active (:struct nk-color))
    (sym-left :int)
    (sym-right :int)
    (border :float)
    (rounding :float)
    (padding (:struct nk-vec2))
    (color-factor :float)
    (disabled-factor :float)
    (edit (:struct nk-style-edit))
    (inc-button (:struct nk-style-button))
    (dec-button (:struct nk-style-button))
    (userdata (:struct nk-handle))
    (draw-begin :pointer)
    (draw-end :pointer)
)

; nk_style_chart
#-ecl
(cffi:defcstruct nk-style-chart
  (background (:struct nk-style-item))
  (border-color (:struct nk-color))
  (selected-color (:struct nk-color))
  (color (:struct nk-color))
  (border :float)
  (rounding :float)
  (padding (:struct nk-vec2))
  (color-factor :float)
  (disabled-factor :float)
  (show-markers :int)
)
#+ecl
(ffi:def-c-struct nk-style-chart
    (background (:struct nk-style-item))
    (border-color (:struct nk-color))
    (selected-color (:struct nk-color))
    (color (:struct nk-color))
    (border :float)
    (rounding :float)
    (padding (:struct nk-vec2))
    (color-factor :float)
    (disabled-factor :float)
    (show-markers :int)
)

; nk_style_combo
#-ecl
(cffi:defcstruct nk-style-combo
  (normal (:struct nk-style-item))
  (hover (:struct nk-style-item))
  (active (:struct nk-style-item))
  (border-color (:struct nk-color))
  (label-normal (:struct nk-color))
  (label-hover (:struct nk-color))
  (label-active (:struct nk-color))
  (symbol-normal (:struct nk-color))
  (symbol-hover (:struct nk-color))
  (symbol-active (:struct nk-color))
  (button (:struct nk-style-button))
  (sym-normal nk-symbol-type)
  (sym-hover nk-symbol-type)
  (sym-active nk-symbol-type)
  (border :float)
  (rounding :float)
  (content-padding (:struct nk-vec2))
  (button-padding (:struct nk-vec2))
  (spacing (:struct nk-vec2))
  (color-factor :float)
  (disabled-factor :float)
)
#+ecl
(ffi:def-c-struct nk-style-combo
    (normal (:struct nk-style-item))
    (hover (:struct nk-style-item))
    (active (:struct nk-style-item))
    (border-color (:struct nk-color))
    (label-normal (:struct nk-color))
    (label-hover (:struct nk-color))
    (label-active (:struct nk-color))
    (symbol-normal (:struct nk-color))
    (symbol-hover (:struct nk-color))
    (symbol-active (:struct nk-color))
    (button (:struct nk-style-button))
    (sym-normal :int)
    (sym-hover :int)
    (sym-active :int)
    (border :float)
    (rounding :float)
    (content-padding (:struct nk-vec2))
    (button-padding (:struct nk-vec2))
    (spacing (:struct nk-vec2))
    (color-factor :float)
    (disabled-factor :float)
)

; nk_style_tab
#-ecl
(cffi:defcstruct nk-style-tab
  (background (:struct nk-style-item))
  (border-color (:struct nk-color))
  (text (:struct nk-color))
  (tab-maximize-button (:struct nk-style-button))
  (tab-minimize-button (:struct nk-style-button))
  (node-maximize-button (:struct nk-style-button))
  (node-minimize-button (:struct nk-style-button))
  (sym-minimize nk-symbol-type)
  (sym-maximize nk-symbol-type)
  (border :float)
  (rounding :float)
  (indent :float)
  (padding (:struct nk-vec2))
  (spacing (:struct nk-vec2))
  (color-factor :float)
  (disabled-factor :float)
)
#+ecl
(ffi:def-c-struct nk-style-tab
    (background (:struct nk-style-item))
    (border-color (:struct nk-color))
    (text (:struct nk-color))
    (tab-maximize-button (:struct nk-style-button))
    (tab-minimize-button (:struct nk-style-button))
    (node-maximize-button (:struct nk-style-button))
    (node-minimize-button (:struct nk-style-button))
    (sym-minimize :int)
    (sym-maximize :int)
    (border :float)
    (rounding :float)
    (indent :float)
    (padding (:struct nk-vec2))
    (spacing (:struct nk-vec2))
    (color-factor :float)
    (disabled-factor :float)
)

; nk_style_window_header
#-ecl
(cffi:defcstruct nk-style-window-header
  (normal (:struct nk-style-item))
  (hover (:struct nk-style-item))
  (active (:struct nk-style-item))
  (close-button (:struct nk-style-button))
  (minimize-button (:struct nk-style-button))
  (close-symbol nk-symbol-type)
  (minimize-symbol nk-symbol-type)
  (maximize-symbol nk-symbol-type)
  (label-normal (:struct nk-color))
  (label-hover (:struct nk-color))
  (label-active (:struct nk-color))
  (align nk-style-header-align)
  (padding (:struct nk-vec2))
  (label-padding (:struct nk-vec2))
  (spacing (:struct nk-vec2))
)
#+ecl
(ffi:def-c-struct nk-style-window-header
    (normal (:struct nk-style-item))
    (hover (:struct nk-style-item))
    (active (:struct nk-style-item))
    (close-button (:struct nk-style-button))
    (minimize-button (:struct nk-style-button))
    (close-symbol :int)
    (minimize-symbol :int)
    (maximize-symbol :int)
    (label-normal (:struct nk-color))
    (label-hover (:struct nk-color))
    (label-active (:struct nk-color))
    (align :int)
    (padding (:struct nk-vec2))
    (label-padding (:struct nk-vec2))
    (spacing (:struct nk-vec2))
)

; nk_style_window
#-ecl
(cffi:defcstruct nk-style-window
  (header (:struct nk-style-window-header))
  (fixed-background (:struct nk-style-item))
  (background (:struct nk-color))
  (border-color (:struct nk-color))
  (popup-border-color (:struct nk-color))
  (combo-border-color (:struct nk-color))
  (contextual-border-color (:struct nk-color))
  (menu-border-color (:struct nk-color))
  (group-border-color (:struct nk-color))
  (tooltip-border-color (:struct nk-color))
  (scaler (:struct nk-style-item))
  (border :float)
  (combo-border :float)
  (contextual-border :float)
  (menu-border :float)
  (group-border :float)
  (tooltip-border :float)
  (popup-border :float)
  (min-row-height-padding :float)
  (rounding :float)
  (spacing (:struct nk-vec2))
  (scrollbar-size (:struct nk-vec2))
  (min-size (:struct nk-vec2))
  (padding (:struct nk-vec2))
  (group-padding (:struct nk-vec2))
  (popup-padding (:struct nk-vec2))
  (combo-padding (:struct nk-vec2))
  (contextual-padding (:struct nk-vec2))
  (menu-padding (:struct nk-vec2))
  (tooltip-padding (:struct nk-vec2))
  (tooltip-origin nk-tooltip-pos)
  (tooltip-offset (:struct nk-vec2))
  (tooltip-delay :float)
)
#+ecl
(ffi:def-c-struct nk-style-window
    (header (:struct nk-style-window-header))
    (fixed-background (:struct nk-style-item))
    (background (:struct nk-color))
    (border-color (:struct nk-color))
    (popup-border-color (:struct nk-color))
    (combo-border-color (:struct nk-color))
    (contextual-border-color (:struct nk-color))
    (menu-border-color (:struct nk-color))
    (group-border-color (:struct nk-color))
    (tooltip-border-color (:struct nk-color))
    (scaler (:struct nk-style-item))
    (border :float)
    (combo-border :float)
    (contextual-border :float)
    (menu-border :float)
    (group-border :float)
    (tooltip-border :float)
    (popup-border :float)
    (min-row-height-padding :float)
    (rounding :float)
    (spacing (:struct nk-vec2))
    (scrollbar-size (:struct nk-vec2))
    (min-size (:struct nk-vec2))
    (padding (:struct nk-vec2))
    (group-padding (:struct nk-vec2))
    (popup-padding (:struct nk-vec2))
    (combo-padding (:struct nk-vec2))
    (contextual-padding (:struct nk-vec2))
    (menu-padding (:struct nk-vec2))
    (tooltip-padding (:struct nk-vec2))
    (tooltip-origin :int)
    (tooltip-offset (:struct nk-vec2))
    (tooltip-delay :float)
)

; nk_style
#-ecl
(cffi:defcstruct nk-style
  (font :pointer)
  (cursors (:array :pointer 7))
  (cursor-active :pointer)
  (cursor-last :pointer)
  (cursor-visible :int)
  (text (:struct nk-style-text))
  (button (:struct nk-style-button))
  (contextual-button (:struct nk-style-button))
  (menu-button (:struct nk-style-button))
  (option (:struct nk-style-toggle))
  (checkbox (:struct nk-style-toggle))
  (selectable (:struct nk-style-selectable))
  (slider (:struct nk-style-slider))
  (knob (:struct nk-style-knob))
  (progress (:struct nk-style-progress))
  (property (:struct nk-style-property))
  (edit (:struct nk-style-edit))
  (chart (:struct nk-style-chart))
  (scrollh (:struct nk-style-scrollbar))
  (scrollv (:struct nk-style-scrollbar))
  (tab (:struct nk-style-tab))
  (combo (:struct nk-style-combo))
  (window (:struct nk-style-window))
)
#+ecl
(ffi:def-c-struct nk-style
    (font :pointer)
    (cursors :pointer)
    (cursor-active :pointer)
    (cursor-last :pointer)
    (cursor-visible :int)
    (text (:struct nk-style-text))
    (button (:struct nk-style-button))
    (contextual-button (:struct nk-style-button))
    (menu-button (:struct nk-style-button))
    (option (:struct nk-style-toggle))
    (checkbox (:struct nk-style-toggle))
    (selectable (:struct nk-style-selectable))
    (slider (:struct nk-style-slider))
    (knob (:struct nk-style-knob))
    (progress (:struct nk-style-progress))
    (property (:struct nk-style-property))
    (edit (:struct nk-style-edit))
    (chart (:struct nk-style-chart))
    (scrollh (:struct nk-style-scrollbar))
    (scrollv (:struct nk-style-scrollbar))
    (tab (:struct nk-style-tab))
    (combo (:struct nk-style-combo))
    (window (:struct nk-style-window))
)

; nk_chart_slot
#-ecl
(cffi:defcstruct nk-chart-slot
  (type nk-chart-type)
  (color (:struct nk-color))
  (highlight (:struct nk-color))
  (min :float)
  (max :float)
  (range :float)
  (count :int)
  (last (:struct nk-vec2))
  (index :int)
  (show-markers :int)
)
#+ecl
(ffi:def-c-struct nk-chart-slot
    (type :int)
    (color (:struct nk-color))
    (highlight (:struct nk-color))
    (min :float)
    (max :float)
    (range :float)
    (count :int)
    (last (:struct nk-vec2))
    (index :int)
    (show-markers :int)
)

; nk_chart
#-ecl
(cffi:defcstruct nk-chart
  (slot :int)
  (x :float)
  (y :float)
  (w :float)
  (h :float)
  (slots (:array (:struct nk-chart-slot) 4))
)
#+ecl
(ffi:def-c-struct nk-chart
    (slot :int)
    (x :float)
    (y :float)
    (w :float)
    (h :float)
    (slots :pointer)
)

; nk_row_layout
#-ecl
(cffi:defcstruct nk-row-layout
  (type nk-panel-row-layout-type)
  (index :int)
  (height :float)
  (min-height :float)
  (columns :int)
  (ratio :pointer)
  (item-width :float)
  (item-height :float)
  (item-offset :float)
  (filled :float)
  (item (:struct nk-rect))
  (tree-depth :int)
  (templates (:array :float 16))
)
#+ecl
(ffi:def-c-struct nk-row-layout
    (type :int)
    (index :int)
    (height :float)
    (min-height :float)
    (columns :int)
    (ratio :pointer)
    (item-width :float)
    (item-height :float)
    (item-offset :float)
    (filled :float)
    (item (:struct nk-rect))
    (tree-depth :int)
    (templates :pointer)
)

; nk_popup_buffer
#-ecl
(cffi:defcstruct nk-popup-buffer
  (begin :unsigned-long)
  (parent :unsigned-long)
  (last :unsigned-long)
  (end :unsigned-long)
  (active :int)
)
#+ecl
(ffi:def-c-struct nk-popup-buffer
    (begin :unsigned-long)
    (parent :unsigned-long)
    (last :unsigned-long)
    (end :unsigned-long)
    (active :int)
)

; nk_menu_state
#-ecl
(cffi:defcstruct nk-menu-state
  (x :float)
  (y :float)
  (w :float)
  (h :float)
  (offset (:struct nk-scroll))
)
#+ecl
(ffi:def-c-struct nk-menu-state
    (x :float)
    (y :float)
    (w :float)
    (h :float)
    (offset (:struct nk-scroll))
)

; nk_panel
#-ecl
(cffi:defcstruct nk-panel
  (type nk-panel-type)
  (flags :unsigned-int)
  (bounds (:struct nk-rect))
  (offset-x :pointer)
  (offset-y :pointer)
  (at-x :float)
  (at-y :float)
  (max-x :float)
  (footer-height :float)
  (header-height :float)
  (border :float)
  (has-scrolling :unsigned-int)
  (clip (:struct nk-rect))
  (menu (:struct nk-menu-state))
  (row (:struct nk-row-layout))
  (chart (:struct nk-chart))
  (buffer :pointer)
  (parent :pointer)
)
#+ecl
(ffi:def-c-struct nk-panel
    (type :int)
    (flags :unsigned-int)
    (bounds (:struct nk-rect))
    (offset-x :pointer)
    (offset-y :pointer)
    (at-x :float)
    (at-y :float)
    (max-x :float)
    (footer-height :float)
    (header-height :float)
    (border :float)
    (has-scrolling :unsigned-int)
    (clip (:struct nk-rect))
    (menu (:struct nk-menu-state))
    (row (:struct nk-row-layout))
    (chart (:struct nk-chart))
    (buffer :pointer)
    (parent :pointer)
)

; nk_popup_state
#-ecl
(cffi:defcstruct nk-popup-state
  (win :pointer)
  (type nk-panel-type)
  (buf (:struct nk-popup-buffer))
  (name :unsigned-int)
  (active :int)
  (combo-count :unsigned-int)
  (con-count :unsigned-int)
  (con-old :unsigned-int)
  (active-con :unsigned-int)
  (header (:struct nk-rect))
)
#+ecl
(ffi:def-c-struct nk-popup-state
    (win :pointer)
    (type :int)
    (buf (:struct nk-popup-buffer))
    (name :unsigned-int)
    (active :int)
    (combo-count :unsigned-int)
    (con-count :unsigned-int)
    (con-old :unsigned-int)
    (active-con :unsigned-int)
    (header (:struct nk-rect))
)

; nk_edit_state
#-ecl
(cffi:defcstruct nk-edit-state
  (name :unsigned-int)
  (seq :unsigned-int)
  (old :unsigned-int)
  (active :int)
  (prev :int)
  (cursor :int)
  (sel-start :int)
  (sel-end :int)
  (scrollbar (:struct nk-scroll))
  (mode :unsigned-char)
  (single-line :unsigned-char)
)
#+ecl
(ffi:def-c-struct nk-edit-state
    (name :unsigned-int)
    (seq :unsigned-int)
    (old :unsigned-int)
    (active :int)
    (prev :int)
    (cursor :int)
    (sel-start :int)
    (sel-end :int)
    (scrollbar (:struct nk-scroll))
    (mode :unsigned-char)
    (single-line :unsigned-char)
)

; nk_property_state
#-ecl
(cffi:defcstruct nk-property-state
  (active :int)
  (prev :int)
  (buffer (:array :char 64))
  (length :int)
  (cursor :int)
  (select-start :int)
  (select-end :int)
  (name :unsigned-int)
  (seq :unsigned-int)
  (old :unsigned-int)
  (state :int)
  (prev-state :int)
  (prev-name :unsigned-int)
  (prev-buffer (:array :char 64))
  (prev-length :int)
)
#+ecl
(ffi:def-c-struct nk-property-state
    (active :int)
    (prev :int)
    (buffer :pointer)
    (length :int)
    (cursor :int)
    (select-start :int)
    (select-end :int)
    (name :unsigned-int)
    (seq :unsigned-int)
    (old :unsigned-int)
    (state :int)
    (prev-state :int)
    (prev-name :unsigned-int)
    (prev-buffer :pointer)
    (prev-length :int)
)

; nk_window
#-ecl
(cffi:defcstruct nk-window
  (seq :unsigned-int)
  (name :unsigned-int)
  (name-string (:array :char 64))
  (flags :unsigned-int)
  (bounds (:struct nk-rect))
  (scrollbar (:struct nk-scroll))
  (buffer (:struct nk-command-buffer))
  (layout :pointer)
  (scrollbar-hiding-timer :float)
  (property (:struct nk-property-state))
  (popup (:struct nk-popup-state))
  (edit (:struct nk-edit-state))
  (scrolled :unsigned-int)
  (widgets-disabled :int)
  (tables :pointer)
  (table-count :unsigned-int)
  (next :pointer)
  (prev :pointer)
  (parent :pointer)
)
#+ecl
(ffi:def-c-struct nk-window
    (seq :unsigned-int)
    (name :unsigned-int)
    (name-string :pointer)
    (flags :unsigned-int)
    (bounds (:struct nk-rect))
    (scrollbar (:struct nk-scroll))
    (buffer (:struct nk-command-buffer))
    (layout :pointer)
    (scrollbar-hiding-timer :float)
    (property (:struct nk-property-state))
    (popup (:struct nk-popup-state))
    (edit (:struct nk-edit-state))
    (scrolled :unsigned-int)
    (widgets-disabled :int)
    (tables :pointer)
    (table-count :unsigned-int)
    (next :pointer)
    (prev :pointer)
    (parent :pointer)
)

; nk_config_stack_style_item_element
#-ecl
(cffi:defcstruct nk-config-stack-style-item-element
  (address :pointer)
  (old-value (:struct nk-style-item))
)
#+ecl
(ffi:def-c-struct nk-config-stack-style-item-element
    (address :pointer)
    (old-value (:struct nk-style-item))
)

; nk_config_stack_float_element
#-ecl
(cffi:defcstruct nk-config-stack-float-element
  (address :pointer)
  (old-value :float)
)
#+ecl
(ffi:def-c-struct nk-config-stack-float-element
    (address :pointer)
    (old-value :float)
)

; nk_config_stack_vec2_element
#-ecl
(cffi:defcstruct nk-config-stack-vec2-element
  (address :pointer)
  (old-value (:struct nk-vec2))
)
#+ecl
(ffi:def-c-struct nk-config-stack-vec2-element
    (address :pointer)
    (old-value (:struct nk-vec2))
)

; nk_config_stack_flags_element
#-ecl
(cffi:defcstruct nk-config-stack-flags-element
  (address :pointer)
  (old-value :unsigned-int)
)
#+ecl
(ffi:def-c-struct nk-config-stack-flags-element
    (address :pointer)
    (old-value :unsigned-int)
)

; nk_config_stack_color_element
#-ecl
(cffi:defcstruct nk-config-stack-color-element
  (address :pointer)
  (old-value (:struct nk-color))
)
#+ecl
(ffi:def-c-struct nk-config-stack-color-element
    (address :pointer)
    (old-value (:struct nk-color))
)

; nk_config_stack_user_font_element
#-ecl
(cffi:defcstruct nk-config-stack-user-font-element
  (address :pointer)
  (old-value :pointer)
)
#+ecl
(ffi:def-c-struct nk-config-stack-user-font-element
    (address :pointer)
    (old-value :pointer)
)

; nk_config_stack_button_behavior_element
#-ecl
(cffi:defcstruct nk-config-stack-button-behavior-element
  (address :pointer)
  (old-value nk-button-behavior)
)
#+ecl
(ffi:def-c-struct nk-config-stack-button-behavior-element
    (address :pointer)
    (old-value :int)
)

; nk_config_stack_style_item
#-ecl
(cffi:defcstruct nk-config-stack-style-item
  (head :int)
  (elements (:array (:struct nk-config-stack-style-item-element) 16))
)
#+ecl
(ffi:def-c-struct nk-config-stack-style-item
    (head :int)
    (elements :pointer)
)

; nk_config_stack_float
#-ecl
(cffi:defcstruct nk-config-stack-float
  (head :int)
  (elements (:array (:struct nk-config-stack-float-element) 32))
)
#+ecl
(ffi:def-c-struct nk-config-stack-float
    (head :int)
    (elements :pointer)
)

; nk_config_stack_vec2
#-ecl
(cffi:defcstruct nk-config-stack-vec2
  (head :int)
  (elements (:array (:struct nk-config-stack-vec2-element) 16))
)
#+ecl
(ffi:def-c-struct nk-config-stack-vec2
    (head :int)
    (elements :pointer)
)

; nk_config_stack_flags
#-ecl
(cffi:defcstruct nk-config-stack-flags
  (head :int)
  (elements (:array (:struct nk-config-stack-flags-element) 32))
)
#+ecl
(ffi:def-c-struct nk-config-stack-flags
    (head :int)
    (elements :pointer)
)

; nk_config_stack_color
#-ecl
(cffi:defcstruct nk-config-stack-color
  (head :int)
  (elements (:array (:struct nk-config-stack-color-element) 32))
)
#+ecl
(ffi:def-c-struct nk-config-stack-color
    (head :int)
    (elements :pointer)
)

; nk_config_stack_user_font
#-ecl
(cffi:defcstruct nk-config-stack-user-font
  (head :int)
  (elements (:array (:struct nk-config-stack-user-font-element) 8))
)
#+ecl
(ffi:def-c-struct nk-config-stack-user-font
    (head :int)
    (elements :pointer)
)

; nk_config_stack_button_behavior
#-ecl
(cffi:defcstruct nk-config-stack-button-behavior
  (head :int)
  (elements (:array (:struct nk-config-stack-button-behavior-element) 8))
)
#+ecl
(ffi:def-c-struct nk-config-stack-button-behavior
    (head :int)
    (elements :pointer)
)

; nk_configuration_stacks
#-ecl
(cffi:defcstruct nk-configuration-stacks
  (style-items (:struct nk-config-stack-style-item))
  (floats (:struct nk-config-stack-float))
  (vectors (:struct nk-config-stack-vec2))
  (flags (:struct nk-config-stack-flags))
  (colors (:struct nk-config-stack-color))
  (fonts (:struct nk-config-stack-user-font))
  (button-behaviors (:struct nk-config-stack-button-behavior))
)
#+ecl
(ffi:def-c-struct nk-configuration-stacks
    (style-items (:struct nk-config-stack-style-item))
    (floats (:struct nk-config-stack-float))
    (vectors (:struct nk-config-stack-vec2))
    (flags (:struct nk-config-stack-flags))
    (colors (:struct nk-config-stack-color))
    (fonts (:struct nk-config-stack-user-font))
    (button-behaviors (:struct nk-config-stack-button-behavior))
)

; nk_table
#-ecl
(cffi:defcstruct nk-table
  (seq :unsigned-int)
  (size :unsigned-int)
  (keys (:array :unsigned-int 69))
  (values (:array :unsigned-int 69))
  (next :pointer)
  (prev :pointer)
)
#+ecl
(ffi:def-c-struct nk-table
    (seq :unsigned-int)
    (size :unsigned-int)
    (keys :pointer)
    (values :pointer)
    (next :pointer)
    (prev :pointer)
)

; nk_page_data
#-ecl
(cffi:defcunion nk-page-data
  (tbl (:struct nk-table))
  (pan (:struct nk-panel))
  (win (:struct nk-window))
)
#+ecl
(ffi:def-c-union nk-page-data
    (tbl (:struct nk-table))
    (pan (:struct nk-panel))
    (win (:struct nk-window))
)

; nk_page_element
#-ecl
(cffi:defcstruct nk-page-element
  (data (:struct nk-page-data))
  (next :pointer)
  (prev :pointer)
)
#+ecl
(ffi:def-c-struct nk-page-element
    (data (:struct nk-page-data))
    (next :pointer)
    (prev :pointer)
)

; nk_page
#-ecl
(cffi:defcstruct nk-page
  (size :unsigned-int)
  (next :pointer)
  (win (:array (:struct nk-page-element) 1))
)
#+ecl
(ffi:def-c-struct nk-page
    (size :unsigned-int)
    (next :pointer)
    (win :pointer)
)

; nk_pool
#-ecl
(cffi:defcstruct nk-pool
  (alloc (:struct nk-allocator))
  (type nk-allocation-type)
  (page-count :unsigned-int)
  (pages :pointer)
  (freelist :pointer)
  (capacity :unsigned-int)
  (size :unsigned-long)
  (cap :unsigned-long)
)
#+ecl
(ffi:def-c-struct nk-pool
    (alloc (:struct nk-allocator))
    (type :int)
    (page-count :unsigned-int)
    (pages :pointer)
    (freelist :pointer)
    (capacity :unsigned-int)
    (size :unsigned-long)
    (cap :unsigned-long)
)

; nk_context
#-ecl
(cffi:defcstruct nk-context
  (input (:struct nk-input))
  (style (:struct nk-style))
  (memory (:struct nk-buffer))
  (clip (:struct nk-clipboard))
  (last-widget-state :unsigned-int)
  (button-behavior nk-button-behavior)
  (stacks (:struct nk-configuration-stacks))
  (delta-time-seconds :float)
  (draw-list (:struct nk-draw-list))
  (userdata (:struct nk-handle))
  (text-edit (:struct nk-text-edit))
  (overlay (:struct nk-command-buffer))
  (build :int)
  (use-pool :int)
  (pool (:struct nk-pool))
  (begin :pointer)
  (end :pointer)
  (active :pointer)
  (current :pointer)
  (freelist :pointer)
  (count :unsigned-int)
  (seq :unsigned-int)
)
#+ecl
(ffi:def-c-struct nk-context
    (input (:struct nk-input))
    (style (:struct nk-style))
    (memory (:struct nk-buffer))
    (clip (:struct nk-clipboard))
    (last-widget-state :unsigned-int)
    (button-behavior :int)
    (stacks (:struct nk-configuration-stacks))
    (delta-time-seconds :float)
    (draw-list (:struct nk-draw-list))
    (userdata (:struct nk-handle))
    (text-edit (:struct nk-text-edit))
    (overlay (:struct nk-command-buffer))
    (build :int)
    (use-pool :int)
    (pool (:struct nk-pool))
    (begin :pointer)
    (end :pointer)
    (active :pointer)
    (current :pointer)
    (freelist :pointer)
    (count :unsigned-int)
    (seq :unsigned-int)
)
