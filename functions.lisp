(in-package :nuklear)

;;; Function bindings.
;;; CFFI path (#-ecl): struct-by-value handled via C shims (nuklear_shims.c).
;;; ECL path   (#+ecl): native ffi:def-function handles struct-by-value directly.

; nk_init_default
#-ecl
(cffi:defcfun ("nk_init_default" nk-init-default) :int
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_init_default" nk-init-default)
    (
     (arg0 :pointer)
     (arg1 :pointer)
    )
  :returning :int
)

; nk_init_fixed
#-ecl
(cffi:defcfun ("nk_init_fixed" nk-init-fixed) :int
  (arg0 :pointer)
  (memory :pointer)
  (size :unsigned-long)
  (arg3 :pointer)
)
#+ecl
(ffi:def-function ("nk_init_fixed" nk-init-fixed)
    (
     (arg0 :pointer)
     (memory :pointer)
     (size :unsigned-long)
     (arg3 :pointer)
    )
  :returning :int
)

; nk_init
#-ecl
(cffi:defcfun ("nk_init" nk-init) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_init" nk-init)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :pointer)
    )
  :returning :int
)

; nk_init_custom
#-ecl
(cffi:defcfun ("nk_init_custom" nk-init-custom) :int
  (arg0 :pointer)
  (cmds :pointer)
  (pool :pointer)
  (arg3 :pointer)
)
#+ecl
(ffi:def-function ("nk_init_custom" nk-init-custom)
    (
     (arg0 :pointer)
     (cmds :pointer)
     (pool :pointer)
     (arg3 :pointer)
    )
  :returning :int
)

; nk_clear
#-ecl
(cffi:defcfun ("nk_clear" nk-clear) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_clear" nk-clear)
    (
     (arg0 :pointer)
    )
)

; nk_free
#-ecl
(cffi:defcfun ("nk_free" nk-free) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_free" nk-free)
    (
     (arg0 :pointer)
    )
)

; nk_set_user_data
#-ecl
; [SHIM] nk_set_user_data — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_set_user_data" nk-set-user-data) :void
  (arg0 :pointer)
  (handle :pointer)
)
#+ecl
(ffi:def-function ("nk_set_user_data" nk-set-user-data)
    (
     (arg0 :pointer)
     (handle (:union nk-handle))
    )
)

; nk_input_begin
#-ecl
(cffi:defcfun ("nk_input_begin" nk-input-begin) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_input_begin" nk-input-begin)
    (
     (arg0 :pointer)
    )
)

; nk_input_motion
#-ecl
(cffi:defcfun ("nk_input_motion" nk-input-motion) :void
  (arg0 :pointer)
  (x :int)
  (y :int)
)
#+ecl
(ffi:def-function ("nk_input_motion" nk-input-motion)
    (
     (arg0 :pointer)
     (x :int)
     (y :int)
    )
)

; nk_input_key
#-ecl
(cffi:defcfun ("nk_input_key" nk-input-key) :void
  (arg0 :pointer)
  (arg1 nk-keys)
  (down :int)
)
#+ecl
(ffi:def-function ("nk_input_key" nk-input-key)
    (
     (arg0 :pointer)
     (arg1 :int)
     (down :int)
    )
)

; nk_input_button
#-ecl
(cffi:defcfun ("nk_input_button" nk-input-button) :void
  (arg0 :pointer)
  (arg1 nk-buttons)
  (x :int)
  (y :int)
  (down :int)
)
#+ecl
(ffi:def-function ("nk_input_button" nk-input-button)
    (
     (arg0 :pointer)
     (arg1 :int)
     (x :int)
     (y :int)
     (down :int)
    )
)

; nk_input_scroll
#-ecl
; [SHIM] nk_input_scroll — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_input_scroll" nk-input-scroll) :void
  (arg0 :pointer)
  (val :pointer)
)
#+ecl
(ffi:def-function ("nk_input_scroll" nk-input-scroll)
    (
     (arg0 :pointer)
     (val (:struct nk-vec2))
    )
)

; nk_input_char
#-ecl
(cffi:defcfun ("nk_input_char" nk-input-char) :void
  (arg0 :pointer)
  (arg1 :char)
)
#+ecl
(ffi:def-function ("nk_input_char" nk-input-char)
    (
     (arg0 :pointer)
     (arg1 :char)
    )
)

; nk_input_glyph
#-ecl
(cffi:defcfun ("nk_input_glyph" nk-input-glyph) :void
  (arg0 :pointer)
  (arg1 (:array :char 4))
)
#+ecl
(ffi:def-function ("nk_input_glyph" nk-input-glyph)
    (
     (arg0 :pointer)
     (arg1 :pointer)
    )
)

; nk_input_unicode
#-ecl
(cffi:defcfun ("nk_input_unicode" nk-input-unicode) :void
  (arg0 :pointer)
  (arg1 :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_input_unicode" nk-input-unicode)
    (
     (arg0 :pointer)
     (arg1 :unsigned-int)
    )
)

; nk_input_end
#-ecl
(cffi:defcfun ("nk_input_end" nk-input-end) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_input_end" nk-input-end)
    (
     (arg0 :pointer)
    )
)

; nk__begin
#-ecl
(cffi:defcfun ("nk__begin" nk--begin) :pointer
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk__begin" nk--begin)
    (
     (arg0 :pointer)
    )
  :returning :pointer
)

; nk__next
#-ecl
(cffi:defcfun ("nk__next" nk--next) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk__next" nk--next)
    (
     (arg0 :pointer)
     (arg1 :pointer)
    )
  :returning :pointer
)

; nk_convert
#-ecl
(cffi:defcfun ("nk_convert" nk-convert) :unsigned-int
  (arg0 :pointer)
  (cmds :pointer)
  (vertices :pointer)
  (elements :pointer)
  (arg4 :pointer)
)
#+ecl
(ffi:def-function ("nk_convert" nk-convert)
    (
     (arg0 :pointer)
     (cmds :pointer)
     (vertices :pointer)
     (elements :pointer)
     (arg4 :pointer)
    )
  :returning :unsigned-int
)

; nk__draw_begin
#-ecl
(cffi:defcfun ("nk__draw_begin" nk--draw-begin) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk__draw_begin" nk--draw-begin)
    (
     (arg0 :pointer)
     (arg1 :pointer)
    )
  :returning :pointer
)

; nk__draw_end
#-ecl
(cffi:defcfun ("nk__draw_end" nk--draw-end) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk__draw_end" nk--draw-end)
    (
     (arg0 :pointer)
     (arg1 :pointer)
    )
  :returning :pointer
)

; nk__draw_next
#-ecl
(cffi:defcfun ("nk__draw_next" nk--draw-next) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk__draw_next" nk--draw-next)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :pointer)
    )
  :returning :pointer
)

; nk_begin
#-ecl
; [SHIM] nk_begin — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_begin" nk-begin) :int
  (ctx :pointer)
  (title :pointer)
  (bounds :pointer)
  (flags :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_begin" nk-begin)
    (
     (ctx :pointer)
     (title :pointer)
     (bounds (:struct nk-rect))
     (flags :unsigned-int)
    )
  :returning :int
)

; nk_begin_titled
#-ecl
; [SHIM] nk_begin_titled — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_begin_titled" nk-begin-titled) :int
  (ctx :pointer)
  (name :pointer)
  (title :pointer)
  (bounds :pointer)
  (flags :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_begin_titled" nk-begin-titled)
    (
     (ctx :pointer)
     (name :pointer)
     (title :pointer)
     (bounds (:struct nk-rect))
     (flags :unsigned-int)
    )
  :returning :int
)

; nk_end
#-ecl
(cffi:defcfun ("nk_end" nk-end) :void
  (ctx :pointer)
)
#+ecl
(ffi:def-function ("nk_end" nk-end)
    (
     (ctx :pointer)
    )
)

; nk_window_find
#-ecl
(cffi:defcfun ("nk_window_find" nk-window-find) :pointer
  (ctx :pointer)
  (name :pointer)
)
#+ecl
(ffi:def-function ("nk_window_find" nk-window-find)
    (
     (ctx :pointer)
     (name :pointer)
    )
  :returning :pointer
)

; nk_window_get_bounds
#-ecl
; [SHIM] nk_window_get_bounds — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_window_get_bounds" nk-window-get-bounds) :void
  (ctx :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_window_get_bounds" nk-window-get-bounds)
    (
     (ctx :pointer)
    )
  :returning (:struct nk-rect)
)

; nk_window_get_position
#-ecl
; [SHIM] nk_window_get_position — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_window_get_position" nk-window-get-position) :void
  (ctx :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_window_get_position" nk-window-get-position)
    (
     (ctx :pointer)
    )
  :returning (:struct nk-vec2)
)

; nk_window_get_size
#-ecl
; [SHIM] nk_window_get_size — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_window_get_size" nk-window-get-size) :void
  (ctx :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_window_get_size" nk-window-get-size)
    (
     (ctx :pointer)
    )
  :returning (:struct nk-vec2)
)

; nk_window_get_width
#-ecl
(cffi:defcfun ("nk_window_get_width" nk-window-get-width) :float
  (ctx :pointer)
)
#+ecl
(ffi:def-function ("nk_window_get_width" nk-window-get-width)
    (
     (ctx :pointer)
    )
  :returning :float
)

; nk_window_get_height
#-ecl
(cffi:defcfun ("nk_window_get_height" nk-window-get-height) :float
  (ctx :pointer)
)
#+ecl
(ffi:def-function ("nk_window_get_height" nk-window-get-height)
    (
     (ctx :pointer)
    )
  :returning :float
)

; nk_window_get_panel
#-ecl
(cffi:defcfun ("nk_window_get_panel" nk-window-get-panel) :pointer
  (ctx :pointer)
)
#+ecl
(ffi:def-function ("nk_window_get_panel" nk-window-get-panel)
    (
     (ctx :pointer)
    )
  :returning :pointer
)

; nk_window_get_content_region
#-ecl
; [SHIM] nk_window_get_content_region — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_window_get_content_region" nk-window-get-content-region) :void
  (ctx :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_window_get_content_region" nk-window-get-content-region)
    (
     (ctx :pointer)
    )
  :returning (:struct nk-rect)
)

; nk_window_get_content_region_min
#-ecl
; [SHIM] nk_window_get_content_region_min — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_window_get_content_region_min" nk-window-get-content-region-min) :void
  (ctx :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_window_get_content_region_min" nk-window-get-content-region-min)
    (
     (ctx :pointer)
    )
  :returning (:struct nk-vec2)
)

; nk_window_get_content_region_max
#-ecl
; [SHIM] nk_window_get_content_region_max — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_window_get_content_region_max" nk-window-get-content-region-max) :void
  (ctx :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_window_get_content_region_max" nk-window-get-content-region-max)
    (
     (ctx :pointer)
    )
  :returning (:struct nk-vec2)
)

; nk_window_get_content_region_size
#-ecl
; [SHIM] nk_window_get_content_region_size — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_window_get_content_region_size" nk-window-get-content-region-size) :void
  (ctx :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_window_get_content_region_size" nk-window-get-content-region-size)
    (
     (ctx :pointer)
    )
  :returning (:struct nk-vec2)
)

; nk_window_get_canvas
#-ecl
(cffi:defcfun ("nk_window_get_canvas" nk-window-get-canvas) :pointer
  (ctx :pointer)
)
#+ecl
(ffi:def-function ("nk_window_get_canvas" nk-window-get-canvas)
    (
     (ctx :pointer)
    )
  :returning :pointer
)

; nk_window_get_scroll
#-ecl
(cffi:defcfun ("nk_window_get_scroll" nk-window-get-scroll) :void
  (ctx :pointer)
  (offset-x :pointer)
  (offset-y :pointer)
)
#+ecl
(ffi:def-function ("nk_window_get_scroll" nk-window-get-scroll)
    (
     (ctx :pointer)
     (offset-x :pointer)
     (offset-y :pointer)
    )
)

; nk_window_has_focus
#-ecl
(cffi:defcfun ("nk_window_has_focus" nk-window-has-focus) :int
  (ctx :pointer)
)
#+ecl
(ffi:def-function ("nk_window_has_focus" nk-window-has-focus)
    (
     (ctx :pointer)
    )
  :returning :int
)

; nk_window_is_hovered
#-ecl
(cffi:defcfun ("nk_window_is_hovered" nk-window-is-hovered) :int
  (ctx :pointer)
)
#+ecl
(ffi:def-function ("nk_window_is_hovered" nk-window-is-hovered)
    (
     (ctx :pointer)
    )
  :returning :int
)

; nk_window_is_collapsed
#-ecl
(cffi:defcfun ("nk_window_is_collapsed" nk-window-is-collapsed) :int
  (ctx :pointer)
  (name :pointer)
)
#+ecl
(ffi:def-function ("nk_window_is_collapsed" nk-window-is-collapsed)
    (
     (ctx :pointer)
     (name :pointer)
    )
  :returning :int
)

; nk_window_is_closed
#-ecl
(cffi:defcfun ("nk_window_is_closed" nk-window-is-closed) :int
  (ctx :pointer)
  (name :pointer)
)
#+ecl
(ffi:def-function ("nk_window_is_closed" nk-window-is-closed)
    (
     (ctx :pointer)
     (name :pointer)
    )
  :returning :int
)

; nk_window_is_hidden
#-ecl
(cffi:defcfun ("nk_window_is_hidden" nk-window-is-hidden) :int
  (ctx :pointer)
  (name :pointer)
)
#+ecl
(ffi:def-function ("nk_window_is_hidden" nk-window-is-hidden)
    (
     (ctx :pointer)
     (name :pointer)
    )
  :returning :int
)

; nk_window_is_active
#-ecl
(cffi:defcfun ("nk_window_is_active" nk-window-is-active) :int
  (ctx :pointer)
  (name :pointer)
)
#+ecl
(ffi:def-function ("nk_window_is_active" nk-window-is-active)
    (
     (ctx :pointer)
     (name :pointer)
    )
  :returning :int
)

; nk_window_is_any_hovered
#-ecl
(cffi:defcfun ("nk_window_is_any_hovered" nk-window-is-any-hovered) :int
  (ctx :pointer)
)
#+ecl
(ffi:def-function ("nk_window_is_any_hovered" nk-window-is-any-hovered)
    (
     (ctx :pointer)
    )
  :returning :int
)

; nk_item_is_any_active
#-ecl
(cffi:defcfun ("nk_item_is_any_active" nk-item-is-any-active) :int
  (ctx :pointer)
)
#+ecl
(ffi:def-function ("nk_item_is_any_active" nk-item-is-any-active)
    (
     (ctx :pointer)
    )
  :returning :int
)

; nk_window_set_bounds
#-ecl
; [SHIM] nk_window_set_bounds — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_window_set_bounds" nk-window-set-bounds) :void
  (ctx :pointer)
  (name :pointer)
  (bounds :pointer)
)
#+ecl
(ffi:def-function ("nk_window_set_bounds" nk-window-set-bounds)
    (
     (ctx :pointer)
     (name :pointer)
     (bounds (:struct nk-rect))
    )
)

; nk_window_set_position
#-ecl
; [SHIM] nk_window_set_position — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_window_set_position" nk-window-set-position) :void
  (ctx :pointer)
  (name :pointer)
  (pos :pointer)
)
#+ecl
(ffi:def-function ("nk_window_set_position" nk-window-set-position)
    (
     (ctx :pointer)
     (name :pointer)
     (pos (:struct nk-vec2))
    )
)

; nk_window_set_size
#-ecl
; [SHIM] nk_window_set_size — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_window_set_size" nk-window-set-size) :void
  (ctx :pointer)
  (name :pointer)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_window_set_size" nk-window-set-size)
    (
     (ctx :pointer)
     (name :pointer)
     (size (:struct nk-vec2))
    )
)

; nk_window_set_focus
#-ecl
(cffi:defcfun ("nk_window_set_focus" nk-window-set-focus) :void
  (ctx :pointer)
  (name :pointer)
)
#+ecl
(ffi:def-function ("nk_window_set_focus" nk-window-set-focus)
    (
     (ctx :pointer)
     (name :pointer)
    )
)

; nk_window_set_scroll
#-ecl
(cffi:defcfun ("nk_window_set_scroll" nk-window-set-scroll) :void
  (ctx :pointer)
  (offset-x :unsigned-int)
  (offset-y :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_window_set_scroll" nk-window-set-scroll)
    (
     (ctx :pointer)
     (offset-x :unsigned-int)
     (offset-y :unsigned-int)
    )
)

; nk_window_close
#-ecl
(cffi:defcfun ("nk_window_close" nk-window-close) :void
  (ctx :pointer)
  (name :pointer)
)
#+ecl
(ffi:def-function ("nk_window_close" nk-window-close)
    (
     (ctx :pointer)
     (name :pointer)
    )
)

; nk_window_collapse
#-ecl
(cffi:defcfun ("nk_window_collapse" nk-window-collapse) :void
  (ctx :pointer)
  (name :pointer)
  (state nk-collapse-states)
)
#+ecl
(ffi:def-function ("nk_window_collapse" nk-window-collapse)
    (
     (ctx :pointer)
     (name :pointer)
     (state :int)
    )
)

; nk_window_collapse_if
#-ecl
(cffi:defcfun ("nk_window_collapse_if" nk-window-collapse-if) :void
  (ctx :pointer)
  (name :pointer)
  (state nk-collapse-states)
  (cond :int)
)
#+ecl
(ffi:def-function ("nk_window_collapse_if" nk-window-collapse-if)
    (
     (ctx :pointer)
     (name :pointer)
     (state :int)
     (cond :int)
    )
)

; nk_window_show
#-ecl
(cffi:defcfun ("nk_window_show" nk-window-show) :void
  (ctx :pointer)
  (name :pointer)
  (state nk-show-states)
)
#+ecl
(ffi:def-function ("nk_window_show" nk-window-show)
    (
     (ctx :pointer)
     (name :pointer)
     (state :int)
    )
)

; nk_window_show_if
#-ecl
(cffi:defcfun ("nk_window_show_if" nk-window-show-if) :void
  (ctx :pointer)
  (name :pointer)
  (state nk-show-states)
  (cond :int)
)
#+ecl
(ffi:def-function ("nk_window_show_if" nk-window-show-if)
    (
     (ctx :pointer)
     (name :pointer)
     (state :int)
     (cond :int)
    )
)

; nk_rule_horizontal
#-ecl
; [SHIM] nk_rule_horizontal — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rule_horizontal" nk-rule-horizontal) :void
  (ctx :pointer)
  (color :pointer)
  (rounding :int)
)
#+ecl
(ffi:def-function ("nk_rule_horizontal" nk-rule-horizontal)
    (
     (ctx :pointer)
     (color (:struct nk-color))
     (rounding :int)
    )
)

; nk_layout_set_min_row_height
#-ecl
(cffi:defcfun ("nk_layout_set_min_row_height" nk-layout-set-min-row-height) :void
  (arg0 :pointer)
  (height :float)
)
#+ecl
(ffi:def-function ("nk_layout_set_min_row_height" nk-layout-set-min-row-height)
    (
     (arg0 :pointer)
     (height :float)
    )
)

; nk_layout_reset_min_row_height
#-ecl
(cffi:defcfun ("nk_layout_reset_min_row_height" nk-layout-reset-min-row-height) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_layout_reset_min_row_height" nk-layout-reset-min-row-height)
    (
     (arg0 :pointer)
    )
)

; nk_layout_widget_bounds
#-ecl
; [SHIM] nk_layout_widget_bounds — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_layout_widget_bounds" nk-layout-widget-bounds) :void
  (ctx :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_layout_widget_bounds" nk-layout-widget-bounds)
    (
     (ctx :pointer)
    )
  :returning (:struct nk-rect)
)

; nk_layout_ratio_from_pixel
#-ecl
(cffi:defcfun ("nk_layout_ratio_from_pixel" nk-layout-ratio-from-pixel) :float
  (ctx :pointer)
  (pixel-width :float)
)
#+ecl
(ffi:def-function ("nk_layout_ratio_from_pixel" nk-layout-ratio-from-pixel)
    (
     (ctx :pointer)
     (pixel-width :float)
    )
  :returning :float
)

; nk_layout_row_dynamic
#-ecl
(cffi:defcfun ("nk_layout_row_dynamic" nk-layout-row-dynamic) :void
  (ctx :pointer)
  (height :float)
  (cols :int)
)
#+ecl
(ffi:def-function ("nk_layout_row_dynamic" nk-layout-row-dynamic)
    (
     (ctx :pointer)
     (height :float)
     (cols :int)
    )
)

; nk_layout_row_static
#-ecl
(cffi:defcfun ("nk_layout_row_static" nk-layout-row-static) :void
  (ctx :pointer)
  (height :float)
  (item-width :int)
  (cols :int)
)
#+ecl
(ffi:def-function ("nk_layout_row_static" nk-layout-row-static)
    (
     (ctx :pointer)
     (height :float)
     (item-width :int)
     (cols :int)
    )
)

; nk_layout_row_begin
#-ecl
(cffi:defcfun ("nk_layout_row_begin" nk-layout-row-begin) :void
  (ctx :pointer)
  (fmt nk-layout-format)
  (row-height :float)
  (cols :int)
)
#+ecl
(ffi:def-function ("nk_layout_row_begin" nk-layout-row-begin)
    (
     (ctx :pointer)
     (fmt :int)
     (row-height :float)
     (cols :int)
    )
)

; nk_layout_row_push
#-ecl
(cffi:defcfun ("nk_layout_row_push" nk-layout-row-push) :void
  (arg0 :pointer)
  (value :float)
)
#+ecl
(ffi:def-function ("nk_layout_row_push" nk-layout-row-push)
    (
     (arg0 :pointer)
     (value :float)
    )
)

; nk_layout_row_end
#-ecl
(cffi:defcfun ("nk_layout_row_end" nk-layout-row-end) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_layout_row_end" nk-layout-row-end)
    (
     (arg0 :pointer)
    )
)

; nk_layout_row
#-ecl
(cffi:defcfun ("nk_layout_row" nk-layout-row) :void
  (arg0 :pointer)
  (arg1 nk-layout-format)
  (height :float)
  (cols :int)
  (ratio :pointer)
)
#+ecl
(ffi:def-function ("nk_layout_row" nk-layout-row)
    (
     (arg0 :pointer)
     (arg1 :int)
     (height :float)
     (cols :int)
     (ratio :pointer)
    )
)

; nk_layout_row_template_begin
#-ecl
(cffi:defcfun ("nk_layout_row_template_begin" nk-layout-row-template-begin) :void
  (arg0 :pointer)
  (row-height :float)
)
#+ecl
(ffi:def-function ("nk_layout_row_template_begin" nk-layout-row-template-begin)
    (
     (arg0 :pointer)
     (row-height :float)
    )
)

; nk_layout_row_template_push_dynamic
#-ecl
(cffi:defcfun ("nk_layout_row_template_push_dynamic" nk-layout-row-template-push-dynamic) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_layout_row_template_push_dynamic" nk-layout-row-template-push-dynamic)
    (
     (arg0 :pointer)
    )
)

; nk_layout_row_template_push_variable
#-ecl
(cffi:defcfun ("nk_layout_row_template_push_variable" nk-layout-row-template-push-variable) :void
  (arg0 :pointer)
  (min-width :float)
)
#+ecl
(ffi:def-function ("nk_layout_row_template_push_variable" nk-layout-row-template-push-variable)
    (
     (arg0 :pointer)
     (min-width :float)
    )
)

; nk_layout_row_template_push_static
#-ecl
(cffi:defcfun ("nk_layout_row_template_push_static" nk-layout-row-template-push-static) :void
  (arg0 :pointer)
  (width :float)
)
#+ecl
(ffi:def-function ("nk_layout_row_template_push_static" nk-layout-row-template-push-static)
    (
     (arg0 :pointer)
     (width :float)
    )
)

; nk_layout_row_template_end
#-ecl
(cffi:defcfun ("nk_layout_row_template_end" nk-layout-row-template-end) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_layout_row_template_end" nk-layout-row-template-end)
    (
     (arg0 :pointer)
    )
)

; nk_layout_space_begin
#-ecl
(cffi:defcfun ("nk_layout_space_begin" nk-layout-space-begin) :void
  (arg0 :pointer)
  (arg1 nk-layout-format)
  (height :float)
  (widget-count :int)
)
#+ecl
(ffi:def-function ("nk_layout_space_begin" nk-layout-space-begin)
    (
     (arg0 :pointer)
     (arg1 :int)
     (height :float)
     (widget-count :int)
    )
)

; nk_layout_space_push
#-ecl
; [SHIM] nk_layout_space_push — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_layout_space_push" nk-layout-space-push) :void
  (arg0 :pointer)
  (bounds :pointer)
)
#+ecl
(ffi:def-function ("nk_layout_space_push" nk-layout-space-push)
    (
     (arg0 :pointer)
     (bounds (:struct nk-rect))
    )
)

; nk_layout_space_end
#-ecl
(cffi:defcfun ("nk_layout_space_end" nk-layout-space-end) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_layout_space_end" nk-layout-space-end)
    (
     (arg0 :pointer)
    )
)

; nk_layout_space_bounds
#-ecl
; [SHIM] nk_layout_space_bounds — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_layout_space_bounds" nk-layout-space-bounds) :void
  (ctx :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_layout_space_bounds" nk-layout-space-bounds)
    (
     (ctx :pointer)
    )
  :returning (:struct nk-rect)
)

; nk_layout_space_to_screen
#-ecl
; [SHIM] nk_layout_space_to_screen — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_layout_space_to_screen" nk-layout-space-to-screen) :void
  (ctx :pointer)
  (vec :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_layout_space_to_screen" nk-layout-space-to-screen)
    (
     (ctx :pointer)
     (vec (:struct nk-vec2))
    )
  :returning (:struct nk-vec2)
)

; nk_layout_space_to_local
#-ecl
; [SHIM] nk_layout_space_to_local — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_layout_space_to_local" nk-layout-space-to-local) :void
  (ctx :pointer)
  (vec :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_layout_space_to_local" nk-layout-space-to-local)
    (
     (ctx :pointer)
     (vec (:struct nk-vec2))
    )
  :returning (:struct nk-vec2)
)

; nk_layout_space_rect_to_screen
#-ecl
; [SHIM] nk_layout_space_rect_to_screen — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_layout_space_rect_to_screen" nk-layout-space-rect-to-screen) :void
  (ctx :pointer)
  (bounds :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_layout_space_rect_to_screen" nk-layout-space-rect-to-screen)
    (
     (ctx :pointer)
     (bounds (:struct nk-rect))
    )
  :returning (:struct nk-rect)
)

; nk_layout_space_rect_to_local
#-ecl
; [SHIM] nk_layout_space_rect_to_local — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_layout_space_rect_to_local" nk-layout-space-rect-to-local) :void
  (ctx :pointer)
  (bounds :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_layout_space_rect_to_local" nk-layout-space-rect-to-local)
    (
     (ctx :pointer)
     (bounds (:struct nk-rect))
    )
  :returning (:struct nk-rect)
)

; nk_spacer
#-ecl
(cffi:defcfun ("nk_spacer" nk-spacer) :void
  (ctx :pointer)
)
#+ecl
(ffi:def-function ("nk_spacer" nk-spacer)
    (
     (ctx :pointer)
    )
)

; nk_group_begin
#-ecl
(cffi:defcfun ("nk_group_begin" nk-group-begin) :int
  (arg0 :pointer)
  (title :pointer)
  (arg2 :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_group_begin" nk-group-begin)
    (
     (arg0 :pointer)
     (title :pointer)
     (arg2 :unsigned-int)
    )
  :returning :int
)

; nk_group_begin_titled
#-ecl
(cffi:defcfun ("nk_group_begin_titled" nk-group-begin-titled) :int
  (arg0 :pointer)
  (name :pointer)
  (title :pointer)
  (arg3 :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_group_begin_titled" nk-group-begin-titled)
    (
     (arg0 :pointer)
     (name :pointer)
     (title :pointer)
     (arg3 :unsigned-int)
    )
  :returning :int
)

; nk_group_end
#-ecl
(cffi:defcfun ("nk_group_end" nk-group-end) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_group_end" nk-group-end)
    (
     (arg0 :pointer)
    )
)

; nk_group_scrolled_offset_begin
#-ecl
(cffi:defcfun ("nk_group_scrolled_offset_begin" nk-group-scrolled-offset-begin) :int
  (arg0 :pointer)
  (x-offset :pointer)
  (y-offset :pointer)
  (title :pointer)
  (flags :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_group_scrolled_offset_begin" nk-group-scrolled-offset-begin)
    (
     (arg0 :pointer)
     (x-offset :pointer)
     (y-offset :pointer)
     (title :pointer)
     (flags :unsigned-int)
    )
  :returning :int
)

; nk_group_scrolled_begin
#-ecl
(cffi:defcfun ("nk_group_scrolled_begin" nk-group-scrolled-begin) :int
  (arg0 :pointer)
  (off :pointer)
  (title :pointer)
  (arg3 :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_group_scrolled_begin" nk-group-scrolled-begin)
    (
     (arg0 :pointer)
     (off :pointer)
     (title :pointer)
     (arg3 :unsigned-int)
    )
  :returning :int
)

; nk_group_scrolled_end
#-ecl
(cffi:defcfun ("nk_group_scrolled_end" nk-group-scrolled-end) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_group_scrolled_end" nk-group-scrolled-end)
    (
     (arg0 :pointer)
    )
)

; nk_group_get_scroll
#-ecl
(cffi:defcfun ("nk_group_get_scroll" nk-group-get-scroll) :void
  (arg0 :pointer)
  (id :pointer)
  (x-offset :pointer)
  (y-offset :pointer)
)
#+ecl
(ffi:def-function ("nk_group_get_scroll" nk-group-get-scroll)
    (
     (arg0 :pointer)
     (id :pointer)
     (x-offset :pointer)
     (y-offset :pointer)
    )
)

; nk_group_set_scroll
#-ecl
(cffi:defcfun ("nk_group_set_scroll" nk-group-set-scroll) :void
  (arg0 :pointer)
  (id :pointer)
  (x-offset :unsigned-int)
  (y-offset :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_group_set_scroll" nk-group-set-scroll)
    (
     (arg0 :pointer)
     (id :pointer)
     (x-offset :unsigned-int)
     (y-offset :unsigned-int)
    )
)

; nk_tree_push_hashed
#-ecl
(cffi:defcfun ("nk_tree_push_hashed" nk-tree-push-hashed) :int
  (arg0 :pointer)
  (arg1 nk-tree-type)
  (title :pointer)
  (initial-state nk-collapse-states)
  (hash :pointer)
  (len :int)
  (seed :int)
)
#+ecl
(ffi:def-function ("nk_tree_push_hashed" nk-tree-push-hashed)
    (
     (arg0 :pointer)
     (arg1 :int)
     (title :pointer)
     (initial-state :int)
     (hash :pointer)
     (len :int)
     (seed :int)
    )
  :returning :int
)

; nk_tree_image_push_hashed
#-ecl
; [SHIM] nk_tree_image_push_hashed — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_tree_image_push_hashed" nk-tree-image-push-hashed) :int
  (arg0 :pointer)
  (arg1 nk-tree-type)
  (arg2 :pointer)
  (title :pointer)
  (initial-state nk-collapse-states)
  (hash :pointer)
  (len :int)
  (seed :int)
)
#+ecl
(ffi:def-function ("nk_tree_image_push_hashed" nk-tree-image-push-hashed)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 (:struct nk-image))
     (title :pointer)
     (initial-state :int)
     (hash :pointer)
     (len :int)
     (seed :int)
    )
  :returning :int
)

; nk_tree_pop
#-ecl
(cffi:defcfun ("nk_tree_pop" nk-tree-pop) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_tree_pop" nk-tree-pop)
    (
     (arg0 :pointer)
    )
)

; nk_tree_state_push
#-ecl
(cffi:defcfun ("nk_tree_state_push" nk-tree-state-push) :int
  (arg0 :pointer)
  (arg1 nk-tree-type)
  (title :pointer)
  (state :pointer)
)
#+ecl
(ffi:def-function ("nk_tree_state_push" nk-tree-state-push)
    (
     (arg0 :pointer)
     (arg1 :int)
     (title :pointer)
     (state :pointer)
    )
  :returning :int
)

; nk_tree_state_image_push
#-ecl
; [SHIM] nk_tree_state_image_push — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_tree_state_image_push" nk-tree-state-image-push) :int
  (arg0 :pointer)
  (arg1 nk-tree-type)
  (arg2 :pointer)
  (title :pointer)
  (state :pointer)
)
#+ecl
(ffi:def-function ("nk_tree_state_image_push" nk-tree-state-image-push)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 (:struct nk-image))
     (title :pointer)
     (state :pointer)
    )
  :returning :int
)

; nk_tree_state_pop
#-ecl
(cffi:defcfun ("nk_tree_state_pop" nk-tree-state-pop) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_tree_state_pop" nk-tree-state-pop)
    (
     (arg0 :pointer)
    )
)

; nk_tree_element_push_hashed
#-ecl
(cffi:defcfun ("nk_tree_element_push_hashed" nk-tree-element-push-hashed) :int
  (arg0 :pointer)
  (arg1 nk-tree-type)
  (title :pointer)
  (initial-state nk-collapse-states)
  (selected :pointer)
  (hash :pointer)
  (len :int)
  (seed :int)
)
#+ecl
(ffi:def-function ("nk_tree_element_push_hashed" nk-tree-element-push-hashed)
    (
     (arg0 :pointer)
     (arg1 :int)
     (title :pointer)
     (initial-state :int)
     (selected :pointer)
     (hash :pointer)
     (len :int)
     (seed :int)
    )
  :returning :int
)

; nk_tree_element_image_push_hashed
#-ecl
; [SHIM] nk_tree_element_image_push_hashed — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_tree_element_image_push_hashed" nk-tree-element-image-push-hashed) :int
  (arg0 :pointer)
  (arg1 nk-tree-type)
  (arg2 :pointer)
  (title :pointer)
  (initial-state nk-collapse-states)
  (selected :pointer)
  (hash :pointer)
  (len :int)
  (seed :int)
)
#+ecl
(ffi:def-function ("nk_tree_element_image_push_hashed" nk-tree-element-image-push-hashed)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 (:struct nk-image))
     (title :pointer)
     (initial-state :int)
     (selected :pointer)
     (hash :pointer)
     (len :int)
     (seed :int)
    )
  :returning :int
)

; nk_tree_element_pop
#-ecl
(cffi:defcfun ("nk_tree_element_pop" nk-tree-element-pop) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_tree_element_pop" nk-tree-element-pop)
    (
     (arg0 :pointer)
    )
)

; nk_list_view_begin
#-ecl
(cffi:defcfun ("nk_list_view_begin" nk-list-view-begin) :int
  (arg0 :pointer)
  (out :pointer)
  (id :pointer)
  (arg3 :unsigned-int)
  (row-height :int)
  (row-count :int)
)
#+ecl
(ffi:def-function ("nk_list_view_begin" nk-list-view-begin)
    (
     (arg0 :pointer)
     (out :pointer)
     (id :pointer)
     (arg3 :unsigned-int)
     (row-height :int)
     (row-count :int)
    )
  :returning :int
)

; nk_list_view_end
#-ecl
(cffi:defcfun ("nk_list_view_end" nk-list-view-end) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_list_view_end" nk-list-view-end)
    (
     (arg0 :pointer)
    )
)

; nk_widget
#-ecl
(cffi:defcfun ("nk_widget" nk-widget) nk-widget-layout-states
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_widget" nk-widget)
    (
     (arg0 :pointer)
     (arg1 :pointer)
    )
  :returning :int
)

; nk_widget_bounds
#-ecl
; [SHIM] nk_widget_bounds — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_widget_bounds" nk-widget-bounds) :void
  (arg0 :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_widget_bounds" nk-widget-bounds)
    (
     (arg0 :pointer)
    )
  :returning (:struct nk-rect)
)

; nk_widget_position
#-ecl
; [SHIM] nk_widget_position — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_widget_position" nk-widget-position) :void
  (arg0 :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_widget_position" nk-widget-position)
    (
     (arg0 :pointer)
    )
  :returning (:struct nk-vec2)
)

; nk_widget_size
#-ecl
; [SHIM] nk_widget_size — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_widget_size" nk-widget-size) :void
  (arg0 :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_widget_size" nk-widget-size)
    (
     (arg0 :pointer)
    )
  :returning (:struct nk-vec2)
)

; nk_widget_width
#-ecl
(cffi:defcfun ("nk_widget_width" nk-widget-width) :float
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_widget_width" nk-widget-width)
    (
     (arg0 :pointer)
    )
  :returning :float
)

; nk_widget_height
#-ecl
(cffi:defcfun ("nk_widget_height" nk-widget-height) :float
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_widget_height" nk-widget-height)
    (
     (arg0 :pointer)
    )
  :returning :float
)

; nk_widget_is_hovered
#-ecl
(cffi:defcfun ("nk_widget_is_hovered" nk-widget-is-hovered) :int
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_widget_is_hovered" nk-widget-is-hovered)
    (
     (arg0 :pointer)
    )
  :returning :int
)

; nk_widget_is_mouse_clicked
#-ecl
(cffi:defcfun ("nk_widget_is_mouse_clicked" nk-widget-is-mouse-clicked) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
)
#+ecl
(ffi:def-function ("nk_widget_is_mouse_clicked" nk-widget-is-mouse-clicked)
    (
     (arg0 :pointer)
     (arg1 :int)
    )
  :returning :int
)

; nk_widget_has_mouse_click_down
#-ecl
(cffi:defcfun ("nk_widget_has_mouse_click_down" nk-widget-has-mouse-click-down) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
  (down :int)
)
#+ecl
(ffi:def-function ("nk_widget_has_mouse_click_down" nk-widget-has-mouse-click-down)
    (
     (arg0 :pointer)
     (arg1 :int)
     (down :int)
    )
  :returning :int
)

; nk_spacing
#-ecl
(cffi:defcfun ("nk_spacing" nk-spacing) :void
  (arg0 :pointer)
  (cols :int)
)
#+ecl
(ffi:def-function ("nk_spacing" nk-spacing)
    (
     (arg0 :pointer)
     (cols :int)
    )
)

; nk_widget_disable_begin
#-ecl
(cffi:defcfun ("nk_widget_disable_begin" nk-widget-disable-begin) :void
  (ctx :pointer)
)
#+ecl
(ffi:def-function ("nk_widget_disable_begin" nk-widget-disable-begin)
    (
     (ctx :pointer)
    )
)

; nk_widget_disable_end
#-ecl
(cffi:defcfun ("nk_widget_disable_end" nk-widget-disable-end) :void
  (ctx :pointer)
)
#+ecl
(ffi:def-function ("nk_widget_disable_end" nk-widget-disable-end)
    (
     (ctx :pointer)
    )
)

; nk_text
#-ecl
(cffi:defcfun ("nk_text" nk-text) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_text" nk-text)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
     (arg3 :unsigned-int)
    )
)

; nk_text_colored
#-ecl
; [SHIM] nk_text_colored — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_text_colored" nk-text-colored) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :unsigned-int)
  (arg4 :pointer)
)
#+ecl
(ffi:def-function ("nk_text_colored" nk-text-colored)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
     (arg3 :unsigned-int)
     (arg4 (:struct nk-color))
    )
)

; nk_text_wrap
#-ecl
(cffi:defcfun ("nk_text_wrap" nk-text-wrap) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
)
#+ecl
(ffi:def-function ("nk_text_wrap" nk-text-wrap)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
    )
)

; nk_text_wrap_colored
#-ecl
; [SHIM] nk_text_wrap_colored — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_text_wrap_colored" nk-text-wrap-colored) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :pointer)
)
#+ecl
(ffi:def-function ("nk_text_wrap_colored" nk-text-wrap-colored)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
     (arg3 (:struct nk-color))
    )
)

; nk_label
#-ecl
(cffi:defcfun ("nk_label" nk-label) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (align :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_label" nk-label)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (align :unsigned-int)
    )
)

; nk_label_colored
#-ecl
; [SHIM] nk_label_colored — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_label_colored" nk-label-colored) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (align :unsigned-int)
  (arg3 :pointer)
)
#+ecl
(ffi:def-function ("nk_label_colored" nk-label-colored)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (align :unsigned-int)
     (arg3 (:struct nk-color))
    )
)

; nk_label_wrap
#-ecl
(cffi:defcfun ("nk_label_wrap" nk-label-wrap) :void
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_label_wrap" nk-label-wrap)
    (
     (arg0 :pointer)
     (arg1 :pointer)
    )
)

; nk_label_colored_wrap
#-ecl
; [SHIM] nk_label_colored_wrap — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_label_colored_wrap" nk-label-colored-wrap) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_label_colored_wrap" nk-label-colored-wrap)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 (:struct nk-color))
    )
)

; nk_image
#-ecl
; [SHIM] nk_image — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_image" nk-image) :void
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_image" nk-image)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-image))
    )
)

; nk_image_color
#-ecl
; [SHIM] nk_image_color — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_image_color" nk-image-color) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_image_color" nk-image-color)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-image))
     (arg2 (:struct nk-color))
    )
)

; nk_labelf — variadic, skipped (wrap manually if needed)

; nk_labelf_colored — variadic, skipped (wrap manually if needed)

; nk_labelf_wrap — variadic, skipped (wrap manually if needed)

; nk_labelf_colored_wrap — variadic, skipped (wrap manually if needed)

; nk_labelfv
#-ecl
(cffi:defcfun ("nk_labelfv" nk-labelfv) :void
  (arg0 :pointer)
  (arg1 :unsigned-int)
  (arg2 :pointer)
  (arg3 :pointer)
)
#+ecl
(ffi:def-function ("nk_labelfv" nk-labelfv)
    (
     (arg0 :pointer)
     (arg1 :unsigned-int)
     (arg2 :pointer)
     (arg3 :pointer)
    )
)

; nk_labelfv_colored
#-ecl
; [SHIM] nk_labelfv_colored — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_labelfv_colored" nk-labelfv-colored) :void
  (arg0 :pointer)
  (arg1 :unsigned-int)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer)
)
#+ecl
(ffi:def-function ("nk_labelfv_colored" nk-labelfv-colored)
    (
     (arg0 :pointer)
     (arg1 :unsigned-int)
     (arg2 (:struct nk-color))
     (arg3 :pointer)
     (arg4 :pointer)
    )
)

; nk_labelfv_wrap
#-ecl
(cffi:defcfun ("nk_labelfv_wrap" nk-labelfv-wrap) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_labelfv_wrap" nk-labelfv-wrap)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :pointer)
    )
)

; nk_labelfv_colored_wrap
#-ecl
; [SHIM] nk_labelfv_colored_wrap — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_labelfv_colored_wrap" nk-labelfv-colored-wrap) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
)
#+ecl
(ffi:def-function ("nk_labelfv_colored_wrap" nk-labelfv-colored-wrap)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-color))
     (arg2 :pointer)
     (arg3 :pointer)
    )
)

; nk_value_bool
#-ecl
(cffi:defcfun ("nk_value_bool" nk-value-bool) :void
  (arg0 :pointer)
  (prefix :pointer)
  (arg2 :int)
)
#+ecl
(ffi:def-function ("nk_value_bool" nk-value-bool)
    (
     (arg0 :pointer)
     (prefix :pointer)
     (arg2 :int)
    )
)

; nk_value_int
#-ecl
(cffi:defcfun ("nk_value_int" nk-value-int) :void
  (arg0 :pointer)
  (prefix :pointer)
  (arg2 :int)
)
#+ecl
(ffi:def-function ("nk_value_int" nk-value-int)
    (
     (arg0 :pointer)
     (prefix :pointer)
     (arg2 :int)
    )
)

; nk_value_uint
#-ecl
(cffi:defcfun ("nk_value_uint" nk-value-uint) :void
  (arg0 :pointer)
  (prefix :pointer)
  (arg2 :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_value_uint" nk-value-uint)
    (
     (arg0 :pointer)
     (prefix :pointer)
     (arg2 :unsigned-int)
    )
)

; nk_value_float
#-ecl
(cffi:defcfun ("nk_value_float" nk-value-float) :void
  (arg0 :pointer)
  (prefix :pointer)
  (arg2 :float)
)
#+ecl
(ffi:def-function ("nk_value_float" nk-value-float)
    (
     (arg0 :pointer)
     (prefix :pointer)
     (arg2 :float)
    )
)

; nk_value_color_byte
#-ecl
; [SHIM] nk_value_color_byte — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_value_color_byte" nk-value-color-byte) :void
  (arg0 :pointer)
  (prefix :pointer)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_value_color_byte" nk-value-color-byte)
    (
     (arg0 :pointer)
     (prefix :pointer)
     (arg2 (:struct nk-color))
    )
)

; nk_value_color_float
#-ecl
; [SHIM] nk_value_color_float — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_value_color_float" nk-value-color-float) :void
  (arg0 :pointer)
  (prefix :pointer)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_value_color_float" nk-value-color-float)
    (
     (arg0 :pointer)
     (prefix :pointer)
     (arg2 (:struct nk-color))
    )
)

; nk_value_color_hex
#-ecl
; [SHIM] nk_value_color_hex — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_value_color_hex" nk-value-color-hex) :void
  (arg0 :pointer)
  (prefix :pointer)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_value_color_hex" nk-value-color-hex)
    (
     (arg0 :pointer)
     (prefix :pointer)
     (arg2 (:struct nk-color))
    )
)

; nk_button_text
#-ecl
(cffi:defcfun ("nk_button_text" nk-button-text) :int
  (arg0 :pointer)
  (title :pointer)
  (len :int)
)
#+ecl
(ffi:def-function ("nk_button_text" nk-button-text)
    (
     (arg0 :pointer)
     (title :pointer)
     (len :int)
    )
  :returning :int
)

; nk_button_label
#-ecl
(cffi:defcfun ("nk_button_label" nk-button-label) :int
  (arg0 :pointer)
  (title :pointer)
)
#+ecl
(ffi:def-function ("nk_button_label" nk-button-label)
    (
     (arg0 :pointer)
     (title :pointer)
    )
  :returning :int
)

; nk_button_color
#-ecl
; [SHIM] nk_button_color — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_button_color" nk-button-color) :int
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_button_color" nk-button-color)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-color))
    )
  :returning :int
)

; nk_button_symbol
#-ecl
(cffi:defcfun ("nk_button_symbol" nk-button-symbol) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
)
#+ecl
(ffi:def-function ("nk_button_symbol" nk-button-symbol)
    (
     (arg0 :pointer)
     (arg1 :int)
    )
  :returning :int
)

; nk_button_image
#-ecl
; [SHIM] nk_button_image — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_button_image" nk-button-image) :int
  (arg0 :pointer)
  (img :pointer)
)
#+ecl
(ffi:def-function ("nk_button_image" nk-button-image)
    (
     (arg0 :pointer)
     (img (:struct nk-image))
    )
  :returning :int
)

; nk_button_symbol_label
#-ecl
(cffi:defcfun ("nk_button_symbol_label" nk-button-symbol-label) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (text-alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_button_symbol_label" nk-button-symbol-label)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 :pointer)
     (text-alignment :unsigned-int)
    )
  :returning :int
)

; nk_button_symbol_text
#-ecl
(cffi:defcfun ("nk_button_symbol_text" nk-button-symbol-text) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (arg3 :int)
  (alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_button_symbol_text" nk-button-symbol-text)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 :pointer)
     (arg3 :int)
     (alignment :unsigned-int)
    )
  :returning :int
)

; nk_button_image_label
#-ecl
; [SHIM] nk_button_image_label — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_button_image_label" nk-button-image-label) :int
  (arg0 :pointer)
  (img :pointer)
  (arg2 :pointer)
  (text-alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_button_image_label" nk-button-image-label)
    (
     (arg0 :pointer)
     (img (:struct nk-image))
     (arg2 :pointer)
     (text-alignment :unsigned-int)
    )
  :returning :int
)

; nk_button_image_text
#-ecl
; [SHIM] nk_button_image_text — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_button_image_text" nk-button-image-text) :int
  (arg0 :pointer)
  (img :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_button_image_text" nk-button-image-text)
    (
     (arg0 :pointer)
     (img (:struct nk-image))
     (arg2 :pointer)
     (arg3 :int)
     (alignment :unsigned-int)
    )
  :returning :int
)

; nk_button_text_styled
#-ecl
(cffi:defcfun ("nk_button_text_styled" nk-button-text-styled) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (title :pointer)
  (len :int)
)
#+ecl
(ffi:def-function ("nk_button_text_styled" nk-button-text-styled)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (title :pointer)
     (len :int)
    )
  :returning :int
)

; nk_button_label_styled
#-ecl
(cffi:defcfun ("nk_button_label_styled" nk-button-label-styled) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (title :pointer)
)
#+ecl
(ffi:def-function ("nk_button_label_styled" nk-button-label-styled)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (title :pointer)
    )
  :returning :int
)

; nk_button_symbol_styled
#-ecl
(cffi:defcfun ("nk_button_symbol_styled" nk-button-symbol-styled) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 nk-symbol-type)
)
#+ecl
(ffi:def-function ("nk_button_symbol_styled" nk-button-symbol-styled)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
    )
  :returning :int
)

; nk_button_image_styled
#-ecl
; [SHIM] nk_button_image_styled — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_button_image_styled" nk-button-image-styled) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (img :pointer)
)
#+ecl
(ffi:def-function ("nk_button_image_styled" nk-button-image-styled)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (img (:struct nk-image))
    )
  :returning :int
)

; nk_button_symbol_text_styled
#-ecl
(cffi:defcfun ("nk_button_symbol_text_styled" nk-button-symbol-text-styled) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 nk-symbol-type)
  (arg3 :pointer)
  (arg4 :int)
  (alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_button_symbol_text_styled" nk-button-symbol-text-styled)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
     (arg3 :pointer)
     (arg4 :int)
     (alignment :unsigned-int)
    )
  :returning :int
)

; nk_button_symbol_label_styled
#-ecl
(cffi:defcfun ("nk_button_symbol_label_styled" nk-button-symbol-label-styled) :int
  (ctx :pointer)
  (style :pointer)
  (symbol nk-symbol-type)
  (title :pointer)
  (align :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_button_symbol_label_styled" nk-button-symbol-label-styled)
    (
     (ctx :pointer)
     (style :pointer)
     (symbol :int)
     (title :pointer)
     (align :unsigned-int)
    )
  :returning :int
)

; nk_button_image_label_styled
#-ecl
; [SHIM] nk_button_image_label_styled — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_button_image_label_styled" nk-button-image-label-styled) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (img :pointer)
  (arg3 :pointer)
  (text-alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_button_image_label_styled" nk-button-image-label-styled)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (img (:struct nk-image))
     (arg3 :pointer)
     (text-alignment :unsigned-int)
    )
  :returning :int
)

; nk_button_image_text_styled
#-ecl
; [SHIM] nk_button_image_text_styled — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_button_image_text_styled" nk-button-image-text-styled) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (img :pointer)
  (arg3 :pointer)
  (arg4 :int)
  (alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_button_image_text_styled" nk-button-image-text-styled)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (img (:struct nk-image))
     (arg3 :pointer)
     (arg4 :int)
     (alignment :unsigned-int)
    )
  :returning :int
)

; nk_button_set_behavior
#-ecl
(cffi:defcfun ("nk_button_set_behavior" nk-button-set-behavior) :void
  (arg0 :pointer)
  (arg1 nk-button-behavior)
)
#+ecl
(ffi:def-function ("nk_button_set_behavior" nk-button-set-behavior)
    (
     (arg0 :pointer)
     (arg1 :int)
    )
)

; nk_button_push_behavior
#-ecl
(cffi:defcfun ("nk_button_push_behavior" nk-button-push-behavior) :int
  (arg0 :pointer)
  (arg1 nk-button-behavior)
)
#+ecl
(ffi:def-function ("nk_button_push_behavior" nk-button-push-behavior)
    (
     (arg0 :pointer)
     (arg1 :int)
    )
  :returning :int
)

; nk_button_pop_behavior
#-ecl
(cffi:defcfun ("nk_button_pop_behavior" nk-button-pop-behavior) :int
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_button_pop_behavior" nk-button-pop-behavior)
    (
     (arg0 :pointer)
    )
  :returning :int
)

; nk_check_label
#-ecl
(cffi:defcfun ("nk_check_label" nk-check-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (active :int)
)
#+ecl
(ffi:def-function ("nk_check_label" nk-check-label)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (active :int)
    )
  :returning :int
)

; nk_check_text
#-ecl
(cffi:defcfun ("nk_check_text" nk-check-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (active :int)
)
#+ecl
(ffi:def-function ("nk_check_text" nk-check-text)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
     (active :int)
    )
  :returning :int
)

; nk_check_text_align
#-ecl
(cffi:defcfun ("nk_check_text_align" nk-check-text-align) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (active :int)
  (widget-alignment :unsigned-int)
  (text-alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_check_text_align" nk-check-text-align)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
     (active :int)
     (widget-alignment :unsigned-int)
     (text-alignment :unsigned-int)
    )
  :returning :int
)

; nk_check_flags_label
#-ecl
(cffi:defcfun ("nk_check_flags_label" nk-check-flags-label) :unsigned-int
  (arg0 :pointer)
  (arg1 :pointer)
  (flags :unsigned-int)
  (value :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_check_flags_label" nk-check-flags-label)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (flags :unsigned-int)
     (value :unsigned-int)
    )
  :returning :unsigned-int
)

; nk_check_flags_text
#-ecl
(cffi:defcfun ("nk_check_flags_text" nk-check-flags-text) :unsigned-int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (flags :unsigned-int)
  (value :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_check_flags_text" nk-check-flags-text)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
     (flags :unsigned-int)
     (value :unsigned-int)
    )
  :returning :unsigned-int
)

; nk_checkbox_label
#-ecl
(cffi:defcfun ("nk_checkbox_label" nk-checkbox-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (active :pointer)
)
#+ecl
(ffi:def-function ("nk_checkbox_label" nk-checkbox-label)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (active :pointer)
    )
  :returning :int
)

; nk_checkbox_label_align
#-ecl
(cffi:defcfun ("nk_checkbox_label_align" nk-checkbox-label-align) :int
  (ctx :pointer)
  (label :pointer)
  (active :pointer)
  (widget-alignment :unsigned-int)
  (text-alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_checkbox_label_align" nk-checkbox-label-align)
    (
     (ctx :pointer)
     (label :pointer)
     (active :pointer)
     (widget-alignment :unsigned-int)
     (text-alignment :unsigned-int)
    )
  :returning :int
)

; nk_checkbox_text
#-ecl
(cffi:defcfun ("nk_checkbox_text" nk-checkbox-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (active :pointer)
)
#+ecl
(ffi:def-function ("nk_checkbox_text" nk-checkbox-text)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
     (active :pointer)
    )
  :returning :int
)

; nk_checkbox_text_align
#-ecl
(cffi:defcfun ("nk_checkbox_text_align" nk-checkbox-text-align) :int
  (ctx :pointer)
  (text :pointer)
  (len :int)
  (active :pointer)
  (widget-alignment :unsigned-int)
  (text-alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_checkbox_text_align" nk-checkbox-text-align)
    (
     (ctx :pointer)
     (text :pointer)
     (len :int)
     (active :pointer)
     (widget-alignment :unsigned-int)
     (text-alignment :unsigned-int)
    )
  :returning :int
)

; nk_checkbox_flags_label
#-ecl
(cffi:defcfun ("nk_checkbox_flags_label" nk-checkbox-flags-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (flags :pointer)
  (value :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_checkbox_flags_label" nk-checkbox-flags-label)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (flags :pointer)
     (value :unsigned-int)
    )
  :returning :int
)

; nk_checkbox_flags_text
#-ecl
(cffi:defcfun ("nk_checkbox_flags_text" nk-checkbox-flags-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (flags :pointer)
  (value :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_checkbox_flags_text" nk-checkbox-flags-text)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
     (flags :pointer)
     (value :unsigned-int)
    )
  :returning :int
)

; nk_radio_label
#-ecl
(cffi:defcfun ("nk_radio_label" nk-radio-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (active :pointer)
)
#+ecl
(ffi:def-function ("nk_radio_label" nk-radio-label)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (active :pointer)
    )
  :returning :int
)

; nk_radio_label_align
#-ecl
(cffi:defcfun ("nk_radio_label_align" nk-radio-label-align) :int
  (ctx :pointer)
  (label :pointer)
  (active :pointer)
  (widget-alignment :unsigned-int)
  (text-alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_radio_label_align" nk-radio-label-align)
    (
     (ctx :pointer)
     (label :pointer)
     (active :pointer)
     (widget-alignment :unsigned-int)
     (text-alignment :unsigned-int)
    )
  :returning :int
)

; nk_radio_text
#-ecl
(cffi:defcfun ("nk_radio_text" nk-radio-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (active :pointer)
)
#+ecl
(ffi:def-function ("nk_radio_text" nk-radio-text)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
     (active :pointer)
    )
  :returning :int
)

; nk_radio_text_align
#-ecl
(cffi:defcfun ("nk_radio_text_align" nk-radio-text-align) :int
  (ctx :pointer)
  (text :pointer)
  (len :int)
  (active :pointer)
  (widget-alignment :unsigned-int)
  (text-alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_radio_text_align" nk-radio-text-align)
    (
     (ctx :pointer)
     (text :pointer)
     (len :int)
     (active :pointer)
     (widget-alignment :unsigned-int)
     (text-alignment :unsigned-int)
    )
  :returning :int
)

; nk_option_label
#-ecl
(cffi:defcfun ("nk_option_label" nk-option-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (active :int)
)
#+ecl
(ffi:def-function ("nk_option_label" nk-option-label)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (active :int)
    )
  :returning :int
)

; nk_option_label_align
#-ecl
(cffi:defcfun ("nk_option_label_align" nk-option-label-align) :int
  (ctx :pointer)
  (label :pointer)
  (active :int)
  (widget-alignment :unsigned-int)
  (text-alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_option_label_align" nk-option-label-align)
    (
     (ctx :pointer)
     (label :pointer)
     (active :int)
     (widget-alignment :unsigned-int)
     (text-alignment :unsigned-int)
    )
  :returning :int
)

; nk_option_text
#-ecl
(cffi:defcfun ("nk_option_text" nk-option-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (active :int)
)
#+ecl
(ffi:def-function ("nk_option_text" nk-option-text)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
     (active :int)
    )
  :returning :int
)

; nk_option_text_align
#-ecl
(cffi:defcfun ("nk_option_text_align" nk-option-text-align) :int
  (ctx :pointer)
  (text :pointer)
  (len :int)
  (is-active :int)
  (widget-alignment :unsigned-int)
  (text-alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_option_text_align" nk-option-text-align)
    (
     (ctx :pointer)
     (text :pointer)
     (len :int)
     (is-active :int)
     (widget-alignment :unsigned-int)
     (text-alignment :unsigned-int)
    )
  :returning :int
)

; nk_selectable_label
#-ecl
(cffi:defcfun ("nk_selectable_label" nk-selectable-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (align :unsigned-int)
  (value :pointer)
)
#+ecl
(ffi:def-function ("nk_selectable_label" nk-selectable-label)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (align :unsigned-int)
     (value :pointer)
    )
  :returning :int
)

; nk_selectable_text
#-ecl
(cffi:defcfun ("nk_selectable_text" nk-selectable-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (align :unsigned-int)
  (value :pointer)
)
#+ecl
(ffi:def-function ("nk_selectable_text" nk-selectable-text)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
     (align :unsigned-int)
     (value :pointer)
    )
  :returning :int
)

; nk_selectable_image_label
#-ecl
; [SHIM] nk_selectable_image_label — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_selectable_image_label" nk-selectable-image-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (align :unsigned-int)
  (value :pointer)
)
#+ecl
(ffi:def-function ("nk_selectable_image_label" nk-selectable-image-label)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-image))
     (arg2 :pointer)
     (align :unsigned-int)
     (value :pointer)
    )
  :returning :int
)

; nk_selectable_image_text
#-ecl
; [SHIM] nk_selectable_image_text — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_selectable_image_text" nk-selectable-image-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (align :unsigned-int)
  (value :pointer)
)
#+ecl
(ffi:def-function ("nk_selectable_image_text" nk-selectable-image-text)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-image))
     (arg2 :pointer)
     (arg3 :int)
     (align :unsigned-int)
     (value :pointer)
    )
  :returning :int
)

; nk_selectable_symbol_label
#-ecl
(cffi:defcfun ("nk_selectable_symbol_label" nk-selectable-symbol-label) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (align :unsigned-int)
  (value :pointer)
)
#+ecl
(ffi:def-function ("nk_selectable_symbol_label" nk-selectable-symbol-label)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 :pointer)
     (align :unsigned-int)
     (value :pointer)
    )
  :returning :int
)

; nk_selectable_symbol_text
#-ecl
(cffi:defcfun ("nk_selectable_symbol_text" nk-selectable-symbol-text) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (arg3 :int)
  (align :unsigned-int)
  (value :pointer)
)
#+ecl
(ffi:def-function ("nk_selectable_symbol_text" nk-selectable-symbol-text)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 :pointer)
     (arg3 :int)
     (align :unsigned-int)
     (value :pointer)
    )
  :returning :int
)

; nk_select_label
#-ecl
(cffi:defcfun ("nk_select_label" nk-select-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (align :unsigned-int)
  (value :int)
)
#+ecl
(ffi:def-function ("nk_select_label" nk-select-label)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (align :unsigned-int)
     (value :int)
    )
  :returning :int
)

; nk_select_text
#-ecl
(cffi:defcfun ("nk_select_text" nk-select-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (align :unsigned-int)
  (value :int)
)
#+ecl
(ffi:def-function ("nk_select_text" nk-select-text)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
     (align :unsigned-int)
     (value :int)
    )
  :returning :int
)

; nk_select_image_label
#-ecl
; [SHIM] nk_select_image_label — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_select_image_label" nk-select-image-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (align :unsigned-int)
  (value :int)
)
#+ecl
(ffi:def-function ("nk_select_image_label" nk-select-image-label)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-image))
     (arg2 :pointer)
     (align :unsigned-int)
     (value :int)
    )
  :returning :int
)

; nk_select_image_text
#-ecl
; [SHIM] nk_select_image_text — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_select_image_text" nk-select-image-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (align :unsigned-int)
  (value :int)
)
#+ecl
(ffi:def-function ("nk_select_image_text" nk-select-image-text)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-image))
     (arg2 :pointer)
     (arg3 :int)
     (align :unsigned-int)
     (value :int)
    )
  :returning :int
)

; nk_select_symbol_label
#-ecl
(cffi:defcfun ("nk_select_symbol_label" nk-select-symbol-label) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (align :unsigned-int)
  (value :int)
)
#+ecl
(ffi:def-function ("nk_select_symbol_label" nk-select-symbol-label)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 :pointer)
     (align :unsigned-int)
     (value :int)
    )
  :returning :int
)

; nk_select_symbol_text
#-ecl
(cffi:defcfun ("nk_select_symbol_text" nk-select-symbol-text) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (arg3 :int)
  (align :unsigned-int)
  (value :int)
)
#+ecl
(ffi:def-function ("nk_select_symbol_text" nk-select-symbol-text)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 :pointer)
     (arg3 :int)
     (align :unsigned-int)
     (value :int)
    )
  :returning :int
)

; nk_slide_float
#-ecl
(cffi:defcfun ("nk_slide_float" nk-slide-float) :float
  (arg0 :pointer)
  (min :float)
  (val :float)
  (max :float)
  (step :float)
)
#+ecl
(ffi:def-function ("nk_slide_float" nk-slide-float)
    (
     (arg0 :pointer)
     (min :float)
     (val :float)
     (max :float)
     (step :float)
    )
  :returning :float
)

; nk_slide_int
#-ecl
(cffi:defcfun ("nk_slide_int" nk-slide-int) :int
  (arg0 :pointer)
  (min :int)
  (val :int)
  (max :int)
  (step :int)
)
#+ecl
(ffi:def-function ("nk_slide_int" nk-slide-int)
    (
     (arg0 :pointer)
     (min :int)
     (val :int)
     (max :int)
     (step :int)
    )
  :returning :int
)

; nk_slider_float
#-ecl
(cffi:defcfun ("nk_slider_float" nk-slider-float) :int
  (arg0 :pointer)
  (min :float)
  (val :pointer)
  (max :float)
  (step :float)
)
#+ecl
(ffi:def-function ("nk_slider_float" nk-slider-float)
    (
     (arg0 :pointer)
     (min :float)
     (val :pointer)
     (max :float)
     (step :float)
    )
  :returning :int
)

; nk_slider_int
#-ecl
(cffi:defcfun ("nk_slider_int" nk-slider-int) :int
  (arg0 :pointer)
  (min :int)
  (val :pointer)
  (max :int)
  (step :int)
)
#+ecl
(ffi:def-function ("nk_slider_int" nk-slider-int)
    (
     (arg0 :pointer)
     (min :int)
     (val :pointer)
     (max :int)
     (step :int)
    )
  :returning :int
)

; nk_knob_float
#-ecl
(cffi:defcfun ("nk_knob_float" nk-knob-float) :int
  (arg0 :pointer)
  (min :float)
  (val :pointer)
  (max :float)
  (step :float)
  (zero-direction nk-heading)
  (dead-zone-degrees :float)
)
#+ecl
(ffi:def-function ("nk_knob_float" nk-knob-float)
    (
     (arg0 :pointer)
     (min :float)
     (val :pointer)
     (max :float)
     (step :float)
     (zero-direction :int)
     (dead-zone-degrees :float)
    )
  :returning :int
)

; nk_knob_int
#-ecl
(cffi:defcfun ("nk_knob_int" nk-knob-int) :int
  (arg0 :pointer)
  (min :int)
  (val :pointer)
  (max :int)
  (step :int)
  (zero-direction nk-heading)
  (dead-zone-degrees :float)
)
#+ecl
(ffi:def-function ("nk_knob_int" nk-knob-int)
    (
     (arg0 :pointer)
     (min :int)
     (val :pointer)
     (max :int)
     (step :int)
     (zero-direction :int)
     (dead-zone-degrees :float)
    )
  :returning :int
)

; nk_progress
#-ecl
(cffi:defcfun ("nk_progress" nk-progress) :int
  (arg0 :pointer)
  (cur :pointer)
  (max :unsigned-long)
  (modifyable :int)
)
#+ecl
(ffi:def-function ("nk_progress" nk-progress)
    (
     (arg0 :pointer)
     (cur :pointer)
     (max :unsigned-long)
     (modifyable :int)
    )
  :returning :int
)

; nk_prog
#-ecl
(cffi:defcfun ("nk_prog" nk-prog) :unsigned-long
  (arg0 :pointer)
  (cur :unsigned-long)
  (max :unsigned-long)
  (modifyable :int)
)
#+ecl
(ffi:def-function ("nk_prog" nk-prog)
    (
     (arg0 :pointer)
     (cur :unsigned-long)
     (max :unsigned-long)
     (modifyable :int)
    )
  :returning :unsigned-long
)

; nk_color_picker
#-ecl
; [SHIM] nk_color_picker — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_color_picker" nk-color-picker) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 nk-color-format)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_color_picker" nk-color-picker)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-colorf))
     (arg2 :int)
    )
  :returning (:struct nk-colorf)
)

; nk_color_pick
#-ecl
(cffi:defcfun ("nk_color_pick" nk-color-pick) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 nk-color-format)
)
#+ecl
(ffi:def-function ("nk_color_pick" nk-color-pick)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
    )
  :returning :int
)

; nk_property_int
#-ecl
(cffi:defcfun ("nk_property_int" nk-property-int) :int
  (arg0 :pointer)
  (name :pointer)
  (min :int)
  (val :pointer)
  (max :int)
  (step :int)
  (inc-per-pixel :float)
)
#+ecl
(ffi:def-function ("nk_property_int" nk-property-int)
    (
     (arg0 :pointer)
     (name :pointer)
     (min :int)
     (val :pointer)
     (max :int)
     (step :int)
     (inc-per-pixel :float)
    )
  :returning :int
)

; nk_property_float
#-ecl
(cffi:defcfun ("nk_property_float" nk-property-float) :int
  (arg0 :pointer)
  (name :pointer)
  (min :float)
  (val :pointer)
  (max :float)
  (step :float)
  (inc-per-pixel :float)
)
#+ecl
(ffi:def-function ("nk_property_float" nk-property-float)
    (
     (arg0 :pointer)
     (name :pointer)
     (min :float)
     (val :pointer)
     (max :float)
     (step :float)
     (inc-per-pixel :float)
    )
  :returning :int
)

; nk_property_double
#-ecl
(cffi:defcfun ("nk_property_double" nk-property-double) :int
  (arg0 :pointer)
  (name :pointer)
  (min :double)
  (val :pointer)
  (max :double)
  (step :double)
  (inc-per-pixel :float)
)
#+ecl
(ffi:def-function ("nk_property_double" nk-property-double)
    (
     (arg0 :pointer)
     (name :pointer)
     (min :double)
     (val :pointer)
     (max :double)
     (step :double)
     (inc-per-pixel :float)
    )
  :returning :int
)

; nk_propertyi
#-ecl
(cffi:defcfun ("nk_propertyi" nk-propertyi) :int
  (arg0 :pointer)
  (name :pointer)
  (min :int)
  (val :int)
  (max :int)
  (step :int)
  (inc-per-pixel :float)
)
#+ecl
(ffi:def-function ("nk_propertyi" nk-propertyi)
    (
     (arg0 :pointer)
     (name :pointer)
     (min :int)
     (val :int)
     (max :int)
     (step :int)
     (inc-per-pixel :float)
    )
  :returning :int
)

; nk_propertyf
#-ecl
(cffi:defcfun ("nk_propertyf" nk-propertyf) :float
  (arg0 :pointer)
  (name :pointer)
  (min :float)
  (val :float)
  (max :float)
  (step :float)
  (inc-per-pixel :float)
)
#+ecl
(ffi:def-function ("nk_propertyf" nk-propertyf)
    (
     (arg0 :pointer)
     (name :pointer)
     (min :float)
     (val :float)
     (max :float)
     (step :float)
     (inc-per-pixel :float)
    )
  :returning :float
)

; nk_propertyd
#-ecl
(cffi:defcfun ("nk_propertyd" nk-propertyd) :double
  (arg0 :pointer)
  (name :pointer)
  (min :double)
  (val :double)
  (max :double)
  (step :double)
  (inc-per-pixel :float)
)
#+ecl
(ffi:def-function ("nk_propertyd" nk-propertyd)
    (
     (arg0 :pointer)
     (name :pointer)
     (min :double)
     (val :double)
     (max :double)
     (step :double)
     (inc-per-pixel :float)
    )
  :returning :double
)

; nk_edit_string
#-ecl
(cffi:defcfun ("nk_edit_string" nk-edit-string) :unsigned-int
  (arg0 :pointer)
  (arg1 :unsigned-int)
  (buffer :pointer)
  (len :pointer)
  (max :int)
  (arg5 :pointer)
)
#+ecl
(ffi:def-function ("nk_edit_string" nk-edit-string)
    (
     (arg0 :pointer)
     (arg1 :unsigned-int)
     (buffer :pointer)
     (len :pointer)
     (max :int)
     (arg5 :pointer)
    )
  :returning :unsigned-int
)

; nk_edit_string_zero_terminated
#-ecl
(cffi:defcfun ("nk_edit_string_zero_terminated" nk-edit-string-zero-terminated) :unsigned-int
  (arg0 :pointer)
  (arg1 :unsigned-int)
  (buffer :pointer)
  (max :int)
  (arg4 :pointer)
)
#+ecl
(ffi:def-function ("nk_edit_string_zero_terminated" nk-edit-string-zero-terminated)
    (
     (arg0 :pointer)
     (arg1 :unsigned-int)
     (buffer :pointer)
     (max :int)
     (arg4 :pointer)
    )
  :returning :unsigned-int
)

; nk_edit_buffer
#-ecl
(cffi:defcfun ("nk_edit_buffer" nk-edit-buffer) :unsigned-int
  (arg0 :pointer)
  (arg1 :unsigned-int)
  (arg2 :pointer)
  (arg3 :pointer)
)
#+ecl
(ffi:def-function ("nk_edit_buffer" nk-edit-buffer)
    (
     (arg0 :pointer)
     (arg1 :unsigned-int)
     (arg2 :pointer)
     (arg3 :pointer)
    )
  :returning :unsigned-int
)

; nk_edit_focus
#-ecl
(cffi:defcfun ("nk_edit_focus" nk-edit-focus) :void
  (arg0 :pointer)
  (flags :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_edit_focus" nk-edit-focus)
    (
     (arg0 :pointer)
     (flags :unsigned-int)
    )
)

; nk_edit_unfocus
#-ecl
(cffi:defcfun ("nk_edit_unfocus" nk-edit-unfocus) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_edit_unfocus" nk-edit-unfocus)
    (
     (arg0 :pointer)
    )
)

; nk_chart_begin
#-ecl
(cffi:defcfun ("nk_chart_begin" nk-chart-begin) :int
  (arg0 :pointer)
  (arg1 nk-chart-type)
  (num :int)
  (min :float)
  (max :float)
)
#+ecl
(ffi:def-function ("nk_chart_begin" nk-chart-begin)
    (
     (arg0 :pointer)
     (arg1 :int)
     (num :int)
     (min :float)
     (max :float)
    )
  :returning :int
)

; nk_chart_begin_colored
#-ecl
; [SHIM] nk_chart_begin_colored — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_chart_begin_colored" nk-chart-begin-colored) :int
  (arg0 :pointer)
  (arg1 nk-chart-type)
  (arg2 :pointer)
  (active :pointer)
  (num :int)
  (min :float)
  (max :float)
)
#+ecl
(ffi:def-function ("nk_chart_begin_colored" nk-chart-begin-colored)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 (:struct nk-color))
     (active (:struct nk-color))
     (num :int)
     (min :float)
     (max :float)
    )
  :returning :int
)

; nk_chart_add_slot
#-ecl
(cffi:defcfun ("nk_chart_add_slot" nk-chart-add-slot) :void
  (ctx :pointer)
  (arg1 nk-chart-type)
  (count :int)
  (min-value :float)
  (max-value :float)
)
#+ecl
(ffi:def-function ("nk_chart_add_slot" nk-chart-add-slot)
    (
     (ctx :pointer)
     (arg1 :int)
     (count :int)
     (min-value :float)
     (max-value :float)
    )
)

; nk_chart_add_slot_colored
#-ecl
; [SHIM] nk_chart_add_slot_colored — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_chart_add_slot_colored" nk-chart-add-slot-colored) :void
  (ctx :pointer)
  (arg1 nk-chart-type)
  (arg2 :pointer)
  (active :pointer)
  (count :int)
  (min-value :float)
  (max-value :float)
)
#+ecl
(ffi:def-function ("nk_chart_add_slot_colored" nk-chart-add-slot-colored)
    (
     (ctx :pointer)
     (arg1 :int)
     (arg2 (:struct nk-color))
     (active (:struct nk-color))
     (count :int)
     (min-value :float)
     (max-value :float)
    )
)

; nk_chart_push
#-ecl
(cffi:defcfun ("nk_chart_push" nk-chart-push) :unsigned-int
  (arg0 :pointer)
  (arg1 :float)
)
#+ecl
(ffi:def-function ("nk_chart_push" nk-chart-push)
    (
     (arg0 :pointer)
     (arg1 :float)
    )
  :returning :unsigned-int
)

; nk_chart_push_slot
#-ecl
(cffi:defcfun ("nk_chart_push_slot" nk-chart-push-slot) :unsigned-int
  (arg0 :pointer)
  (arg1 :float)
  (arg2 :int)
)
#+ecl
(ffi:def-function ("nk_chart_push_slot" nk-chart-push-slot)
    (
     (arg0 :pointer)
     (arg1 :float)
     (arg2 :int)
    )
  :returning :unsigned-int
)

; nk_chart_end
#-ecl
(cffi:defcfun ("nk_chart_end" nk-chart-end) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_chart_end" nk-chart-end)
    (
     (arg0 :pointer)
    )
)

; nk_plot
#-ecl
(cffi:defcfun ("nk_plot" nk-plot) :void
  (arg0 :pointer)
  (arg1 nk-chart-type)
  (values :pointer)
  (count :int)
  (offset :int)
)
#+ecl
(ffi:def-function ("nk_plot" nk-plot)
    (
     (arg0 :pointer)
     (arg1 :int)
     (values :pointer)
     (count :int)
     (offset :int)
    )
)

; nk_plot_function
#-ecl
(cffi:defcfun ("nk_plot_function" nk-plot-function) :void
  (arg0 :pointer)
  (arg1 nk-chart-type)
  (userdata :pointer)
  (value-getter :pointer)
  (count :int)
  (offset :int)
)
#+ecl
(ffi:def-function ("nk_plot_function" nk-plot-function)
    (
     (arg0 :pointer)
     (arg1 :int)
     (userdata :pointer)
     (value-getter :pointer)
     (count :int)
     (offset :int)
    )
)

; nk_popup_begin
#-ecl
; [SHIM] nk_popup_begin — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_popup_begin" nk-popup-begin) :int
  (arg0 :pointer)
  (arg1 nk-popup-type)
  (arg2 :pointer)
  (arg3 :unsigned-int)
  (bounds :pointer)
)
#+ecl
(ffi:def-function ("nk_popup_begin" nk-popup-begin)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 :pointer)
     (arg3 :unsigned-int)
     (bounds (:struct nk-rect))
    )
  :returning :int
)

; nk_popup_close
#-ecl
(cffi:defcfun ("nk_popup_close" nk-popup-close) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_popup_close" nk-popup-close)
    (
     (arg0 :pointer)
    )
)

; nk_popup_end
#-ecl
(cffi:defcfun ("nk_popup_end" nk-popup-end) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_popup_end" nk-popup-end)
    (
     (arg0 :pointer)
    )
)

; nk_popup_get_scroll
#-ecl
(cffi:defcfun ("nk_popup_get_scroll" nk-popup-get-scroll) :void
  (arg0 :pointer)
  (offset-x :pointer)
  (offset-y :pointer)
)
#+ecl
(ffi:def-function ("nk_popup_get_scroll" nk-popup-get-scroll)
    (
     (arg0 :pointer)
     (offset-x :pointer)
     (offset-y :pointer)
    )
)

; nk_popup_set_scroll
#-ecl
(cffi:defcfun ("nk_popup_set_scroll" nk-popup-set-scroll) :void
  (arg0 :pointer)
  (offset-x :unsigned-int)
  (offset-y :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_popup_set_scroll" nk-popup-set-scroll)
    (
     (arg0 :pointer)
     (offset-x :unsigned-int)
     (offset-y :unsigned-int)
    )
)

; nk_combo
#-ecl
; [SHIM] nk_combo — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_combo" nk-combo) :int
  (arg0 :pointer)
  (items :pointer)
  (count :int)
  (selected :int)
  (item-height :int)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_combo" nk-combo)
    (
     (arg0 :pointer)
     (items :pointer)
     (count :int)
     (selected :int)
     (item-height :int)
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_combo_separator
#-ecl
; [SHIM] nk_combo_separator — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_combo_separator" nk-combo-separator) :int
  (arg0 :pointer)
  (items-separated-by-separator :pointer)
  (separator :int)
  (selected :int)
  (count :int)
  (item-height :int)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_combo_separator" nk-combo-separator)
    (
     (arg0 :pointer)
     (items-separated-by-separator :pointer)
     (separator :int)
     (selected :int)
     (count :int)
     (item-height :int)
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_combo_string
#-ecl
; [SHIM] nk_combo_string — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_combo_string" nk-combo-string) :int
  (arg0 :pointer)
  (items-separated-by-zeros :pointer)
  (selected :int)
  (count :int)
  (item-height :int)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_combo_string" nk-combo-string)
    (
     (arg0 :pointer)
     (items-separated-by-zeros :pointer)
     (selected :int)
     (count :int)
     (item-height :int)
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_combo_callback
#-ecl
; [SHIM] nk_combo_callback — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_combo_callback" nk-combo-callback) :int
  (arg0 :pointer)
  (item-getter :pointer)
  (userdata :pointer)
  (selected :int)
  (count :int)
  (item-height :int)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_combo_callback" nk-combo-callback)
    (
     (arg0 :pointer)
     (item-getter :pointer)
     (userdata :pointer)
     (selected :int)
     (count :int)
     (item-height :int)
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_combobox
#-ecl
; [SHIM] nk_combobox — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_combobox" nk-combobox) :int
  (arg0 :pointer)
  (items :pointer)
  (count :int)
  (selected :pointer)
  (item-height :int)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_combobox" nk-combobox)
    (
     (arg0 :pointer)
     (items :pointer)
     (count :int)
     (selected :pointer)
     (item-height :int)
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_combobox_string
#-ecl
; [SHIM] nk_combobox_string — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_combobox_string" nk-combobox-string) :int
  (arg0 :pointer)
  (items-separated-by-zeros :pointer)
  (selected :pointer)
  (count :int)
  (item-height :int)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_combobox_string" nk-combobox-string)
    (
     (arg0 :pointer)
     (items-separated-by-zeros :pointer)
     (selected :pointer)
     (count :int)
     (item-height :int)
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_combobox_separator
#-ecl
; [SHIM] nk_combobox_separator — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_combobox_separator" nk-combobox-separator) :int
  (arg0 :pointer)
  (items-separated-by-separator :pointer)
  (separator :int)
  (selected :pointer)
  (count :int)
  (item-height :int)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_combobox_separator" nk-combobox-separator)
    (
     (arg0 :pointer)
     (items-separated-by-separator :pointer)
     (separator :int)
     (selected :pointer)
     (count :int)
     (item-height :int)
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_combobox_callback
#-ecl
; [SHIM] nk_combobox_callback — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_combobox_callback" nk-combobox-callback) :int
  (arg0 :pointer)
  (item-getter :pointer)
  (arg2 :pointer)
  (selected :pointer)
  (count :int)
  (item-height :int)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_combobox_callback" nk-combobox-callback)
    (
     (arg0 :pointer)
     (item-getter :pointer)
     (arg2 :pointer)
     (selected :pointer)
     (count :int)
     (item-height :int)
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_combo_begin_text
#-ecl
; [SHIM] nk_combo_begin_text — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_combo_begin_text" nk-combo-begin-text) :int
  (arg0 :pointer)
  (selected :pointer)
  (arg2 :int)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_combo_begin_text" nk-combo-begin-text)
    (
     (arg0 :pointer)
     (selected :pointer)
     (arg2 :int)
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_combo_begin_label
#-ecl
; [SHIM] nk_combo_begin_label — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_combo_begin_label" nk-combo-begin-label) :int
  (arg0 :pointer)
  (selected :pointer)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_combo_begin_label" nk-combo-begin-label)
    (
     (arg0 :pointer)
     (selected :pointer)
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_combo_begin_color
#-ecl
; [SHIM] nk_combo_begin_color — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_combo_begin_color" nk-combo-begin-color) :int
  (arg0 :pointer)
  (color :pointer)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_combo_begin_color" nk-combo-begin-color)
    (
     (arg0 :pointer)
     (color (:struct nk-color))
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_combo_begin_symbol
#-ecl
; [SHIM] nk_combo_begin_symbol — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_combo_begin_symbol" nk-combo-begin-symbol) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_combo_begin_symbol" nk-combo-begin-symbol)
    (
     (arg0 :pointer)
     (arg1 :int)
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_combo_begin_symbol_label
#-ecl
; [SHIM] nk_combo_begin_symbol_label — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_combo_begin_symbol_label" nk-combo-begin-symbol-label) :int
  (arg0 :pointer)
  (selected :pointer)
  (arg2 nk-symbol-type)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_combo_begin_symbol_label" nk-combo-begin-symbol-label)
    (
     (arg0 :pointer)
     (selected :pointer)
     (arg2 :int)
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_combo_begin_symbol_text
#-ecl
; [SHIM] nk_combo_begin_symbol_text — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_combo_begin_symbol_text" nk-combo-begin-symbol-text) :int
  (arg0 :pointer)
  (selected :pointer)
  (arg2 :int)
  (arg3 nk-symbol-type)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_combo_begin_symbol_text" nk-combo-begin-symbol-text)
    (
     (arg0 :pointer)
     (selected :pointer)
     (arg2 :int)
     (arg3 :int)
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_combo_begin_image
#-ecl
; [SHIM] nk_combo_begin_image — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_combo_begin_image" nk-combo-begin-image) :int
  (arg0 :pointer)
  (img :pointer)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_combo_begin_image" nk-combo-begin-image)
    (
     (arg0 :pointer)
     (img (:struct nk-image))
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_combo_begin_image_label
#-ecl
; [SHIM] nk_combo_begin_image_label — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_combo_begin_image_label" nk-combo-begin-image-label) :int
  (arg0 :pointer)
  (selected :pointer)
  (arg2 :pointer)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_combo_begin_image_label" nk-combo-begin-image-label)
    (
     (arg0 :pointer)
     (selected :pointer)
     (arg2 (:struct nk-image))
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_combo_begin_image_text
#-ecl
; [SHIM] nk_combo_begin_image_text — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_combo_begin_image_text" nk-combo-begin-image-text) :int
  (arg0 :pointer)
  (selected :pointer)
  (arg2 :int)
  (arg3 :pointer)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_combo_begin_image_text" nk-combo-begin-image-text)
    (
     (arg0 :pointer)
     (selected :pointer)
     (arg2 :int)
     (arg3 (:struct nk-image))
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_combo_item_label
#-ecl
(cffi:defcfun ("nk_combo_item_label" nk-combo-item-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_combo_item_label" nk-combo-item-label)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (alignment :unsigned-int)
    )
  :returning :int
)

; nk_combo_item_text
#-ecl
(cffi:defcfun ("nk_combo_item_text" nk-combo-item-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_combo_item_text" nk-combo-item-text)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
     (alignment :unsigned-int)
    )
  :returning :int
)

; nk_combo_item_image_label
#-ecl
; [SHIM] nk_combo_item_image_label — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_combo_item_image_label" nk-combo-item-image-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_combo_item_image_label" nk-combo-item-image-label)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-image))
     (arg2 :pointer)
     (alignment :unsigned-int)
    )
  :returning :int
)

; nk_combo_item_image_text
#-ecl
; [SHIM] nk_combo_item_image_text — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_combo_item_image_text" nk-combo-item-image-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_combo_item_image_text" nk-combo-item-image-text)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-image))
     (arg2 :pointer)
     (arg3 :int)
     (alignment :unsigned-int)
    )
  :returning :int
)

; nk_combo_item_symbol_label
#-ecl
(cffi:defcfun ("nk_combo_item_symbol_label" nk-combo-item-symbol-label) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_combo_item_symbol_label" nk-combo-item-symbol-label)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 :pointer)
     (alignment :unsigned-int)
    )
  :returning :int
)

; nk_combo_item_symbol_text
#-ecl
(cffi:defcfun ("nk_combo_item_symbol_text" nk-combo-item-symbol-text) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (arg3 :int)
  (alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_combo_item_symbol_text" nk-combo-item-symbol-text)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 :pointer)
     (arg3 :int)
     (alignment :unsigned-int)
    )
  :returning :int
)

; nk_combo_close
#-ecl
(cffi:defcfun ("nk_combo_close" nk-combo-close) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_combo_close" nk-combo-close)
    (
     (arg0 :pointer)
    )
)

; nk_combo_end
#-ecl
(cffi:defcfun ("nk_combo_end" nk-combo-end) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_combo_end" nk-combo-end)
    (
     (arg0 :pointer)
    )
)

; nk_contextual_begin
#-ecl
; [SHIM] nk_contextual_begin — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_contextual_begin" nk-contextual-begin) :int
  (arg0 :pointer)
  (arg1 :unsigned-int)
  (arg2 :pointer)
  (trigger-bounds :pointer)
)
#+ecl
(ffi:def-function ("nk_contextual_begin" nk-contextual-begin)
    (
     (arg0 :pointer)
     (arg1 :unsigned-int)
     (arg2 (:struct nk-vec2))
     (trigger-bounds (:struct nk-rect))
    )
  :returning :int
)

; nk_contextual_item_text
#-ecl
(cffi:defcfun ("nk_contextual_item_text" nk-contextual-item-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (align :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_contextual_item_text" nk-contextual-item-text)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
     (align :unsigned-int)
    )
  :returning :int
)

; nk_contextual_item_label
#-ecl
(cffi:defcfun ("nk_contextual_item_label" nk-contextual-item-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (align :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_contextual_item_label" nk-contextual-item-label)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (align :unsigned-int)
    )
  :returning :int
)

; nk_contextual_item_image_label
#-ecl
; [SHIM] nk_contextual_item_image_label — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_contextual_item_image_label" nk-contextual-item-image-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_contextual_item_image_label" nk-contextual-item-image-label)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-image))
     (arg2 :pointer)
     (alignment :unsigned-int)
    )
  :returning :int
)

; nk_contextual_item_image_text
#-ecl
; [SHIM] nk_contextual_item_image_text — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_contextual_item_image_text" nk-contextual-item-image-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (len :int)
  (alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_contextual_item_image_text" nk-contextual-item-image-text)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-image))
     (arg2 :pointer)
     (len :int)
     (alignment :unsigned-int)
    )
  :returning :int
)

; nk_contextual_item_symbol_label
#-ecl
(cffi:defcfun ("nk_contextual_item_symbol_label" nk-contextual-item-symbol-label) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_contextual_item_symbol_label" nk-contextual-item-symbol-label)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 :pointer)
     (alignment :unsigned-int)
    )
  :returning :int
)

; nk_contextual_item_symbol_text
#-ecl
(cffi:defcfun ("nk_contextual_item_symbol_text" nk-contextual-item-symbol-text) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (arg3 :int)
  (alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_contextual_item_symbol_text" nk-contextual-item-symbol-text)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 :pointer)
     (arg3 :int)
     (alignment :unsigned-int)
    )
  :returning :int
)

; nk_contextual_close
#-ecl
(cffi:defcfun ("nk_contextual_close" nk-contextual-close) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_contextual_close" nk-contextual-close)
    (
     (arg0 :pointer)
    )
)

; nk_contextual_end
#-ecl
(cffi:defcfun ("nk_contextual_end" nk-contextual-end) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_contextual_end" nk-contextual-end)
    (
     (arg0 :pointer)
    )
)

; nk_tooltip
#-ecl
(cffi:defcfun ("nk_tooltip" nk-tooltip) :void
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_tooltip" nk-tooltip)
    (
     (arg0 :pointer)
     (arg1 :pointer)
    )
)

; nk_tooltip_offset
#-ecl
; [SHIM] nk_tooltip_offset — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_tooltip_offset" nk-tooltip-offset) :void
  (ctx :pointer)
  (text :pointer)
  (position nk-tooltip-pos)
  (offset :pointer)
)
#+ecl
(ffi:def-function ("nk_tooltip_offset" nk-tooltip-offset)
    (
     (ctx :pointer)
     (text :pointer)
     (position :int)
     (offset (:struct nk-vec2))
    )
)

; nk_do_tooltip
#-ecl
; [SHIM] nk_do_tooltip — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_do_tooltip" nk-do-tooltip) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_do_tooltip" nk-do-tooltip)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 (:struct nk-rect))
    )
)

; nk_do_tooltip_delay
#-ecl
; [SHIM] nk_do_tooltip_delay — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_do_tooltip_delay" nk-do-tooltip-delay) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
)
#+ecl
(ffi:def-function ("nk_do_tooltip_delay" nk-do-tooltip-delay)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 (:struct nk-rect))
     (arg3 :pointer)
    )
)

; nk_do_tooltip_delay_clicked
#-ecl
; [SHIM] nk_do_tooltip_delay_clicked — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_do_tooltip_delay_clicked" nk-do-tooltip-delay-clicked) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (timer :pointer)
  (arg4 :pointer)
)
#+ecl
(ffi:def-function ("nk_do_tooltip_delay_clicked" nk-do-tooltip-delay-clicked)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 (:struct nk-rect))
     (timer :pointer)
     (arg4 :pointer)
    )
)

; nk_tooltipf — variadic, skipped (wrap manually if needed)

; nk_tooltipfv
#-ecl
(cffi:defcfun ("nk_tooltipfv" nk-tooltipfv) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_tooltipfv" nk-tooltipfv)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :pointer)
    )
)

; nk_tooltipf_offset — variadic, skipped (wrap manually if needed)

; nk_tooltipfv_offset
#-ecl
; [SHIM] nk_tooltipfv_offset — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_tooltipfv_offset" nk-tooltipfv-offset) :void
  (arg0 :pointer)
  (arg1 nk-tooltip-pos)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer)
)
#+ecl
(ffi:def-function ("nk_tooltipfv_offset" nk-tooltipfv-offset)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 (:struct nk-vec2))
     (arg3 :pointer)
     (arg4 :pointer)
    )
)

; nk_tooltip_begin
#-ecl
(cffi:defcfun ("nk_tooltip_begin" nk-tooltip-begin) :int
  (arg0 :pointer)
  (width :float)
)
#+ecl
(ffi:def-function ("nk_tooltip_begin" nk-tooltip-begin)
    (
     (arg0 :pointer)
     (width :float)
    )
  :returning :int
)

; nk_tooltip_begin_offset
#-ecl
; [SHIM] nk_tooltip_begin_offset — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_tooltip_begin_offset" nk-tooltip-begin-offset) :int
  (arg0 :pointer)
  (arg1 :float)
  (arg2 nk-tooltip-pos)
  (arg3 :pointer)
)
#+ecl
(ffi:def-function ("nk_tooltip_begin_offset" nk-tooltip-begin-offset)
    (
     (arg0 :pointer)
     (arg1 :float)
     (arg2 :int)
     (arg3 (:struct nk-vec2))
    )
  :returning :int
)

; nk_tooltip_end
#-ecl
(cffi:defcfun ("nk_tooltip_end" nk-tooltip-end) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_tooltip_end" nk-tooltip-end)
    (
     (arg0 :pointer)
    )
)

; nk_menubar_begin
#-ecl
(cffi:defcfun ("nk_menubar_begin" nk-menubar-begin) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_menubar_begin" nk-menubar-begin)
    (
     (arg0 :pointer)
    )
)

; nk_menubar_end
#-ecl
(cffi:defcfun ("nk_menubar_end" nk-menubar-end) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_menubar_end" nk-menubar-end)
    (
     (arg0 :pointer)
    )
)

; nk_menu_begin_text
#-ecl
; [SHIM] nk_menu_begin_text — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_menu_begin_text" nk-menu-begin-text) :int
  (arg0 :pointer)
  (title :pointer)
  (title-len :int)
  (align :unsigned-int)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_menu_begin_text" nk-menu-begin-text)
    (
     (arg0 :pointer)
     (title :pointer)
     (title-len :int)
     (align :unsigned-int)
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_menu_begin_label
#-ecl
; [SHIM] nk_menu_begin_label — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_menu_begin_label" nk-menu-begin-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (align :unsigned-int)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_menu_begin_label" nk-menu-begin-label)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (align :unsigned-int)
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_menu_begin_image
#-ecl
; [SHIM] nk_menu_begin_image — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_menu_begin_image" nk-menu-begin-image) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_menu_begin_image" nk-menu-begin-image)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 (:struct nk-image))
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_menu_begin_image_text
#-ecl
; [SHIM] nk_menu_begin_image_text — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_menu_begin_image_text" nk-menu-begin-image-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (align :unsigned-int)
  (arg4 :pointer)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_menu_begin_image_text" nk-menu-begin-image-text)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
     (align :unsigned-int)
     (arg4 (:struct nk-image))
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_menu_begin_image_label
#-ecl
; [SHIM] nk_menu_begin_image_label — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_menu_begin_image_label" nk-menu-begin-image-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (align :unsigned-int)
  (arg3 :pointer)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_menu_begin_image_label" nk-menu-begin-image-label)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (align :unsigned-int)
     (arg3 (:struct nk-image))
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_menu_begin_symbol
#-ecl
; [SHIM] nk_menu_begin_symbol — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_menu_begin_symbol" nk-menu-begin-symbol) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 nk-symbol-type)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_menu_begin_symbol" nk-menu-begin-symbol)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_menu_begin_symbol_text
#-ecl
; [SHIM] nk_menu_begin_symbol_text — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_menu_begin_symbol_text" nk-menu-begin-symbol-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (align :unsigned-int)
  (arg4 nk-symbol-type)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_menu_begin_symbol_text" nk-menu-begin-symbol-text)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
     (align :unsigned-int)
     (arg4 :int)
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_menu_begin_symbol_label
#-ecl
; [SHIM] nk_menu_begin_symbol_label — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_menu_begin_symbol_label" nk-menu-begin-symbol-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (align :unsigned-int)
  (arg3 nk-symbol-type)
  (size :pointer)
)
#+ecl
(ffi:def-function ("nk_menu_begin_symbol_label" nk-menu-begin-symbol-label)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (align :unsigned-int)
     (arg3 :int)
     (size (:struct nk-vec2))
    )
  :returning :int
)

; nk_menu_item_text
#-ecl
(cffi:defcfun ("nk_menu_item_text" nk-menu-item-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (align :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_menu_item_text" nk-menu-item-text)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
     (align :unsigned-int)
    )
  :returning :int
)

; nk_menu_item_label
#-ecl
(cffi:defcfun ("nk_menu_item_label" nk-menu-item-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_menu_item_label" nk-menu-item-label)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (alignment :unsigned-int)
    )
  :returning :int
)

; nk_menu_item_image_label
#-ecl
; [SHIM] nk_menu_item_image_label — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_menu_item_image_label" nk-menu-item-image-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_menu_item_image_label" nk-menu-item-image-label)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-image))
     (arg2 :pointer)
     (alignment :unsigned-int)
    )
  :returning :int
)

; nk_menu_item_image_text
#-ecl
; [SHIM] nk_menu_item_image_text — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_menu_item_image_text" nk-menu-item-image-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (len :int)
  (alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_menu_item_image_text" nk-menu-item-image-text)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-image))
     (arg2 :pointer)
     (len :int)
     (alignment :unsigned-int)
    )
  :returning :int
)

; nk_menu_item_symbol_text
#-ecl
(cffi:defcfun ("nk_menu_item_symbol_text" nk-menu-item-symbol-text) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (arg3 :int)
  (alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_menu_item_symbol_text" nk-menu-item-symbol-text)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 :pointer)
     (arg3 :int)
     (alignment :unsigned-int)
    )
  :returning :int
)

; nk_menu_item_symbol_label
#-ecl
(cffi:defcfun ("nk_menu_item_symbol_label" nk-menu-item-symbol-label) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (alignment :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_menu_item_symbol_label" nk-menu-item-symbol-label)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 :pointer)
     (alignment :unsigned-int)
    )
  :returning :int
)

; nk_menu_close
#-ecl
(cffi:defcfun ("nk_menu_close" nk-menu-close) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_menu_close" nk-menu-close)
    (
     (arg0 :pointer)
    )
)

; nk_menu_end
#-ecl
(cffi:defcfun ("nk_menu_end" nk-menu-end) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_menu_end" nk-menu-end)
    (
     (arg0 :pointer)
    )
)

; nk_style_default
#-ecl
(cffi:defcfun ("nk_style_default" nk-style-default) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_style_default" nk-style-default)
    (
     (arg0 :pointer)
    )
)

; nk_style_from_table
#-ecl
(cffi:defcfun ("nk_style_from_table" nk-style-from-table) :void
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_style_from_table" nk-style-from-table)
    (
     (arg0 :pointer)
     (arg1 :pointer)
    )
)

; nk_style_load_cursor
#-ecl
(cffi:defcfun ("nk_style_load_cursor" nk-style-load-cursor) :void
  (arg0 :pointer)
  (arg1 nk-style-cursor)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_style_load_cursor" nk-style-load-cursor)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 :pointer)
    )
)

; nk_style_load_all_cursors
#-ecl
(cffi:defcfun ("nk_style_load_all_cursors" nk-style-load-all-cursors) :void
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_style_load_all_cursors" nk-style-load-all-cursors)
    (
     (arg0 :pointer)
     (arg1 :pointer)
    )
)

; nk_style_get_color_by_name
#-ecl
(cffi:defcfun ("nk_style_get_color_by_name" nk-style-get-color-by-name) :pointer
  (arg0 nk-style-colors)
)
#+ecl
(ffi:def-function ("nk_style_get_color_by_name" nk-style-get-color-by-name)
    (
     (arg0 :int)
    )
  :returning :pointer
)

; nk_style_set_font
#-ecl
(cffi:defcfun ("nk_style_set_font" nk-style-set-font) :void
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_style_set_font" nk-style-set-font)
    (
     (arg0 :pointer)
     (arg1 :pointer)
    )
)

; nk_style_set_cursor
#-ecl
(cffi:defcfun ("nk_style_set_cursor" nk-style-set-cursor) :int
  (arg0 :pointer)
  (arg1 nk-style-cursor)
)
#+ecl
(ffi:def-function ("nk_style_set_cursor" nk-style-set-cursor)
    (
     (arg0 :pointer)
     (arg1 :int)
    )
  :returning :int
)

; nk_style_show_cursor
#-ecl
(cffi:defcfun ("nk_style_show_cursor" nk-style-show-cursor) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_style_show_cursor" nk-style-show-cursor)
    (
     (arg0 :pointer)
    )
)

; nk_style_hide_cursor
#-ecl
(cffi:defcfun ("nk_style_hide_cursor" nk-style-hide-cursor) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_style_hide_cursor" nk-style-hide-cursor)
    (
     (arg0 :pointer)
    )
)

; nk_style_push_font
#-ecl
(cffi:defcfun ("nk_style_push_font" nk-style-push-font) :int
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_style_push_font" nk-style-push-font)
    (
     (arg0 :pointer)
     (arg1 :pointer)
    )
  :returning :int
)

; nk_style_push_float
#-ecl
(cffi:defcfun ("nk_style_push_float" nk-style-push-float) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :float)
)
#+ecl
(ffi:def-function ("nk_style_push_float" nk-style-push-float)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :float)
    )
  :returning :int
)

; nk_style_push_vec2
#-ecl
; [SHIM] nk_style_push_vec2 — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_style_push_vec2" nk-style-push-vec2) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_style_push_vec2" nk-style-push-vec2)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 (:struct nk-vec2))
    )
  :returning :int
)

; nk_style_push_style_item
#-ecl
; [SHIM] nk_style_push_style_item — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_style_push_style_item" nk-style-push-style-item) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_style_push_style_item" nk-style-push-style-item)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 (:struct nk-style-item))
    )
  :returning :int
)

; nk_style_push_flags
#-ecl
(cffi:defcfun ("nk_style_push_flags" nk-style-push-flags) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_style_push_flags" nk-style-push-flags)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :unsigned-int)
    )
  :returning :int
)

; nk_style_push_color
#-ecl
; [SHIM] nk_style_push_color — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_style_push_color" nk-style-push-color) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_style_push_color" nk-style-push-color)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 (:struct nk-color))
    )
  :returning :int
)

; nk_style_pop_font
#-ecl
(cffi:defcfun ("nk_style_pop_font" nk-style-pop-font) :int
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_style_pop_font" nk-style-pop-font)
    (
     (arg0 :pointer)
    )
  :returning :int
)

; nk_style_pop_float
#-ecl
(cffi:defcfun ("nk_style_pop_float" nk-style-pop-float) :int
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_style_pop_float" nk-style-pop-float)
    (
     (arg0 :pointer)
    )
  :returning :int
)

; nk_style_pop_vec2
#-ecl
(cffi:defcfun ("nk_style_pop_vec2" nk-style-pop-vec2) :int
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_style_pop_vec2" nk-style-pop-vec2)
    (
     (arg0 :pointer)
    )
  :returning :int
)

; nk_style_pop_style_item
#-ecl
(cffi:defcfun ("nk_style_pop_style_item" nk-style-pop-style-item) :int
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_style_pop_style_item" nk-style-pop-style-item)
    (
     (arg0 :pointer)
    )
  :returning :int
)

; nk_style_pop_flags
#-ecl
(cffi:defcfun ("nk_style_pop_flags" nk-style-pop-flags) :int
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_style_pop_flags" nk-style-pop-flags)
    (
     (arg0 :pointer)
    )
  :returning :int
)

; nk_style_pop_color
#-ecl
(cffi:defcfun ("nk_style_pop_color" nk-style-pop-color) :int
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_style_pop_color" nk-style-pop-color)
    (
     (arg0 :pointer)
    )
  :returning :int
)

; nk_rgb
#-ecl
; [SHIM] nk_rgb — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rgb" nk-rgb) :void
  (r :int)
  (g :int)
  (b :int)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_rgb" nk-rgb)
    (
     (r :int)
     (g :int)
     (b :int)
    )
  :returning (:struct nk-color)
)

; nk_rgb_iv
#-ecl
; [SHIM] nk_rgb_iv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rgb_iv" nk-rgb-iv) :void
  (rgb :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_rgb_iv" nk-rgb-iv)
    (
     (rgb :pointer)
    )
  :returning (:struct nk-color)
)

; nk_rgb_bv
#-ecl
; [SHIM] nk_rgb_bv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rgb_bv" nk-rgb-bv) :void
  (rgb :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_rgb_bv" nk-rgb-bv)
    (
     (rgb :pointer)
    )
  :returning (:struct nk-color)
)

; nk_rgb_f
#-ecl
; [SHIM] nk_rgb_f — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rgb_f" nk-rgb-f) :void
  (r :float)
  (g :float)
  (b :float)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_rgb_f" nk-rgb-f)
    (
     (r :float)
     (g :float)
     (b :float)
    )
  :returning (:struct nk-color)
)

; nk_rgb_fv
#-ecl
; [SHIM] nk_rgb_fv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rgb_fv" nk-rgb-fv) :void
  (rgb :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_rgb_fv" nk-rgb-fv)
    (
     (rgb :pointer)
    )
  :returning (:struct nk-color)
)

; nk_rgb_cf
#-ecl
; [SHIM] nk_rgb_cf — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rgb_cf" nk-rgb-cf) :void
  (c :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_rgb_cf" nk-rgb-cf)
    (
     (c (:struct nk-colorf))
    )
  :returning (:struct nk-color)
)

; nk_rgb_hex
#-ecl
; [SHIM] nk_rgb_hex — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rgb_hex" nk-rgb-hex) :void
  (rgb :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_rgb_hex" nk-rgb-hex)
    (
     (rgb :pointer)
    )
  :returning (:struct nk-color)
)

; nk_rgb_factor
#-ecl
; [SHIM] nk_rgb_factor — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rgb_factor" nk-rgb-factor) :void
  (col :pointer)
  (factor :float)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_rgb_factor" nk-rgb-factor)
    (
     (col (:struct nk-color))
     (factor :float)
    )
  :returning (:struct nk-color)
)

; nk_rgba
#-ecl
; [SHIM] nk_rgba — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rgba" nk-rgba) :void
  (r :int)
  (g :int)
  (b :int)
  (a :int)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_rgba" nk-rgba)
    (
     (r :int)
     (g :int)
     (b :int)
     (a :int)
    )
  :returning (:struct nk-color)
)

; nk_rgba_u32
#-ecl
; [SHIM] nk_rgba_u32 — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rgba_u32" nk-rgba-u32) :void
  (arg0 :unsigned-int)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_rgba_u32" nk-rgba-u32)
    (
     (arg0 :unsigned-int)
    )
  :returning (:struct nk-color)
)

; nk_rgba_iv
#-ecl
; [SHIM] nk_rgba_iv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rgba_iv" nk-rgba-iv) :void
  (rgba :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_rgba_iv" nk-rgba-iv)
    (
     (rgba :pointer)
    )
  :returning (:struct nk-color)
)

; nk_rgba_bv
#-ecl
; [SHIM] nk_rgba_bv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rgba_bv" nk-rgba-bv) :void
  (rgba :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_rgba_bv" nk-rgba-bv)
    (
     (rgba :pointer)
    )
  :returning (:struct nk-color)
)

; nk_rgba_f
#-ecl
; [SHIM] nk_rgba_f — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rgba_f" nk-rgba-f) :void
  (r :float)
  (g :float)
  (b :float)
  (a :float)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_rgba_f" nk-rgba-f)
    (
     (r :float)
     (g :float)
     (b :float)
     (a :float)
    )
  :returning (:struct nk-color)
)

; nk_rgba_fv
#-ecl
; [SHIM] nk_rgba_fv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rgba_fv" nk-rgba-fv) :void
  (rgba :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_rgba_fv" nk-rgba-fv)
    (
     (rgba :pointer)
    )
  :returning (:struct nk-color)
)

; nk_rgba_cf
#-ecl
; [SHIM] nk_rgba_cf — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rgba_cf" nk-rgba-cf) :void
  (c :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_rgba_cf" nk-rgba-cf)
    (
     (c (:struct nk-colorf))
    )
  :returning (:struct nk-color)
)

; nk_rgba_hex
#-ecl
; [SHIM] nk_rgba_hex — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rgba_hex" nk-rgba-hex) :void
  (rgb :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_rgba_hex" nk-rgba-hex)
    (
     (rgb :pointer)
    )
  :returning (:struct nk-color)
)

; nk_hsva_colorf
#-ecl
; [SHIM] nk_hsva_colorf — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_hsva_colorf" nk-hsva-colorf) :void
  (h :float)
  (s :float)
  (v :float)
  (a :float)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_hsva_colorf" nk-hsva-colorf)
    (
     (h :float)
     (s :float)
     (v :float)
     (a :float)
    )
  :returning (:struct nk-colorf)
)

; nk_hsva_colorfv
#-ecl
; [SHIM] nk_hsva_colorfv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_hsva_colorfv" nk-hsva-colorfv) :void
  (c :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_hsva_colorfv" nk-hsva-colorfv)
    (
     (c :pointer)
    )
  :returning (:struct nk-colorf)
)

; nk_colorf_hsva_f
#-ecl
; [SHIM] nk_colorf_hsva_f — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_colorf_hsva_f" nk-colorf-hsva-f) :void
  (out-h :pointer)
  (out-s :pointer)
  (out-v :pointer)
  (out-a :pointer)
  (in :pointer)
)
#+ecl
(ffi:def-function ("nk_colorf_hsva_f" nk-colorf-hsva-f)
    (
     (out-h :pointer)
     (out-s :pointer)
     (out-v :pointer)
     (out-a :pointer)
     (in (:struct nk-colorf))
    )
)

; nk_colorf_hsva_fv
#-ecl
; [SHIM] nk_colorf_hsva_fv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_colorf_hsva_fv" nk-colorf-hsva-fv) :void
  (hsva :pointer)
  (in :pointer)
)
#+ecl
(ffi:def-function ("nk_colorf_hsva_fv" nk-colorf-hsva-fv)
    (
     (hsva :pointer)
     (in (:struct nk-colorf))
    )
)

; nk_hsv
#-ecl
; [SHIM] nk_hsv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_hsv" nk-hsv) :void
  (h :int)
  (s :int)
  (v :int)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_hsv" nk-hsv)
    (
     (h :int)
     (s :int)
     (v :int)
    )
  :returning (:struct nk-color)
)

; nk_hsv_iv
#-ecl
; [SHIM] nk_hsv_iv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_hsv_iv" nk-hsv-iv) :void
  (hsv :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_hsv_iv" nk-hsv-iv)
    (
     (hsv :pointer)
    )
  :returning (:struct nk-color)
)

; nk_hsv_bv
#-ecl
; [SHIM] nk_hsv_bv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_hsv_bv" nk-hsv-bv) :void
  (hsv :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_hsv_bv" nk-hsv-bv)
    (
     (hsv :pointer)
    )
  :returning (:struct nk-color)
)

; nk_hsv_f
#-ecl
; [SHIM] nk_hsv_f — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_hsv_f" nk-hsv-f) :void
  (h :float)
  (s :float)
  (v :float)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_hsv_f" nk-hsv-f)
    (
     (h :float)
     (s :float)
     (v :float)
    )
  :returning (:struct nk-color)
)

; nk_hsv_fv
#-ecl
; [SHIM] nk_hsv_fv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_hsv_fv" nk-hsv-fv) :void
  (hsv :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_hsv_fv" nk-hsv-fv)
    (
     (hsv :pointer)
    )
  :returning (:struct nk-color)
)

; nk_hsva
#-ecl
; [SHIM] nk_hsva — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_hsva" nk-hsva) :void
  (h :int)
  (s :int)
  (v :int)
  (a :int)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_hsva" nk-hsva)
    (
     (h :int)
     (s :int)
     (v :int)
     (a :int)
    )
  :returning (:struct nk-color)
)

; nk_hsva_iv
#-ecl
; [SHIM] nk_hsva_iv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_hsva_iv" nk-hsva-iv) :void
  (hsva :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_hsva_iv" nk-hsva-iv)
    (
     (hsva :pointer)
    )
  :returning (:struct nk-color)
)

; nk_hsva_bv
#-ecl
; [SHIM] nk_hsva_bv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_hsva_bv" nk-hsva-bv) :void
  (hsva :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_hsva_bv" nk-hsva-bv)
    (
     (hsva :pointer)
    )
  :returning (:struct nk-color)
)

; nk_hsva_f
#-ecl
; [SHIM] nk_hsva_f — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_hsva_f" nk-hsva-f) :void
  (h :float)
  (s :float)
  (v :float)
  (a :float)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_hsva_f" nk-hsva-f)
    (
     (h :float)
     (s :float)
     (v :float)
     (a :float)
    )
  :returning (:struct nk-color)
)

; nk_hsva_fv
#-ecl
; [SHIM] nk_hsva_fv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_hsva_fv" nk-hsva-fv) :void
  (hsva :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_hsva_fv" nk-hsva-fv)
    (
     (hsva :pointer)
    )
  :returning (:struct nk-color)
)

; nk_color_f
#-ecl
; [SHIM] nk_color_f — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_color_f" nk-color-f) :void
  (r :pointer)
  (g :pointer)
  (b :pointer)
  (a :pointer)
  (arg4 :pointer)
)
#+ecl
(ffi:def-function ("nk_color_f" nk-color-f)
    (
     (r :pointer)
     (g :pointer)
     (b :pointer)
     (a :pointer)
     (arg4 (:struct nk-color))
    )
)

; nk_color_fv
#-ecl
; [SHIM] nk_color_fv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_color_fv" nk-color-fv) :void
  (rgba-out :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_color_fv" nk-color-fv)
    (
     (rgba-out :pointer)
     (arg1 (:struct nk-color))
    )
)

; nk_color_cf
#-ecl
; [SHIM] nk_color_cf — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_color_cf" nk-color-cf) :void
  (arg0 :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_color_cf" nk-color-cf)
    (
     (arg0 (:struct nk-color))
    )
  :returning (:struct nk-colorf)
)

; nk_color_d
#-ecl
; [SHIM] nk_color_d — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_color_d" nk-color-d) :void
  (r :pointer)
  (g :pointer)
  (b :pointer)
  (a :pointer)
  (arg4 :pointer)
)
#+ecl
(ffi:def-function ("nk_color_d" nk-color-d)
    (
     (r :pointer)
     (g :pointer)
     (b :pointer)
     (a :pointer)
     (arg4 (:struct nk-color))
    )
)

; nk_color_dv
#-ecl
; [SHIM] nk_color_dv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_color_dv" nk-color-dv) :void
  (rgba-out :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_color_dv" nk-color-dv)
    (
     (rgba-out :pointer)
     (arg1 (:struct nk-color))
    )
)

; nk_color_u32
#-ecl
; [SHIM] nk_color_u32 — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_color_u32" nk-color-u32) :unsigned-int
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_color_u32" nk-color-u32)
    (
     (arg0 (:struct nk-color))
    )
  :returning :unsigned-int
)

; nk_color_hex_rgba
#-ecl
; [SHIM] nk_color_hex_rgba — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_color_hex_rgba" nk-color-hex-rgba) :void
  (output :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_color_hex_rgba" nk-color-hex-rgba)
    (
     (output :pointer)
     (arg1 (:struct nk-color))
    )
)

; nk_color_hex_rgb
#-ecl
; [SHIM] nk_color_hex_rgb — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_color_hex_rgb" nk-color-hex-rgb) :void
  (output :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_color_hex_rgb" nk-color-hex-rgb)
    (
     (output :pointer)
     (arg1 (:struct nk-color))
    )
)

; nk_color_hsv_i
#-ecl
; [SHIM] nk_color_hsv_i — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_color_hsv_i" nk-color-hsv-i) :void
  (out-h :pointer)
  (out-s :pointer)
  (out-v :pointer)
  (arg3 :pointer)
)
#+ecl
(ffi:def-function ("nk_color_hsv_i" nk-color-hsv-i)
    (
     (out-h :pointer)
     (out-s :pointer)
     (out-v :pointer)
     (arg3 (:struct nk-color))
    )
)

; nk_color_hsv_b
#-ecl
; [SHIM] nk_color_hsv_b — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_color_hsv_b" nk-color-hsv-b) :void
  (out-h :pointer)
  (out-s :pointer)
  (out-v :pointer)
  (arg3 :pointer)
)
#+ecl
(ffi:def-function ("nk_color_hsv_b" nk-color-hsv-b)
    (
     (out-h :pointer)
     (out-s :pointer)
     (out-v :pointer)
     (arg3 (:struct nk-color))
    )
)

; nk_color_hsv_iv
#-ecl
; [SHIM] nk_color_hsv_iv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_color_hsv_iv" nk-color-hsv-iv) :void
  (hsv-out :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_color_hsv_iv" nk-color-hsv-iv)
    (
     (hsv-out :pointer)
     (arg1 (:struct nk-color))
    )
)

; nk_color_hsv_bv
#-ecl
; [SHIM] nk_color_hsv_bv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_color_hsv_bv" nk-color-hsv-bv) :void
  (hsv-out :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_color_hsv_bv" nk-color-hsv-bv)
    (
     (hsv-out :pointer)
     (arg1 (:struct nk-color))
    )
)

; nk_color_hsv_f
#-ecl
; [SHIM] nk_color_hsv_f — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_color_hsv_f" nk-color-hsv-f) :void
  (out-h :pointer)
  (out-s :pointer)
  (out-v :pointer)
  (arg3 :pointer)
)
#+ecl
(ffi:def-function ("nk_color_hsv_f" nk-color-hsv-f)
    (
     (out-h :pointer)
     (out-s :pointer)
     (out-v :pointer)
     (arg3 (:struct nk-color))
    )
)

; nk_color_hsv_fv
#-ecl
; [SHIM] nk_color_hsv_fv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_color_hsv_fv" nk-color-hsv-fv) :void
  (hsv-out :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_color_hsv_fv" nk-color-hsv-fv)
    (
     (hsv-out :pointer)
     (arg1 (:struct nk-color))
    )
)

; nk_color_hsva_i
#-ecl
; [SHIM] nk_color_hsva_i — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_color_hsva_i" nk-color-hsva-i) :void
  (h :pointer)
  (s :pointer)
  (v :pointer)
  (a :pointer)
  (arg4 :pointer)
)
#+ecl
(ffi:def-function ("nk_color_hsva_i" nk-color-hsva-i)
    (
     (h :pointer)
     (s :pointer)
     (v :pointer)
     (a :pointer)
     (arg4 (:struct nk-color))
    )
)

; nk_color_hsva_b
#-ecl
; [SHIM] nk_color_hsva_b — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_color_hsva_b" nk-color-hsva-b) :void
  (h :pointer)
  (s :pointer)
  (v :pointer)
  (a :pointer)
  (arg4 :pointer)
)
#+ecl
(ffi:def-function ("nk_color_hsva_b" nk-color-hsva-b)
    (
     (h :pointer)
     (s :pointer)
     (v :pointer)
     (a :pointer)
     (arg4 (:struct nk-color))
    )
)

; nk_color_hsva_iv
#-ecl
; [SHIM] nk_color_hsva_iv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_color_hsva_iv" nk-color-hsva-iv) :void
  (hsva-out :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_color_hsva_iv" nk-color-hsva-iv)
    (
     (hsva-out :pointer)
     (arg1 (:struct nk-color))
    )
)

; nk_color_hsva_bv
#-ecl
; [SHIM] nk_color_hsva_bv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_color_hsva_bv" nk-color-hsva-bv) :void
  (hsva-out :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_color_hsva_bv" nk-color-hsva-bv)
    (
     (hsva-out :pointer)
     (arg1 (:struct nk-color))
    )
)

; nk_color_hsva_f
#-ecl
; [SHIM] nk_color_hsva_f — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_color_hsva_f" nk-color-hsva-f) :void
  (out-h :pointer)
  (out-s :pointer)
  (out-v :pointer)
  (out-a :pointer)
  (arg4 :pointer)
)
#+ecl
(ffi:def-function ("nk_color_hsva_f" nk-color-hsva-f)
    (
     (out-h :pointer)
     (out-s :pointer)
     (out-v :pointer)
     (out-a :pointer)
     (arg4 (:struct nk-color))
    )
)

; nk_color_hsva_fv
#-ecl
; [SHIM] nk_color_hsva_fv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_color_hsva_fv" nk-color-hsva-fv) :void
  (hsva-out :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_color_hsva_fv" nk-color-hsva-fv)
    (
     (hsva-out :pointer)
     (arg1 (:struct nk-color))
    )
)

; nk_handle_ptr
#-ecl
; [SHIM] nk_handle_ptr — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_handle_ptr" nk-handle-ptr) :void
  (arg0 :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_handle_ptr" nk-handle-ptr)
    (
     (arg0 :pointer)
    )
  :returning (:union nk-handle)
)

; nk_handle_id
#-ecl
; [SHIM] nk_handle_id — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_handle_id" nk-handle-id) :void
  (arg0 :int)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_handle_id" nk-handle-id)
    (
     (arg0 :int)
    )
  :returning (:union nk-handle)
)

; nk_image_handle
#-ecl
; [SHIM] nk_image_handle — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_image_handle" nk-image-handle) :void
  (arg0 :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_image_handle" nk-image-handle)
    (
     (arg0 (:union nk-handle))
    )
  :returning (:struct nk-image)
)

; nk_image_ptr
#-ecl
; [SHIM] nk_image_ptr — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_image_ptr" nk-image-ptr) :void
  (arg0 :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_image_ptr" nk-image-ptr)
    (
     (arg0 :pointer)
    )
  :returning (:struct nk-image)
)

; nk_image_id
#-ecl
; [SHIM] nk_image_id — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_image_id" nk-image-id) :void
  (arg0 :int)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_image_id" nk-image-id)
    (
     (arg0 :int)
    )
  :returning (:struct nk-image)
)

; nk_image_is_subimage
#-ecl
(cffi:defcfun ("nk_image_is_subimage" nk-image-is-subimage) :int
  (img :pointer)
)
#+ecl
(ffi:def-function ("nk_image_is_subimage" nk-image-is-subimage)
    (
     (img :pointer)
    )
  :returning :int
)

; nk_subimage_ptr
#-ecl
; [SHIM] nk_subimage_ptr — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_subimage_ptr" nk-subimage-ptr) :void
  (arg0 :pointer)
  (w :unsigned-short)
  (h :unsigned-short)
  (sub-region :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_subimage_ptr" nk-subimage-ptr)
    (
     (arg0 :pointer)
     (w :unsigned-short)
     (h :unsigned-short)
     (sub-region (:struct nk-rect))
    )
  :returning (:struct nk-image)
)

; nk_subimage_id
#-ecl
; [SHIM] nk_subimage_id — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_subimage_id" nk-subimage-id) :void
  (arg0 :int)
  (w :unsigned-short)
  (h :unsigned-short)
  (sub-region :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_subimage_id" nk-subimage-id)
    (
     (arg0 :int)
     (w :unsigned-short)
     (h :unsigned-short)
     (sub-region (:struct nk-rect))
    )
  :returning (:struct nk-image)
)

; nk_subimage_handle
#-ecl
; [SHIM] nk_subimage_handle — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_subimage_handle" nk-subimage-handle) :void
  (arg0 :pointer)
  (w :unsigned-short)
  (h :unsigned-short)
  (sub-region :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_subimage_handle" nk-subimage-handle)
    (
     (arg0 (:union nk-handle))
     (w :unsigned-short)
     (h :unsigned-short)
     (sub-region (:struct nk-rect))
    )
  :returning (:struct nk-image)
)

; nk_nine_slice_handle
#-ecl
; [SHIM] nk_nine_slice_handle — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_nine_slice_handle" nk-nine-slice-handle) :void
  (arg0 :pointer)
  (l :unsigned-short)
  (t-arg :unsigned-short)
  (r :unsigned-short)
  (b :unsigned-short)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_nine_slice_handle" nk-nine-slice-handle)
    (
     (arg0 (:union nk-handle))
     (l :unsigned-short)
     (t-arg :unsigned-short)
     (r :unsigned-short)
     (b :unsigned-short)
    )
  :returning (:struct nk-nine-slice)
)

; nk_nine_slice_ptr
#-ecl
; [SHIM] nk_nine_slice_ptr — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_nine_slice_ptr" nk-nine-slice-ptr) :void
  (arg0 :pointer)
  (l :unsigned-short)
  (t-arg :unsigned-short)
  (r :unsigned-short)
  (b :unsigned-short)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_nine_slice_ptr" nk-nine-slice-ptr)
    (
     (arg0 :pointer)
     (l :unsigned-short)
     (t-arg :unsigned-short)
     (r :unsigned-short)
     (b :unsigned-short)
    )
  :returning (:struct nk-nine-slice)
)

; nk_nine_slice_id
#-ecl
; [SHIM] nk_nine_slice_id — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_nine_slice_id" nk-nine-slice-id) :void
  (arg0 :int)
  (l :unsigned-short)
  (t-arg :unsigned-short)
  (r :unsigned-short)
  (b :unsigned-short)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_nine_slice_id" nk-nine-slice-id)
    (
     (arg0 :int)
     (l :unsigned-short)
     (t-arg :unsigned-short)
     (r :unsigned-short)
     (b :unsigned-short)
    )
  :returning (:struct nk-nine-slice)
)

; nk_nine_slice_is_sub9slice
#-ecl
(cffi:defcfun ("nk_nine_slice_is_sub9slice" nk-nine-slice-is-sub9slice) :int
  (img :pointer)
)
#+ecl
(ffi:def-function ("nk_nine_slice_is_sub9slice" nk-nine-slice-is-sub9slice)
    (
     (img :pointer)
    )
  :returning :int
)

; nk_sub9slice_ptr
#-ecl
; [SHIM] nk_sub9slice_ptr — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_sub9slice_ptr" nk-sub9slice-ptr) :void
  (arg0 :pointer)
  (w :unsigned-short)
  (h :unsigned-short)
  (sub-region :pointer)
  (l :unsigned-short)
  (t-arg :unsigned-short)
  (r :unsigned-short)
  (b :unsigned-short)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_sub9slice_ptr" nk-sub9slice-ptr)
    (
     (arg0 :pointer)
     (w :unsigned-short)
     (h :unsigned-short)
     (sub-region (:struct nk-rect))
     (l :unsigned-short)
     (t-arg :unsigned-short)
     (r :unsigned-short)
     (b :unsigned-short)
    )
  :returning (:struct nk-nine-slice)
)

; nk_sub9slice_id
#-ecl
; [SHIM] nk_sub9slice_id — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_sub9slice_id" nk-sub9slice-id) :void
  (arg0 :int)
  (w :unsigned-short)
  (h :unsigned-short)
  (sub-region :pointer)
  (l :unsigned-short)
  (t-arg :unsigned-short)
  (r :unsigned-short)
  (b :unsigned-short)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_sub9slice_id" nk-sub9slice-id)
    (
     (arg0 :int)
     (w :unsigned-short)
     (h :unsigned-short)
     (sub-region (:struct nk-rect))
     (l :unsigned-short)
     (t-arg :unsigned-short)
     (r :unsigned-short)
     (b :unsigned-short)
    )
  :returning (:struct nk-nine-slice)
)

; nk_sub9slice_handle
#-ecl
; [SHIM] nk_sub9slice_handle — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_sub9slice_handle" nk-sub9slice-handle) :void
  (arg0 :pointer)
  (w :unsigned-short)
  (h :unsigned-short)
  (sub-region :pointer)
  (l :unsigned-short)
  (t-arg :unsigned-short)
  (r :unsigned-short)
  (b :unsigned-short)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_sub9slice_handle" nk-sub9slice-handle)
    (
     (arg0 (:union nk-handle))
     (w :unsigned-short)
     (h :unsigned-short)
     (sub-region (:struct nk-rect))
     (l :unsigned-short)
     (t-arg :unsigned-short)
     (r :unsigned-short)
     (b :unsigned-short)
    )
  :returning (:struct nk-nine-slice)
)

; nk_murmur_hash
#-ecl
(cffi:defcfun ("nk_murmur_hash" nk-murmur-hash) :unsigned-int
  (key :pointer)
  (len :int)
  (seed :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_murmur_hash" nk-murmur-hash)
    (
     (key :pointer)
     (len :int)
     (seed :unsigned-int)
    )
  :returning :unsigned-int
)

; nk_triangle_from_direction
#-ecl
; [SHIM] nk_triangle_from_direction — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_triangle_from_direction" nk-triangle-from-direction) :void
  (result :pointer)
  (r :pointer)
  (pad-x :float)
  (pad-y :float)
  (arg4 nk-heading)
)
#+ecl
(ffi:def-function ("nk_triangle_from_direction" nk-triangle-from-direction)
    (
     (result :pointer)
     (r (:struct nk-rect))
     (pad-x :float)
     (pad-y :float)
     (arg4 :int)
    )
)

; nk_vec2
#-ecl
; [SHIM] nk_vec2 — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_vec2" nk-vec2) :void
  (x :float)
  (y :float)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_vec2" nk-vec2)
    (
     (x :float)
     (y :float)
    )
  :returning (:struct nk-vec2)
)

; nk_vec2i
#-ecl
; [SHIM] nk_vec2i — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_vec2i" nk-vec2i) :void
  (x :int)
  (y :int)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_vec2i" nk-vec2i)
    (
     (x :int)
     (y :int)
    )
  :returning (:struct nk-vec2)
)

; nk_vec2v
#-ecl
; [SHIM] nk_vec2v — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_vec2v" nk-vec2v) :void
  (xy :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_vec2v" nk-vec2v)
    (
     (xy :pointer)
    )
  :returning (:struct nk-vec2)
)

; nk_vec2iv
#-ecl
; [SHIM] nk_vec2iv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_vec2iv" nk-vec2iv) :void
  (xy :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_vec2iv" nk-vec2iv)
    (
     (xy :pointer)
    )
  :returning (:struct nk-vec2)
)

; nk_get_null_rect
#-ecl
; [SHIM] nk_get_null_rect — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_get_null_rect" nk-get-null-rect) :void
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_get_null_rect" nk-get-null-rect)
    (
    )
  :returning (:struct nk-rect)
)

; nk_rect
#-ecl
; [SHIM] nk_rect — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rect" nk-rect) :void
  (x :float)
  (y :float)
  (w :float)
  (h :float)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_rect" nk-rect)
    (
     (x :float)
     (y :float)
     (w :float)
     (h :float)
    )
  :returning (:struct nk-rect)
)

; nk_recti
#-ecl
; [SHIM] nk_recti — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_recti" nk-recti) :void
  (x :int)
  (y :int)
  (w :int)
  (h :int)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_recti" nk-recti)
    (
     (x :int)
     (y :int)
     (w :int)
     (h :int)
    )
  :returning (:struct nk-rect)
)

; nk_recta
#-ecl
; [SHIM] nk_recta — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_recta" nk-recta) :void
  (pos :pointer)
  (size :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_recta" nk-recta)
    (
     (pos (:struct nk-vec2))
     (size (:struct nk-vec2))
    )
  :returning (:struct nk-rect)
)

; nk_rectv
#-ecl
; [SHIM] nk_rectv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rectv" nk-rectv) :void
  (xywh :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_rectv" nk-rectv)
    (
     (xywh :pointer)
    )
  :returning (:struct nk-rect)
)

; nk_rectiv
#-ecl
; [SHIM] nk_rectiv — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rectiv" nk-rectiv) :void
  (xywh :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_rectiv" nk-rectiv)
    (
     (xywh :pointer)
    )
  :returning (:struct nk-rect)
)

; nk_rect_pos
#-ecl
; [SHIM] nk_rect_pos — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rect_pos" nk-rect-pos) :void
  (arg0 :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_rect_pos" nk-rect-pos)
    (
     (arg0 (:struct nk-rect))
    )
  :returning (:struct nk-vec2)
)

; nk_rect_size
#-ecl
; [SHIM] nk_rect_size — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_rect_size" nk-rect-size) :void
  (arg0 :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_rect_size" nk-rect-size)
    (
     (arg0 (:struct nk-rect))
    )
  :returning (:struct nk-vec2)
)

; nk_strlen
#-ecl
(cffi:defcfun ("nk_strlen" nk-strlen) :int
  (str :pointer)
)
#+ecl
(ffi:def-function ("nk_strlen" nk-strlen)
    (
     (str :pointer)
    )
  :returning :int
)

; nk_stricmp
#-ecl
(cffi:defcfun ("nk_stricmp" nk-stricmp) :int
  (s1 :pointer)
  (s2 :pointer)
)
#+ecl
(ffi:def-function ("nk_stricmp" nk-stricmp)
    (
     (s1 :pointer)
     (s2 :pointer)
    )
  :returning :int
)

; nk_stricmpn
#-ecl
(cffi:defcfun ("nk_stricmpn" nk-stricmpn) :int
  (s1 :pointer)
  (s2 :pointer)
  (n :int)
)
#+ecl
(ffi:def-function ("nk_stricmpn" nk-stricmpn)
    (
     (s1 :pointer)
     (s2 :pointer)
     (n :int)
    )
  :returning :int
)

; nk_strtoi
#-ecl
(cffi:defcfun ("nk_strtoi" nk-strtoi) :int
  (str :pointer)
  (endptr :pointer)
)
#+ecl
(ffi:def-function ("nk_strtoi" nk-strtoi)
    (
     (str :pointer)
     (endptr :pointer)
    )
  :returning :int
)

; nk_strtof
#-ecl
(cffi:defcfun ("nk_strtof" nk-strtof) :float
  (str :pointer)
  (endptr :pointer)
)
#+ecl
(ffi:def-function ("nk_strtof" nk-strtof)
    (
     (str :pointer)
     (endptr :pointer)
    )
  :returning :float
)

; nk_strtod
#-ecl
(cffi:defcfun ("nk_strtod" nk-strtod) :double
  (str :pointer)
  (endptr :pointer)
)
#+ecl
(ffi:def-function ("nk_strtod" nk-strtod)
    (
     (str :pointer)
     (endptr :pointer)
    )
  :returning :double
)

; nk_strfilter
#-ecl
(cffi:defcfun ("nk_strfilter" nk-strfilter) :int
  (text :pointer)
  (regexp :pointer)
)
#+ecl
(ffi:def-function ("nk_strfilter" nk-strfilter)
    (
     (text :pointer)
     (regexp :pointer)
    )
  :returning :int
)

; nk_strmatch_fuzzy_string
#-ecl
(cffi:defcfun ("nk_strmatch_fuzzy_string" nk-strmatch-fuzzy-string) :int
  (str :pointer)
  (pattern :pointer)
  (out-score :pointer)
)
#+ecl
(ffi:def-function ("nk_strmatch_fuzzy_string" nk-strmatch-fuzzy-string)
    (
     (str :pointer)
     (pattern :pointer)
     (out-score :pointer)
    )
  :returning :int
)

; nk_strmatch_fuzzy_text
#-ecl
(cffi:defcfun ("nk_strmatch_fuzzy_text" nk-strmatch-fuzzy-text) :int
  (txt :pointer)
  (txt-len :int)
  (pattern :pointer)
  (out-score :pointer)
)
#+ecl
(ffi:def-function ("nk_strmatch_fuzzy_text" nk-strmatch-fuzzy-text)
    (
     (txt :pointer)
     (txt-len :int)
     (pattern :pointer)
     (out-score :pointer)
    )
  :returning :int
)

; nk_utf_decode
#-ecl
(cffi:defcfun ("nk_utf_decode" nk-utf-decode) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
)
#+ecl
(ffi:def-function ("nk_utf_decode" nk-utf-decode)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
    )
  :returning :int
)

; nk_utf_encode
#-ecl
(cffi:defcfun ("nk_utf_encode" nk-utf-encode) :int
  (arg0 :unsigned-int)
  (arg1 :pointer)
  (arg2 :int)
)
#+ecl
(ffi:def-function ("nk_utf_encode" nk-utf-encode)
    (
     (arg0 :unsigned-int)
     (arg1 :pointer)
     (arg2 :int)
    )
  :returning :int
)

; nk_utf_len
#-ecl
(cffi:defcfun ("nk_utf_len" nk-utf-len) :int
  (arg0 :pointer)
  (byte-len :int)
)
#+ecl
(ffi:def-function ("nk_utf_len" nk-utf-len)
    (
     (arg0 :pointer)
     (byte-len :int)
    )
  :returning :int
)

; nk_utf_at
#-ecl
(cffi:defcfun ("nk_utf_at" nk-utf-at) :pointer
  (buffer :pointer)
  (length :int)
  (index :int)
  (unicode :pointer)
  (len :pointer)
)
#+ecl
(ffi:def-function ("nk_utf_at" nk-utf-at)
    (
     (buffer :pointer)
     (length :int)
     (index :int)
     (unicode :pointer)
     (len :pointer)
    )
  :returning :pointer
)

; nk_font_default_glyph_ranges
#-ecl
(cffi:defcfun ("nk_font_default_glyph_ranges" nk-font-default-glyph-ranges) :pointer
)
#+ecl
(ffi:def-function ("nk_font_default_glyph_ranges" nk-font-default-glyph-ranges)
    (
    )
  :returning :pointer
)

; nk_font_chinese_glyph_ranges
#-ecl
(cffi:defcfun ("nk_font_chinese_glyph_ranges" nk-font-chinese-glyph-ranges) :pointer
)
#+ecl
(ffi:def-function ("nk_font_chinese_glyph_ranges" nk-font-chinese-glyph-ranges)
    (
    )
  :returning :pointer
)

; nk_font_cyrillic_glyph_ranges
#-ecl
(cffi:defcfun ("nk_font_cyrillic_glyph_ranges" nk-font-cyrillic-glyph-ranges) :pointer
)
#+ecl
(ffi:def-function ("nk_font_cyrillic_glyph_ranges" nk-font-cyrillic-glyph-ranges)
    (
    )
  :returning :pointer
)

; nk_font_korean_glyph_ranges
#-ecl
(cffi:defcfun ("nk_font_korean_glyph_ranges" nk-font-korean-glyph-ranges) :pointer
)
#+ecl
(ffi:def-function ("nk_font_korean_glyph_ranges" nk-font-korean-glyph-ranges)
    (
    )
  :returning :pointer
)

; nk_font_atlas_init_default
#-ecl
(cffi:defcfun ("nk_font_atlas_init_default" nk-font-atlas-init-default) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_font_atlas_init_default" nk-font-atlas-init-default)
    (
     (arg0 :pointer)
    )
)

; nk_font_atlas_init
#-ecl
(cffi:defcfun ("nk_font_atlas_init" nk-font-atlas-init) :void
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_font_atlas_init" nk-font-atlas-init)
    (
     (arg0 :pointer)
     (arg1 :pointer)
    )
)

; nk_font_atlas_init_custom
#-ecl
(cffi:defcfun ("nk_font_atlas_init_custom" nk-font-atlas-init-custom) :void
  (arg0 :pointer)
  (persistent :pointer)
  (transient :pointer)
)
#+ecl
(ffi:def-function ("nk_font_atlas_init_custom" nk-font-atlas-init-custom)
    (
     (arg0 :pointer)
     (persistent :pointer)
     (transient :pointer)
    )
)

; nk_font_atlas_begin
#-ecl
(cffi:defcfun ("nk_font_atlas_begin" nk-font-atlas-begin) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_font_atlas_begin" nk-font-atlas-begin)
    (
     (arg0 :pointer)
    )
)

; nk_font_config
#-ecl
; [SHIM] nk_font_config — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_font_config" nk-font-config) :void
  (pixel-height :float)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_font_config" nk-font-config)
    (
     (pixel-height :float)
    )
  :returning (:struct nk-font-config)
)

; nk_font_atlas_add
#-ecl
(cffi:defcfun ("nk_font_atlas_add" nk-font-atlas-add) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_font_atlas_add" nk-font-atlas-add)
    (
     (arg0 :pointer)
     (arg1 :pointer)
    )
  :returning :pointer
)

; nk_font_atlas_add_default
#-ecl
(cffi:defcfun ("nk_font_atlas_add_default" nk-font-atlas-add-default) :pointer
  (arg0 :pointer)
  (height :float)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_font_atlas_add_default" nk-font-atlas-add-default)
    (
     (arg0 :pointer)
     (height :float)
     (arg2 :pointer)
    )
  :returning :pointer
)

; nk_font_atlas_add_from_memory
#-ecl
(cffi:defcfun ("nk_font_atlas_add_from_memory" nk-font-atlas-add-from-memory) :pointer
  (atlas :pointer)
  (memory :pointer)
  (size :unsigned-long)
  (height :float)
  (config :pointer)
)
#+ecl
(ffi:def-function ("nk_font_atlas_add_from_memory" nk-font-atlas-add-from-memory)
    (
     (atlas :pointer)
     (memory :pointer)
     (size :unsigned-long)
     (height :float)
     (config :pointer)
    )
  :returning :pointer
)

; nk_font_atlas_add_from_file
#-ecl
(cffi:defcfun ("nk_font_atlas_add_from_file" nk-font-atlas-add-from-file) :pointer
  (atlas :pointer)
  (file-path :pointer)
  (height :float)
  (arg3 :pointer)
)
#+ecl
(ffi:def-function ("nk_font_atlas_add_from_file" nk-font-atlas-add-from-file)
    (
     (atlas :pointer)
     (file-path :pointer)
     (height :float)
     (arg3 :pointer)
    )
  :returning :pointer
)

; nk_font_atlas_add_compressed
#-ecl
(cffi:defcfun ("nk_font_atlas_add_compressed" nk-font-atlas-add-compressed) :pointer
  (arg0 :pointer)
  (memory :pointer)
  (size :unsigned-long)
  (height :float)
  (arg4 :pointer)
)
#+ecl
(ffi:def-function ("nk_font_atlas_add_compressed" nk-font-atlas-add-compressed)
    (
     (arg0 :pointer)
     (memory :pointer)
     (size :unsigned-long)
     (height :float)
     (arg4 :pointer)
    )
  :returning :pointer
)

; nk_font_atlas_add_compressed_base85
#-ecl
(cffi:defcfun ("nk_font_atlas_add_compressed_base85" nk-font-atlas-add-compressed-base85) :pointer
  (arg0 :pointer)
  (data :pointer)
  (height :float)
  (config :pointer)
)
#+ecl
(ffi:def-function ("nk_font_atlas_add_compressed_base85" nk-font-atlas-add-compressed-base85)
    (
     (arg0 :pointer)
     (data :pointer)
     (height :float)
     (config :pointer)
    )
  :returning :pointer
)

; nk_font_atlas_bake
#-ecl
(cffi:defcfun ("nk_font_atlas_bake" nk-font-atlas-bake) :pointer
  (arg0 :pointer)
  (width :pointer)
  (height :pointer)
  (arg3 nk-font-atlas-format)
)
#+ecl
(ffi:def-function ("nk_font_atlas_bake" nk-font-atlas-bake)
    (
     (arg0 :pointer)
     (width :pointer)
     (height :pointer)
     (arg3 :int)
    )
  :returning :pointer
)

; nk_font_atlas_end
#-ecl
; [SHIM] nk_font_atlas_end — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_font_atlas_end" nk-font-atlas-end) :void
  (arg0 :pointer)
  (tex :pointer)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_font_atlas_end" nk-font-atlas-end)
    (
     (arg0 :pointer)
     (tex (:union nk-handle))
     (arg2 :pointer)
    )
)

; nk_font_find_glyph
#-ecl
(cffi:defcfun ("nk_font_find_glyph" nk-font-find-glyph) :pointer
  (arg0 :pointer)
  (unicode :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_font_find_glyph" nk-font-find-glyph)
    (
     (arg0 :pointer)
     (unicode :unsigned-int)
    )
  :returning :pointer
)

; nk_font_atlas_cleanup
#-ecl
(cffi:defcfun ("nk_font_atlas_cleanup" nk-font-atlas-cleanup) :void
  (atlas :pointer)
)
#+ecl
(ffi:def-function ("nk_font_atlas_cleanup" nk-font-atlas-cleanup)
    (
     (atlas :pointer)
    )
)

; nk_font_atlas_clear
#-ecl
(cffi:defcfun ("nk_font_atlas_clear" nk-font-atlas-clear) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_font_atlas_clear" nk-font-atlas-clear)
    (
     (arg0 :pointer)
    )
)

; nk_buffer_init_default
#-ecl
(cffi:defcfun ("nk_buffer_init_default" nk-buffer-init-default) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_buffer_init_default" nk-buffer-init-default)
    (
     (arg0 :pointer)
    )
)

; nk_buffer_init
#-ecl
(cffi:defcfun ("nk_buffer_init" nk-buffer-init) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (size :unsigned-long)
)
#+ecl
(ffi:def-function ("nk_buffer_init" nk-buffer-init)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (size :unsigned-long)
    )
)

; nk_buffer_init_fixed
#-ecl
(cffi:defcfun ("nk_buffer_init_fixed" nk-buffer-init-fixed) :void
  (arg0 :pointer)
  (memory :pointer)
  (size :unsigned-long)
)
#+ecl
(ffi:def-function ("nk_buffer_init_fixed" nk-buffer-init-fixed)
    (
     (arg0 :pointer)
     (memory :pointer)
     (size :unsigned-long)
    )
)

; nk_buffer_info
#-ecl
(cffi:defcfun ("nk_buffer_info" nk-buffer-info) :void
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_buffer_info" nk-buffer-info)
    (
     (arg0 :pointer)
     (arg1 :pointer)
    )
)

; nk_buffer_push
#-ecl
(cffi:defcfun ("nk_buffer_push" nk-buffer-push) :void
  (arg0 :pointer)
  (type nk-buffer-allocation-type)
  (memory :pointer)
  (size :unsigned-long)
  (align :unsigned-long)
)
#+ecl
(ffi:def-function ("nk_buffer_push" nk-buffer-push)
    (
     (arg0 :pointer)
     (type :int)
     (memory :pointer)
     (size :unsigned-long)
     (align :unsigned-long)
    )
)

; nk_buffer_mark
#-ecl
(cffi:defcfun ("nk_buffer_mark" nk-buffer-mark) :void
  (arg0 :pointer)
  (type nk-buffer-allocation-type)
)
#+ecl
(ffi:def-function ("nk_buffer_mark" nk-buffer-mark)
    (
     (arg0 :pointer)
     (type :int)
    )
)

; nk_buffer_reset
#-ecl
(cffi:defcfun ("nk_buffer_reset" nk-buffer-reset) :void
  (arg0 :pointer)
  (type nk-buffer-allocation-type)
)
#+ecl
(ffi:def-function ("nk_buffer_reset" nk-buffer-reset)
    (
     (arg0 :pointer)
     (type :int)
    )
)

; nk_buffer_clear
#-ecl
(cffi:defcfun ("nk_buffer_clear" nk-buffer-clear) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_buffer_clear" nk-buffer-clear)
    (
     (arg0 :pointer)
    )
)

; nk_buffer_free
#-ecl
(cffi:defcfun ("nk_buffer_free" nk-buffer-free) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_buffer_free" nk-buffer-free)
    (
     (arg0 :pointer)
    )
)

; nk_buffer_memory
#-ecl
(cffi:defcfun ("nk_buffer_memory" nk-buffer-memory) :pointer
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_buffer_memory" nk-buffer-memory)
    (
     (arg0 :pointer)
    )
  :returning :pointer
)

; nk_buffer_memory_const
#-ecl
(cffi:defcfun ("nk_buffer_memory_const" nk-buffer-memory-const) :pointer
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_buffer_memory_const" nk-buffer-memory-const)
    (
     (arg0 :pointer)
    )
  :returning :pointer
)

; nk_buffer_total
#-ecl
(cffi:defcfun ("nk_buffer_total" nk-buffer-total) :unsigned-long
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_buffer_total" nk-buffer-total)
    (
     (arg0 :pointer)
    )
  :returning :unsigned-long
)

; nk_str_init_default
#-ecl
(cffi:defcfun ("nk_str_init_default" nk-str-init-default) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_str_init_default" nk-str-init-default)
    (
     (arg0 :pointer)
    )
)

; nk_str_init
#-ecl
(cffi:defcfun ("nk_str_init" nk-str-init) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (size :unsigned-long)
)
#+ecl
(ffi:def-function ("nk_str_init" nk-str-init)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (size :unsigned-long)
    )
)

; nk_str_init_fixed
#-ecl
(cffi:defcfun ("nk_str_init_fixed" nk-str-init-fixed) :void
  (arg0 :pointer)
  (memory :pointer)
  (size :unsigned-long)
)
#+ecl
(ffi:def-function ("nk_str_init_fixed" nk-str-init-fixed)
    (
     (arg0 :pointer)
     (memory :pointer)
     (size :unsigned-long)
    )
)

; nk_str_clear
#-ecl
(cffi:defcfun ("nk_str_clear" nk-str-clear) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_str_clear" nk-str-clear)
    (
     (arg0 :pointer)
    )
)

; nk_str_free
#-ecl
(cffi:defcfun ("nk_str_free" nk-str-free) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_str_free" nk-str-free)
    (
     (arg0 :pointer)
    )
)

; nk_str_append_text_char
#-ecl
(cffi:defcfun ("nk_str_append_text_char" nk-str-append-text-char) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
)
#+ecl
(ffi:def-function ("nk_str_append_text_char" nk-str-append-text-char)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
    )
  :returning :int
)

; nk_str_append_str_char
#-ecl
(cffi:defcfun ("nk_str_append_str_char" nk-str-append-str-char) :int
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_str_append_str_char" nk-str-append-str-char)
    (
     (arg0 :pointer)
     (arg1 :pointer)
    )
  :returning :int
)

; nk_str_append_text_utf8
#-ecl
(cffi:defcfun ("nk_str_append_text_utf8" nk-str-append-text-utf8) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
)
#+ecl
(ffi:def-function ("nk_str_append_text_utf8" nk-str-append-text-utf8)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
    )
  :returning :int
)

; nk_str_append_str_utf8
#-ecl
(cffi:defcfun ("nk_str_append_str_utf8" nk-str-append-str-utf8) :int
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_str_append_str_utf8" nk-str-append-str-utf8)
    (
     (arg0 :pointer)
     (arg1 :pointer)
    )
  :returning :int
)

; nk_str_append_text_runes
#-ecl
(cffi:defcfun ("nk_str_append_text_runes" nk-str-append-text-runes) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
)
#+ecl
(ffi:def-function ("nk_str_append_text_runes" nk-str-append-text-runes)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :int)
    )
  :returning :int
)

; nk_str_append_str_runes
#-ecl
(cffi:defcfun ("nk_str_append_str_runes" nk-str-append-str-runes) :int
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_str_append_str_runes" nk-str-append-str-runes)
    (
     (arg0 :pointer)
     (arg1 :pointer)
    )
  :returning :int
)

; nk_str_insert_at_char
#-ecl
(cffi:defcfun ("nk_str_insert_at_char" nk-str-insert-at-char) :int
  (arg0 :pointer)
  (pos :int)
  (arg2 :pointer)
  (arg3 :int)
)
#+ecl
(ffi:def-function ("nk_str_insert_at_char" nk-str-insert-at-char)
    (
     (arg0 :pointer)
     (pos :int)
     (arg2 :pointer)
     (arg3 :int)
    )
  :returning :int
)

; nk_str_insert_at_rune
#-ecl
(cffi:defcfun ("nk_str_insert_at_rune" nk-str-insert-at-rune) :int
  (arg0 :pointer)
  (pos :int)
  (arg2 :pointer)
  (arg3 :int)
)
#+ecl
(ffi:def-function ("nk_str_insert_at_rune" nk-str-insert-at-rune)
    (
     (arg0 :pointer)
     (pos :int)
     (arg2 :pointer)
     (arg3 :int)
    )
  :returning :int
)

; nk_str_insert_text_char
#-ecl
(cffi:defcfun ("nk_str_insert_text_char" nk-str-insert-text-char) :int
  (arg0 :pointer)
  (pos :int)
  (arg2 :pointer)
  (arg3 :int)
)
#+ecl
(ffi:def-function ("nk_str_insert_text_char" nk-str-insert-text-char)
    (
     (arg0 :pointer)
     (pos :int)
     (arg2 :pointer)
     (arg3 :int)
    )
  :returning :int
)

; nk_str_insert_str_char
#-ecl
(cffi:defcfun ("nk_str_insert_str_char" nk-str-insert-str-char) :int
  (arg0 :pointer)
  (pos :int)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_str_insert_str_char" nk-str-insert-str-char)
    (
     (arg0 :pointer)
     (pos :int)
     (arg2 :pointer)
    )
  :returning :int
)

; nk_str_insert_text_utf8
#-ecl
(cffi:defcfun ("nk_str_insert_text_utf8" nk-str-insert-text-utf8) :int
  (arg0 :pointer)
  (pos :int)
  (arg2 :pointer)
  (arg3 :int)
)
#+ecl
(ffi:def-function ("nk_str_insert_text_utf8" nk-str-insert-text-utf8)
    (
     (arg0 :pointer)
     (pos :int)
     (arg2 :pointer)
     (arg3 :int)
    )
  :returning :int
)

; nk_str_insert_str_utf8
#-ecl
(cffi:defcfun ("nk_str_insert_str_utf8" nk-str-insert-str-utf8) :int
  (arg0 :pointer)
  (pos :int)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_str_insert_str_utf8" nk-str-insert-str-utf8)
    (
     (arg0 :pointer)
     (pos :int)
     (arg2 :pointer)
    )
  :returning :int
)

; nk_str_insert_text_runes
#-ecl
(cffi:defcfun ("nk_str_insert_text_runes" nk-str-insert-text-runes) :int
  (arg0 :pointer)
  (pos :int)
  (arg2 :pointer)
  (arg3 :int)
)
#+ecl
(ffi:def-function ("nk_str_insert_text_runes" nk-str-insert-text-runes)
    (
     (arg0 :pointer)
     (pos :int)
     (arg2 :pointer)
     (arg3 :int)
    )
  :returning :int
)

; nk_str_insert_str_runes
#-ecl
(cffi:defcfun ("nk_str_insert_str_runes" nk-str-insert-str-runes) :int
  (arg0 :pointer)
  (pos :int)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_str_insert_str_runes" nk-str-insert-str-runes)
    (
     (arg0 :pointer)
     (pos :int)
     (arg2 :pointer)
    )
  :returning :int
)

; nk_str_remove_chars
#-ecl
(cffi:defcfun ("nk_str_remove_chars" nk-str-remove-chars) :void
  (arg0 :pointer)
  (len :int)
)
#+ecl
(ffi:def-function ("nk_str_remove_chars" nk-str-remove-chars)
    (
     (arg0 :pointer)
     (len :int)
    )
)

; nk_str_remove_runes
#-ecl
(cffi:defcfun ("nk_str_remove_runes" nk-str-remove-runes) :void
  (str :pointer)
  (len :int)
)
#+ecl
(ffi:def-function ("nk_str_remove_runes" nk-str-remove-runes)
    (
     (str :pointer)
     (len :int)
    )
)

; nk_str_delete_chars
#-ecl
(cffi:defcfun ("nk_str_delete_chars" nk-str-delete-chars) :void
  (arg0 :pointer)
  (pos :int)
  (len :int)
)
#+ecl
(ffi:def-function ("nk_str_delete_chars" nk-str-delete-chars)
    (
     (arg0 :pointer)
     (pos :int)
     (len :int)
    )
)

; nk_str_delete_runes
#-ecl
(cffi:defcfun ("nk_str_delete_runes" nk-str-delete-runes) :void
  (arg0 :pointer)
  (pos :int)
  (len :int)
)
#+ecl
(ffi:def-function ("nk_str_delete_runes" nk-str-delete-runes)
    (
     (arg0 :pointer)
     (pos :int)
     (len :int)
    )
)

; nk_str_at_char
#-ecl
(cffi:defcfun ("nk_str_at_char" nk-str-at-char) :pointer
  (arg0 :pointer)
  (pos :int)
)
#+ecl
(ffi:def-function ("nk_str_at_char" nk-str-at-char)
    (
     (arg0 :pointer)
     (pos :int)
    )
  :returning :pointer
)

; nk_str_at_rune
#-ecl
(cffi:defcfun ("nk_str_at_rune" nk-str-at-rune) :pointer
  (arg0 :pointer)
  (pos :int)
  (unicode :pointer)
  (len :pointer)
)
#+ecl
(ffi:def-function ("nk_str_at_rune" nk-str-at-rune)
    (
     (arg0 :pointer)
     (pos :int)
     (unicode :pointer)
     (len :pointer)
    )
  :returning :pointer
)

; nk_str_rune_at
#-ecl
(cffi:defcfun ("nk_str_rune_at" nk-str-rune-at) :unsigned-int
  (arg0 :pointer)
  (pos :int)
)
#+ecl
(ffi:def-function ("nk_str_rune_at" nk-str-rune-at)
    (
     (arg0 :pointer)
     (pos :int)
    )
  :returning :unsigned-int
)

; nk_str_at_char_const
#-ecl
(cffi:defcfun ("nk_str_at_char_const" nk-str-at-char-const) :pointer
  (arg0 :pointer)
  (pos :int)
)
#+ecl
(ffi:def-function ("nk_str_at_char_const" nk-str-at-char-const)
    (
     (arg0 :pointer)
     (pos :int)
    )
  :returning :pointer
)

; nk_str_at_const
#-ecl
(cffi:defcfun ("nk_str_at_const" nk-str-at-const) :pointer
  (arg0 :pointer)
  (pos :int)
  (unicode :pointer)
  (len :pointer)
)
#+ecl
(ffi:def-function ("nk_str_at_const" nk-str-at-const)
    (
     (arg0 :pointer)
     (pos :int)
     (unicode :pointer)
     (len :pointer)
    )
  :returning :pointer
)

; nk_str_get
#-ecl
(cffi:defcfun ("nk_str_get" nk-str-get) :pointer
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_str_get" nk-str-get)
    (
     (arg0 :pointer)
    )
  :returning :pointer
)

; nk_str_get_const
#-ecl
(cffi:defcfun ("nk_str_get_const" nk-str-get-const) :pointer
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_str_get_const" nk-str-get-const)
    (
     (arg0 :pointer)
    )
  :returning :pointer
)

; nk_str_len
#-ecl
(cffi:defcfun ("nk_str_len" nk-str-len) :int
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_str_len" nk-str-len)
    (
     (arg0 :pointer)
    )
  :returning :int
)

; nk_str_len_char
#-ecl
(cffi:defcfun ("nk_str_len_char" nk-str-len-char) :int
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_str_len_char" nk-str-len-char)
    (
     (arg0 :pointer)
    )
  :returning :int
)

; nk_filter_default
#-ecl
(cffi:defcfun ("nk_filter_default" nk-filter-default) :int
  (arg0 :pointer)
  (unicode :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_filter_default" nk-filter-default)
    (
     (arg0 :pointer)
     (unicode :unsigned-int)
    )
  :returning :int
)

; nk_filter_ascii
#-ecl
(cffi:defcfun ("nk_filter_ascii" nk-filter-ascii) :int
  (arg0 :pointer)
  (unicode :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_filter_ascii" nk-filter-ascii)
    (
     (arg0 :pointer)
     (unicode :unsigned-int)
    )
  :returning :int
)

; nk_filter_float
#-ecl
(cffi:defcfun ("nk_filter_float" nk-filter-float) :int
  (arg0 :pointer)
  (unicode :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_filter_float" nk-filter-float)
    (
     (arg0 :pointer)
     (unicode :unsigned-int)
    )
  :returning :int
)

; nk_filter_decimal
#-ecl
(cffi:defcfun ("nk_filter_decimal" nk-filter-decimal) :int
  (arg0 :pointer)
  (unicode :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_filter_decimal" nk-filter-decimal)
    (
     (arg0 :pointer)
     (unicode :unsigned-int)
    )
  :returning :int
)

; nk_filter_hex
#-ecl
(cffi:defcfun ("nk_filter_hex" nk-filter-hex) :int
  (arg0 :pointer)
  (unicode :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_filter_hex" nk-filter-hex)
    (
     (arg0 :pointer)
     (unicode :unsigned-int)
    )
  :returning :int
)

; nk_filter_oct
#-ecl
(cffi:defcfun ("nk_filter_oct" nk-filter-oct) :int
  (arg0 :pointer)
  (unicode :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_filter_oct" nk-filter-oct)
    (
     (arg0 :pointer)
     (unicode :unsigned-int)
    )
  :returning :int
)

; nk_filter_binary
#-ecl
(cffi:defcfun ("nk_filter_binary" nk-filter-binary) :int
  (arg0 :pointer)
  (unicode :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_filter_binary" nk-filter-binary)
    (
     (arg0 :pointer)
     (unicode :unsigned-int)
    )
  :returning :int
)

; nk_textedit_init_default
#-ecl
(cffi:defcfun ("nk_textedit_init_default" nk-textedit-init-default) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_textedit_init_default" nk-textedit-init-default)
    (
     (arg0 :pointer)
    )
)

; nk_textedit_init
#-ecl
(cffi:defcfun ("nk_textedit_init" nk-textedit-init) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (size :unsigned-long)
)
#+ecl
(ffi:def-function ("nk_textedit_init" nk-textedit-init)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (size :unsigned-long)
    )
)

; nk_textedit_init_fixed
#-ecl
(cffi:defcfun ("nk_textedit_init_fixed" nk-textedit-init-fixed) :void
  (arg0 :pointer)
  (memory :pointer)
  (size :unsigned-long)
)
#+ecl
(ffi:def-function ("nk_textedit_init_fixed" nk-textedit-init-fixed)
    (
     (arg0 :pointer)
     (memory :pointer)
     (size :unsigned-long)
    )
)

; nk_textedit_free
#-ecl
(cffi:defcfun ("nk_textedit_free" nk-textedit-free) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_textedit_free" nk-textedit-free)
    (
     (arg0 :pointer)
    )
)

; nk_textedit_text
#-ecl
(cffi:defcfun ("nk_textedit_text" nk-textedit-text) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (total-len :int)
)
#+ecl
(ffi:def-function ("nk_textedit_text" nk-textedit-text)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (total-len :int)
    )
)

; nk_textedit_delete
#-ecl
(cffi:defcfun ("nk_textedit_delete" nk-textedit-delete) :void
  (arg0 :pointer)
  (where :int)
  (len :int)
)
#+ecl
(ffi:def-function ("nk_textedit_delete" nk-textedit-delete)
    (
     (arg0 :pointer)
     (where :int)
     (len :int)
    )
)

; nk_textedit_delete_selection
#-ecl
(cffi:defcfun ("nk_textedit_delete_selection" nk-textedit-delete-selection) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_textedit_delete_selection" nk-textedit-delete-selection)
    (
     (arg0 :pointer)
    )
)

; nk_textedit_select_all
#-ecl
(cffi:defcfun ("nk_textedit_select_all" nk-textedit-select-all) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_textedit_select_all" nk-textedit-select-all)
    (
     (arg0 :pointer)
    )
)

; nk_textedit_cut
#-ecl
(cffi:defcfun ("nk_textedit_cut" nk-textedit-cut) :int
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_textedit_cut" nk-textedit-cut)
    (
     (arg0 :pointer)
    )
  :returning :int
)

; nk_textedit_paste
#-ecl
(cffi:defcfun ("nk_textedit_paste" nk-textedit-paste) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (len :int)
)
#+ecl
(ffi:def-function ("nk_textedit_paste" nk-textedit-paste)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (len :int)
    )
  :returning :int
)

; nk_textedit_undo
#-ecl
(cffi:defcfun ("nk_textedit_undo" nk-textedit-undo) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_textedit_undo" nk-textedit-undo)
    (
     (arg0 :pointer)
    )
)

; nk_textedit_redo
#-ecl
(cffi:defcfun ("nk_textedit_redo" nk-textedit-redo) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_textedit_redo" nk-textedit-redo)
    (
     (arg0 :pointer)
    )
)

; nk_stroke_line
#-ecl
; [SHIM] nk_stroke_line — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_stroke_line" nk-stroke-line) :void
  (b :pointer)
  (x0 :float)
  (y0 :float)
  (x1 :float)
  (y1 :float)
  (line-thickness :float)
  (arg6 :pointer)
)
#+ecl
(ffi:def-function ("nk_stroke_line" nk-stroke-line)
    (
     (b :pointer)
     (x0 :float)
     (y0 :float)
     (x1 :float)
     (y1 :float)
     (line-thickness :float)
     (arg6 (:struct nk-color))
    )
)

; nk_stroke_curve
#-ecl
; [SHIM] nk_stroke_curve — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_stroke_curve" nk-stroke-curve) :void
  (arg0 :pointer)
  (arg1 :float)
  (arg2 :float)
  (arg3 :float)
  (arg4 :float)
  (arg5 :float)
  (arg6 :float)
  (arg7 :float)
  (arg8 :float)
  (line-thickness :float)
  (arg10 :pointer)
)
#+ecl
(ffi:def-function ("nk_stroke_curve" nk-stroke-curve)
    (
     (arg0 :pointer)
     (arg1 :float)
     (arg2 :float)
     (arg3 :float)
     (arg4 :float)
     (arg5 :float)
     (arg6 :float)
     (arg7 :float)
     (arg8 :float)
     (line-thickness :float)
     (arg10 (:struct nk-color))
    )
)

; nk_stroke_rect
#-ecl
; [SHIM] nk_stroke_rect — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_stroke_rect" nk-stroke-rect) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (rounding :float)
  (line-thickness :float)
  (arg4 :pointer)
)
#+ecl
(ffi:def-function ("nk_stroke_rect" nk-stroke-rect)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-rect))
     (rounding :float)
     (line-thickness :float)
     (arg4 (:struct nk-color))
    )
)

; nk_stroke_circle
#-ecl
; [SHIM] nk_stroke_circle — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_stroke_circle" nk-stroke-circle) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (line-thickness :float)
  (arg3 :pointer)
)
#+ecl
(ffi:def-function ("nk_stroke_circle" nk-stroke-circle)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-rect))
     (line-thickness :float)
     (arg3 (:struct nk-color))
    )
)

; nk_stroke_arc
#-ecl
; [SHIM] nk_stroke_arc — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_stroke_arc" nk-stroke-arc) :void
  (arg0 :pointer)
  (cx :float)
  (cy :float)
  (radius :float)
  (a-min :float)
  (a-max :float)
  (line-thickness :float)
  (arg7 :pointer)
)
#+ecl
(ffi:def-function ("nk_stroke_arc" nk-stroke-arc)
    (
     (arg0 :pointer)
     (cx :float)
     (cy :float)
     (radius :float)
     (a-min :float)
     (a-max :float)
     (line-thickness :float)
     (arg7 (:struct nk-color))
    )
)

; nk_stroke_triangle
#-ecl
; [SHIM] nk_stroke_triangle — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_stroke_triangle" nk-stroke-triangle) :void
  (arg0 :pointer)
  (arg1 :float)
  (arg2 :float)
  (arg3 :float)
  (arg4 :float)
  (arg5 :float)
  (arg6 :float)
  (line-thichness :float)
  (arg8 :pointer)
)
#+ecl
(ffi:def-function ("nk_stroke_triangle" nk-stroke-triangle)
    (
     (arg0 :pointer)
     (arg1 :float)
     (arg2 :float)
     (arg3 :float)
     (arg4 :float)
     (arg5 :float)
     (arg6 :float)
     (line-thichness :float)
     (arg8 (:struct nk-color))
    )
)

; nk_stroke_polyline
#-ecl
; [SHIM] nk_stroke_polyline — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_stroke_polyline" nk-stroke-polyline) :void
  (arg0 :pointer)
  (points :pointer)
  (point-count :int)
  (line-thickness :float)
  (col :pointer)
)
#+ecl
(ffi:def-function ("nk_stroke_polyline" nk-stroke-polyline)
    (
     (arg0 :pointer)
     (points :pointer)
     (point-count :int)
     (line-thickness :float)
     (col (:struct nk-color))
    )
)

; nk_stroke_polygon
#-ecl
; [SHIM] nk_stroke_polygon — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_stroke_polygon" nk-stroke-polygon) :void
  (arg0 :pointer)
  (points :pointer)
  (point-count :int)
  (line-thickness :float)
  (arg4 :pointer)
)
#+ecl
(ffi:def-function ("nk_stroke_polygon" nk-stroke-polygon)
    (
     (arg0 :pointer)
     (points :pointer)
     (point-count :int)
     (line-thickness :float)
     (arg4 (:struct nk-color))
    )
)

; nk_fill_rect
#-ecl
; [SHIM] nk_fill_rect — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_fill_rect" nk-fill-rect) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (rounding :float)
  (arg3 :pointer)
)
#+ecl
(ffi:def-function ("nk_fill_rect" nk-fill-rect)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-rect))
     (rounding :float)
     (arg3 (:struct nk-color))
    )
)

; nk_fill_rect_multi_color
#-ecl
; [SHIM] nk_fill_rect_multi_color — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_fill_rect_multi_color" nk-fill-rect-multi-color) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (left :pointer)
  (top :pointer)
  (right :pointer)
  (bottom :pointer)
)
#+ecl
(ffi:def-function ("nk_fill_rect_multi_color" nk-fill-rect-multi-color)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-rect))
     (left (:struct nk-color))
     (top (:struct nk-color))
     (right (:struct nk-color))
     (bottom (:struct nk-color))
    )
)

; nk_fill_circle
#-ecl
; [SHIM] nk_fill_circle — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_fill_circle" nk-fill-circle) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_fill_circle" nk-fill-circle)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-rect))
     (arg2 (:struct nk-color))
    )
)

; nk_fill_arc
#-ecl
; [SHIM] nk_fill_arc — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_fill_arc" nk-fill-arc) :void
  (arg0 :pointer)
  (cx :float)
  (cy :float)
  (radius :float)
  (a-min :float)
  (a-max :float)
  (arg6 :pointer)
)
#+ecl
(ffi:def-function ("nk_fill_arc" nk-fill-arc)
    (
     (arg0 :pointer)
     (cx :float)
     (cy :float)
     (radius :float)
     (a-min :float)
     (a-max :float)
     (arg6 (:struct nk-color))
    )
)

; nk_fill_triangle
#-ecl
; [SHIM] nk_fill_triangle — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_fill_triangle" nk-fill-triangle) :void
  (arg0 :pointer)
  (x0 :float)
  (y0 :float)
  (x1 :float)
  (y1 :float)
  (x2 :float)
  (y2 :float)
  (arg7 :pointer)
)
#+ecl
(ffi:def-function ("nk_fill_triangle" nk-fill-triangle)
    (
     (arg0 :pointer)
     (x0 :float)
     (y0 :float)
     (x1 :float)
     (y1 :float)
     (x2 :float)
     (y2 :float)
     (arg7 (:struct nk-color))
    )
)

; nk_fill_polygon
#-ecl
; [SHIM] nk_fill_polygon — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_fill_polygon" nk-fill-polygon) :void
  (arg0 :pointer)
  (points :pointer)
  (point-count :int)
  (arg3 :pointer)
)
#+ecl
(ffi:def-function ("nk_fill_polygon" nk-fill-polygon)
    (
     (arg0 :pointer)
     (points :pointer)
     (point-count :int)
     (arg3 (:struct nk-color))
    )
)

; nk_draw_image
#-ecl
; [SHIM] nk_draw_image — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_image" nk-draw-image) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
)
#+ecl
(ffi:def-function ("nk_draw_image" nk-draw-image)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-rect))
     (arg2 :pointer)
     (arg3 (:struct nk-color))
    )
)

; nk_draw_nine_slice
#-ecl
; [SHIM] nk_draw_nine_slice — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_nine_slice" nk-draw-nine-slice) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
)
#+ecl
(ffi:def-function ("nk_draw_nine_slice" nk-draw-nine-slice)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-rect))
     (arg2 :pointer)
     (arg3 (:struct nk-color))
    )
)

; nk_draw_text
#-ecl
; [SHIM] nk_draw_text — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_text" nk-draw-text) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (text :pointer)
  (len :int)
  (arg4 :pointer)
  (arg5 :pointer)
  (arg6 :pointer)
)
#+ecl
(ffi:def-function ("nk_draw_text" nk-draw-text)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-rect))
     (text :pointer)
     (len :int)
     (arg4 :pointer)
     (arg5 (:struct nk-color))
     (arg6 (:struct nk-color))
    )
)

; nk_push_scissor
#-ecl
; [SHIM] nk_push_scissor — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_push_scissor" nk-push-scissor) :void
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_push_scissor" nk-push-scissor)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-rect))
    )
)

; nk_push_custom
#-ecl
; [SHIM] nk_push_custom — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_push_custom" nk-push-custom) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (usr :pointer)
)
#+ecl
(ffi:def-function ("nk_push_custom" nk-push-custom)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-rect))
     (arg2 :pointer)
     (usr (:union nk-handle))
    )
)

; nk_input_has_mouse_click
#-ecl
(cffi:defcfun ("nk_input_has_mouse_click" nk-input-has-mouse-click) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
)
#+ecl
(ffi:def-function ("nk_input_has_mouse_click" nk-input-has-mouse-click)
    (
     (arg0 :pointer)
     (arg1 :int)
    )
  :returning :int
)

; nk_input_has_mouse_click_in_rect
#-ecl
; [SHIM] nk_input_has_mouse_click_in_rect — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_input_has_mouse_click_in_rect" nk-input-has-mouse-click-in-rect) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_input_has_mouse_click_in_rect" nk-input-has-mouse-click-in-rect)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 (:struct nk-rect))
    )
  :returning :int
)

; nk_input_has_mouse_click_in_button_rect
#-ecl
; [SHIM] nk_input_has_mouse_click_in_button_rect — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_input_has_mouse_click_in_button_rect" nk-input-has-mouse-click-in-button-rect) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_input_has_mouse_click_in_button_rect" nk-input-has-mouse-click-in-button-rect)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 (:struct nk-rect))
    )
  :returning :int
)

; nk_input_has_mouse_click_down_in_rect
#-ecl
; [SHIM] nk_input_has_mouse_click_down_in_rect — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_input_has_mouse_click_down_in_rect" nk-input-has-mouse-click-down-in-rect) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
  (arg2 :pointer)
  (down :int)
)
#+ecl
(ffi:def-function ("nk_input_has_mouse_click_down_in_rect" nk-input-has-mouse-click-down-in-rect)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 (:struct nk-rect))
     (down :int)
    )
  :returning :int
)

; nk_input_is_mouse_click_in_rect
#-ecl
; [SHIM] nk_input_is_mouse_click_in_rect — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_input_is_mouse_click_in_rect" nk-input-is-mouse-click-in-rect) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_input_is_mouse_click_in_rect" nk-input-is-mouse-click-in-rect)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 (:struct nk-rect))
    )
  :returning :int
)

; nk_input_is_mouse_click_down_in_rect
#-ecl
; [SHIM] nk_input_is_mouse_click_down_in_rect — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_input_is_mouse_click_down_in_rect" nk-input-is-mouse-click-down-in-rect) :int
  (i :pointer)
  (id nk-buttons)
  (b :pointer)
  (down :int)
)
#+ecl
(ffi:def-function ("nk_input_is_mouse_click_down_in_rect" nk-input-is-mouse-click-down-in-rect)
    (
     (i :pointer)
     (id :int)
     (b (:struct nk-rect))
     (down :int)
    )
  :returning :int
)

; nk_input_any_mouse_click_in_rect
#-ecl
; [SHIM] nk_input_any_mouse_click_in_rect — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_input_any_mouse_click_in_rect" nk-input-any-mouse-click-in-rect) :int
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_input_any_mouse_click_in_rect" nk-input-any-mouse-click-in-rect)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-rect))
    )
  :returning :int
)

; nk_input_is_mouse_prev_hovering_rect
#-ecl
; [SHIM] nk_input_is_mouse_prev_hovering_rect — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_input_is_mouse_prev_hovering_rect" nk-input-is-mouse-prev-hovering-rect) :int
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_input_is_mouse_prev_hovering_rect" nk-input-is-mouse-prev-hovering-rect)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-rect))
    )
  :returning :int
)

; nk_input_is_mouse_hovering_rect
#-ecl
; [SHIM] nk_input_is_mouse_hovering_rect — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_input_is_mouse_hovering_rect" nk-input-is-mouse-hovering-rect) :int
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_input_is_mouse_hovering_rect" nk-input-is-mouse-hovering-rect)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-rect))
    )
  :returning :int
)

; nk_input_is_mouse_hovering_still_rect
#-ecl
; [SHIM] nk_input_is_mouse_hovering_still_rect — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_input_is_mouse_hovering_still_rect" nk-input-is-mouse-hovering-still-rect) :int
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_input_is_mouse_hovering_still_rect" nk-input-is-mouse-hovering-still-rect)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-rect))
    )
  :returning :int
)

; nk_input_is_mouse_hovering_delay_rect
#-ecl
; [SHIM] nk_input_is_mouse_hovering_delay_rect — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_input_is_mouse_hovering_delay_rect" nk-input-is-mouse-hovering-delay-rect) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :float)
)
#+ecl
(ffi:def-function ("nk_input_is_mouse_hovering_delay_rect" nk-input-is-mouse-hovering-delay-rect)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-rect))
     (arg2 :pointer)
     (arg3 :float)
    )
  :returning :int
)

; nk_input_is_mouse_hovering_still_delay_rect
#-ecl
; [SHIM] nk_input_is_mouse_hovering_still_delay_rect — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_input_is_mouse_hovering_still_delay_rect" nk-input-is-mouse-hovering-still-delay-rect) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :float)
)
#+ecl
(ffi:def-function ("nk_input_is_mouse_hovering_still_delay_rect" nk-input-is-mouse-hovering-still-delay-rect)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-rect))
     (arg2 :pointer)
     (arg3 :float)
    )
  :returning :int
)

; nk_input_is_mouse_hovering_still_delay_clicked_rect
#-ecl
; [SHIM] nk_input_is_mouse_hovering_still_delay_clicked_rect — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_input_is_mouse_hovering_still_delay_clicked_rect" nk-input-is-mouse-hovering-still-delay-clicked-rect) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :float)
  (arg4 :pointer)
)
#+ecl
(ffi:def-function ("nk_input_is_mouse_hovering_still_delay_clicked_rect" nk-input-is-mouse-hovering-still-delay-clicked-rect)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-rect))
     (arg2 :pointer)
     (arg3 :float)
     (arg4 :pointer)
    )
  :returning :int
)

; nk_input_is_mouse_moved
#-ecl
(cffi:defcfun ("nk_input_is_mouse_moved" nk-input-is-mouse-moved) :int
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_input_is_mouse_moved" nk-input-is-mouse-moved)
    (
     (arg0 :pointer)
    )
  :returning :int
)

; nk_input_mouse_clicked
#-ecl
; [SHIM] nk_input_mouse_clicked — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_input_mouse_clicked" nk-input-mouse-clicked) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk_input_mouse_clicked" nk-input-mouse-clicked)
    (
     (arg0 :pointer)
     (arg1 :int)
     (arg2 (:struct nk-rect))
    )
  :returning :int
)

; nk_input_is_mouse_down
#-ecl
(cffi:defcfun ("nk_input_is_mouse_down" nk-input-is-mouse-down) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
)
#+ecl
(ffi:def-function ("nk_input_is_mouse_down" nk-input-is-mouse-down)
    (
     (arg0 :pointer)
     (arg1 :int)
    )
  :returning :int
)

; nk_input_is_mouse_pressed
#-ecl
(cffi:defcfun ("nk_input_is_mouse_pressed" nk-input-is-mouse-pressed) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
)
#+ecl
(ffi:def-function ("nk_input_is_mouse_pressed" nk-input-is-mouse-pressed)
    (
     (arg0 :pointer)
     (arg1 :int)
    )
  :returning :int
)

; nk_input_is_mouse_released
#-ecl
(cffi:defcfun ("nk_input_is_mouse_released" nk-input-is-mouse-released) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
)
#+ecl
(ffi:def-function ("nk_input_is_mouse_released" nk-input-is-mouse-released)
    (
     (arg0 :pointer)
     (arg1 :int)
    )
  :returning :int
)

; nk_input_is_key_pressed
#-ecl
(cffi:defcfun ("nk_input_is_key_pressed" nk-input-is-key-pressed) :int
  (arg0 :pointer)
  (arg1 nk-keys)
)
#+ecl
(ffi:def-function ("nk_input_is_key_pressed" nk-input-is-key-pressed)
    (
     (arg0 :pointer)
     (arg1 :int)
    )
  :returning :int
)

; nk_input_is_key_released
#-ecl
(cffi:defcfun ("nk_input_is_key_released" nk-input-is-key-released) :int
  (arg0 :pointer)
  (arg1 nk-keys)
)
#+ecl
(ffi:def-function ("nk_input_is_key_released" nk-input-is-key-released)
    (
     (arg0 :pointer)
     (arg1 :int)
    )
  :returning :int
)

; nk_input_is_key_down
#-ecl
(cffi:defcfun ("nk_input_is_key_down" nk-input-is-key-down) :int
  (arg0 :pointer)
  (arg1 nk-keys)
)
#+ecl
(ffi:def-function ("nk_input_is_key_down" nk-input-is-key-down)
    (
     (arg0 :pointer)
     (arg1 :int)
    )
  :returning :int
)

; nk_draw_list_init
#-ecl
(cffi:defcfun ("nk_draw_list_init" nk-draw-list-init) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_draw_list_init" nk-draw-list-init)
    (
     (arg0 :pointer)
    )
)

; nk_draw_list_setup
#-ecl
(cffi:defcfun ("nk_draw_list_setup" nk-draw-list-setup) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (cmds :pointer)
  (vertices :pointer)
  (elements :pointer)
  (line-aa nk-anti-aliasing)
  (shape-aa nk-anti-aliasing)
)
#+ecl
(ffi:def-function ("nk_draw_list_setup" nk-draw-list-setup)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (cmds :pointer)
     (vertices :pointer)
     (elements :pointer)
     (line-aa :int)
     (shape-aa :int)
    )
)

; nk__draw_list_begin
#-ecl
(cffi:defcfun ("nk__draw_list_begin" nk--draw-list-begin) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk__draw_list_begin" nk--draw-list-begin)
    (
     (arg0 :pointer)
     (arg1 :pointer)
    )
  :returning :pointer
)

; nk__draw_list_next
#-ecl
(cffi:defcfun ("nk__draw_list_next" nk--draw-list-next) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)
#+ecl
(ffi:def-function ("nk__draw_list_next" nk--draw-list-next)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 :pointer)
    )
  :returning :pointer
)

; nk__draw_list_end
#-ecl
(cffi:defcfun ("nk__draw_list_end" nk--draw-list-end) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk__draw_list_end" nk--draw-list-end)
    (
     (arg0 :pointer)
     (arg1 :pointer)
    )
  :returning :pointer
)

; nk_draw_list_path_clear
#-ecl
(cffi:defcfun ("nk_draw_list_path_clear" nk-draw-list-path-clear) :void
  (arg0 :pointer)
)
#+ecl
(ffi:def-function ("nk_draw_list_path_clear" nk-draw-list-path-clear)
    (
     (arg0 :pointer)
    )
)

; nk_draw_list_path_line_to
#-ecl
; [SHIM] nk_draw_list_path_line_to — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_path_line_to" nk-draw-list-path-line-to) :void
  (arg0 :pointer)
  (pos :pointer)
)
#+ecl
(ffi:def-function ("nk_draw_list_path_line_to" nk-draw-list-path-line-to)
    (
     (arg0 :pointer)
     (pos (:struct nk-vec2))
    )
)

; nk_draw_list_path_arc_to_fast
#-ecl
; [SHIM] nk_draw_list_path_arc_to_fast — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_path_arc_to_fast" nk-draw-list-path-arc-to-fast) :void
  (arg0 :pointer)
  (center :pointer)
  (radius :float)
  (a-min :int)
  (a-max :int)
)
#+ecl
(ffi:def-function ("nk_draw_list_path_arc_to_fast" nk-draw-list-path-arc-to-fast)
    (
     (arg0 :pointer)
     (center (:struct nk-vec2))
     (radius :float)
     (a-min :int)
     (a-max :int)
    )
)

; nk_draw_list_path_arc_to
#-ecl
; [SHIM] nk_draw_list_path_arc_to — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_path_arc_to" nk-draw-list-path-arc-to) :void
  (arg0 :pointer)
  (center :pointer)
  (radius :float)
  (a-min :float)
  (a-max :float)
  (segments :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_draw_list_path_arc_to" nk-draw-list-path-arc-to)
    (
     (arg0 :pointer)
     (center (:struct nk-vec2))
     (radius :float)
     (a-min :float)
     (a-max :float)
     (segments :unsigned-int)
    )
)

; nk_draw_list_path_rect_to
#-ecl
; [SHIM] nk_draw_list_path_rect_to — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_path_rect_to" nk-draw-list-path-rect-to) :void
  (arg0 :pointer)
  (a :pointer)
  (b :pointer)
  (rounding :float)
)
#+ecl
(ffi:def-function ("nk_draw_list_path_rect_to" nk-draw-list-path-rect-to)
    (
     (arg0 :pointer)
     (a (:struct nk-vec2))
     (b (:struct nk-vec2))
     (rounding :float)
    )
)

; nk_draw_list_path_curve_to
#-ecl
; [SHIM] nk_draw_list_path_curve_to — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_path_curve_to" nk-draw-list-path-curve-to) :void
  (arg0 :pointer)
  (p2 :pointer)
  (p3 :pointer)
  (p4 :pointer)
  (num-segments :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_draw_list_path_curve_to" nk-draw-list-path-curve-to)
    (
     (arg0 :pointer)
     (p2 (:struct nk-vec2))
     (p3 (:struct nk-vec2))
     (p4 (:struct nk-vec2))
     (num-segments :unsigned-int)
    )
)

; nk_draw_list_path_fill
#-ecl
; [SHIM] nk_draw_list_path_fill — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_path_fill" nk-draw-list-path-fill) :void
  (arg0 :pointer)
  (arg1 :pointer)
)
#+ecl
(ffi:def-function ("nk_draw_list_path_fill" nk-draw-list-path-fill)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-color))
    )
)

; nk_draw_list_path_stroke
#-ecl
; [SHIM] nk_draw_list_path_stroke — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_path_stroke" nk-draw-list-path-stroke) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (closed nk-draw-list-stroke)
  (thickness :float)
)
#+ecl
(ffi:def-function ("nk_draw_list_path_stroke" nk-draw-list-path-stroke)
    (
     (arg0 :pointer)
     (arg1 (:struct nk-color))
     (closed :int)
     (thickness :float)
    )
)

; nk_draw_list_stroke_line
#-ecl
; [SHIM] nk_draw_list_stroke_line — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_stroke_line" nk-draw-list-stroke-line) :void
  (arg0 :pointer)
  (a :pointer)
  (b :pointer)
  (arg3 :pointer)
  (thickness :float)
)
#+ecl
(ffi:def-function ("nk_draw_list_stroke_line" nk-draw-list-stroke-line)
    (
     (arg0 :pointer)
     (a (:struct nk-vec2))
     (b (:struct nk-vec2))
     (arg3 (:struct nk-color))
     (thickness :float)
    )
)

; nk_draw_list_stroke_rect
#-ecl
; [SHIM] nk_draw_list_stroke_rect — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_stroke_rect" nk-draw-list-stroke-rect) :void
  (arg0 :pointer)
  (rect :pointer)
  (arg2 :pointer)
  (rounding :float)
  (thickness :float)
)
#+ecl
(ffi:def-function ("nk_draw_list_stroke_rect" nk-draw-list-stroke-rect)
    (
     (arg0 :pointer)
     (rect (:struct nk-rect))
     (arg2 (:struct nk-color))
     (rounding :float)
     (thickness :float)
    )
)

; nk_draw_list_stroke_triangle
#-ecl
; [SHIM] nk_draw_list_stroke_triangle — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_stroke_triangle" nk-draw-list-stroke-triangle) :void
  (arg0 :pointer)
  (a :pointer)
  (b :pointer)
  (c :pointer)
  (arg4 :pointer)
  (thickness :float)
)
#+ecl
(ffi:def-function ("nk_draw_list_stroke_triangle" nk-draw-list-stroke-triangle)
    (
     (arg0 :pointer)
     (a (:struct nk-vec2))
     (b (:struct nk-vec2))
     (c (:struct nk-vec2))
     (arg4 (:struct nk-color))
     (thickness :float)
    )
)

; nk_draw_list_stroke_circle
#-ecl
; [SHIM] nk_draw_list_stroke_circle — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_stroke_circle" nk-draw-list-stroke-circle) :void
  (arg0 :pointer)
  (center :pointer)
  (radius :float)
  (arg3 :pointer)
  (segs :unsigned-int)
  (thickness :float)
)
#+ecl
(ffi:def-function ("nk_draw_list_stroke_circle" nk-draw-list-stroke-circle)
    (
     (arg0 :pointer)
     (center (:struct nk-vec2))
     (radius :float)
     (arg3 (:struct nk-color))
     (segs :unsigned-int)
     (thickness :float)
    )
)

; nk_draw_list_stroke_curve
#-ecl
; [SHIM] nk_draw_list_stroke_curve — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_stroke_curve" nk-draw-list-stroke-curve) :void
  (arg0 :pointer)
  (p0 :pointer)
  (cp0 :pointer)
  (cp1 :pointer)
  (p1 :pointer)
  (arg5 :pointer)
  (segments :unsigned-int)
  (thickness :float)
)
#+ecl
(ffi:def-function ("nk_draw_list_stroke_curve" nk-draw-list-stroke-curve)
    (
     (arg0 :pointer)
     (p0 (:struct nk-vec2))
     (cp0 (:struct nk-vec2))
     (cp1 (:struct nk-vec2))
     (p1 (:struct nk-vec2))
     (arg5 (:struct nk-color))
     (segments :unsigned-int)
     (thickness :float)
    )
)

; nk_draw_list_stroke_poly_line
#-ecl
; [SHIM] nk_draw_list_stroke_poly_line — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_stroke_poly_line" nk-draw-list-stroke-poly-line) :void
  (arg0 :pointer)
  (pnts :pointer)
  (cnt :unsigned-int)
  (arg3 :pointer)
  (arg4 nk-draw-list-stroke)
  (thickness :float)
  (arg6 nk-anti-aliasing)
)
#+ecl
(ffi:def-function ("nk_draw_list_stroke_poly_line" nk-draw-list-stroke-poly-line)
    (
     (arg0 :pointer)
     (pnts :pointer)
     (cnt :unsigned-int)
     (arg3 (:struct nk-color))
     (arg4 :int)
     (thickness :float)
     (arg6 :int)
    )
)

; nk_draw_list_fill_rect
#-ecl
; [SHIM] nk_draw_list_fill_rect — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_fill_rect" nk-draw-list-fill-rect) :void
  (arg0 :pointer)
  (rect :pointer)
  (arg2 :pointer)
  (rounding :float)
)
#+ecl
(ffi:def-function ("nk_draw_list_fill_rect" nk-draw-list-fill-rect)
    (
     (arg0 :pointer)
     (rect (:struct nk-rect))
     (arg2 (:struct nk-color))
     (rounding :float)
    )
)

; nk_draw_list_fill_rect_multi_color
#-ecl
; [SHIM] nk_draw_list_fill_rect_multi_color — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_fill_rect_multi_color" nk-draw-list-fill-rect-multi-color) :void
  (arg0 :pointer)
  (rect :pointer)
  (left :pointer)
  (top :pointer)
  (right :pointer)
  (bottom :pointer)
)
#+ecl
(ffi:def-function ("nk_draw_list_fill_rect_multi_color" nk-draw-list-fill-rect-multi-color)
    (
     (arg0 :pointer)
     (rect (:struct nk-rect))
     (left (:struct nk-color))
     (top (:struct nk-color))
     (right (:struct nk-color))
     (bottom (:struct nk-color))
    )
)

; nk_draw_list_fill_triangle
#-ecl
; [SHIM] nk_draw_list_fill_triangle — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_fill_triangle" nk-draw-list-fill-triangle) :void
  (arg0 :pointer)
  (a :pointer)
  (b :pointer)
  (c :pointer)
  (arg4 :pointer)
)
#+ecl
(ffi:def-function ("nk_draw_list_fill_triangle" nk-draw-list-fill-triangle)
    (
     (arg0 :pointer)
     (a (:struct nk-vec2))
     (b (:struct nk-vec2))
     (c (:struct nk-vec2))
     (arg4 (:struct nk-color))
    )
)

; nk_draw_list_fill_circle
#-ecl
; [SHIM] nk_draw_list_fill_circle — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_fill_circle" nk-draw-list-fill-circle) :void
  (arg0 :pointer)
  (center :pointer)
  (radius :float)
  (col :pointer)
  (segs :unsigned-int)
)
#+ecl
(ffi:def-function ("nk_draw_list_fill_circle" nk-draw-list-fill-circle)
    (
     (arg0 :pointer)
     (center (:struct nk-vec2))
     (radius :float)
     (col (:struct nk-color))
     (segs :unsigned-int)
    )
)

; nk_draw_list_fill_poly_convex
#-ecl
; [SHIM] nk_draw_list_fill_poly_convex — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_fill_poly_convex" nk-draw-list-fill-poly-convex) :void
  (arg0 :pointer)
  (points :pointer)
  (count :unsigned-int)
  (arg3 :pointer)
  (arg4 nk-anti-aliasing)
)
#+ecl
(ffi:def-function ("nk_draw_list_fill_poly_convex" nk-draw-list-fill-poly-convex)
    (
     (arg0 :pointer)
     (points :pointer)
     (count :unsigned-int)
     (arg3 (:struct nk-color))
     (arg4 :int)
    )
)

; nk_draw_list_add_image
#-ecl
; [SHIM] nk_draw_list_add_image — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_add_image" nk-draw-list-add-image) :void
  (arg0 :pointer)
  (texture :pointer)
  (rect :pointer)
  (arg3 :pointer)
)
#+ecl
(ffi:def-function ("nk_draw_list_add_image" nk-draw-list-add-image)
    (
     (arg0 :pointer)
     (texture (:struct nk-image))
     (rect (:struct nk-rect))
     (arg3 (:struct nk-color))
    )
)

; nk_draw_list_add_text
#-ecl
; [SHIM] nk_draw_list_add_text — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_add_text" nk-draw-list-add-text) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (text :pointer)
  (len :int)
  (font-height :float)
  (arg6 :pointer)
)
#+ecl
(ffi:def-function ("nk_draw_list_add_text" nk-draw-list-add-text)
    (
     (arg0 :pointer)
     (arg1 :pointer)
     (arg2 (:struct nk-rect))
     (text :pointer)
     (len :int)
     (font-height :float)
     (arg6 (:struct nk-color))
    )
)

; nk_draw_list_push_userdata
#-ecl
; [SHIM] nk_draw_list_push_userdata — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_push_userdata" nk-draw-list-push-userdata) :void
  (arg0 :pointer)
  (userdata :pointer)
)
#+ecl
(ffi:def-function ("nk_draw_list_push_userdata" nk-draw-list-push-userdata)
    (
     (arg0 :pointer)
     (userdata (:union nk-handle))
    )
)

; nk_style_item_color
#-ecl
; [SHIM] nk_style_item_color — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_style_item_color" nk-style-item-color) :void
  (arg0 :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_style_item_color" nk-style-item-color)
    (
     (arg0 (:struct nk-color))
    )
  :returning (:struct nk-style-item)
)

; nk_style_item_image
#-ecl
; [SHIM] nk_style_item_image — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_style_item_image" nk-style-item-image) :void
  (img :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_style_item_image" nk-style-item-image)
    (
     (img (:struct nk-image))
    )
  :returning (:struct nk-style-item)
)

; nk_style_item_nine_slice
#-ecl
; [SHIM] nk_style_item_nine_slice — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_style_item_nine_slice" nk-style-item-nine-slice) :void
  (slice :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_style_item_nine_slice" nk-style-item-nine-slice)
    (
     (slice (:struct nk-nine-slice))
    )
  :returning (:struct nk-style-item)
)

; nk_style_item_hide
#-ecl
; [SHIM] nk_style_item_hide — struct-by-value replaced with pointers
(cffi:defcfun ("cl_nk_style_item_hide" nk-style-item-hide) :void
  (result-out :pointer)  ; caller allocates; filled with return value
)
#+ecl
(ffi:def-function ("nk_style_item_hide" nk-style-item-hide)
    (
    )
  :returning (:struct nk-style-item)
)
