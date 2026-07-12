(in-package :nuklear)

;;; Function bindings.
;;; Functions marked [SHIM] delegate to a generated C wrapper (nuklear_shims.c)
;;; that converts struct-by-value arguments/returns to pointer arguments.

(cffi:defcfun ("nk_init_default" nk-init-default) :int
  (arg0 :pointer)
  (arg1 :pointer)
)

(cffi:defcfun ("nk_init_fixed" nk-init-fixed) :int
  (arg0 :pointer)
  (memory :pointer)
  (size :unsigned-long)
  (arg3 :pointer)
)

(cffi:defcfun ("nk_init" nk-init) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)

(cffi:defcfun ("nk_init_custom" nk-init-custom) :int
  (arg0 :pointer)
  (cmds :pointer)
  (pool :pointer)
  (arg3 :pointer)
)

(cffi:defcfun ("nk_clear" nk-clear) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_free" nk-free) :void
  (arg0 :pointer)
)

; [SHIM] nk_set_user_data — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_set_user_data" nk-set-user-data) :void
  (arg0 :pointer)
  (handle :pointer)
)

(cffi:defcfun ("nk_input_begin" nk-input-begin) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_input_motion" nk-input-motion) :void
  (arg0 :pointer)
  (x :int)
  (y :int)
)

(cffi:defcfun ("nk_input_key" nk-input-key) :void
  (arg0 :pointer)
  (arg1 nk-keys)
  (down :int)
)

(cffi:defcfun ("nk_input_button" nk-input-button) :void
  (arg0 :pointer)
  (arg1 nk-buttons)
  (x :int)
  (y :int)
  (down :int)
)

; [SHIM] nk_input_scroll — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_input_scroll" nk-input-scroll) :void
  (arg0 :pointer)
  (val :pointer)
)

(cffi:defcfun ("nk_input_char" nk-input-char) :void
  (arg0 :pointer)
  (arg1 :char)
)

(cffi:defcfun ("nk_input_glyph" nk-input-glyph) :void
  (arg0 :pointer)
  (arg1 (:array :char 4))
)

(cffi:defcfun ("nk_input_unicode" nk-input-unicode) :void
  (arg0 :pointer)
  (arg1 :unsigned-int)
)

(cffi:defcfun ("nk_input_end" nk-input-end) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk__begin" nk--begin) :pointer
  (arg0 :pointer)
)

(cffi:defcfun ("nk__next" nk--next) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
)

(cffi:defcfun ("nk_convert" nk-convert) :unsigned-int
  (arg0 :pointer)
  (cmds :pointer)
  (vertices :pointer)
  (elements :pointer)
  (arg4 :pointer)
)

(cffi:defcfun ("nk__draw_begin" nk--draw-begin) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
)

(cffi:defcfun ("nk__draw_end" nk--draw-end) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
)

(cffi:defcfun ("nk__draw_next" nk--draw-next) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)

; [SHIM] nk_begin — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_begin" nk-begin) :int
  (ctx :pointer)
  (title :pointer)
  (bounds :pointer)
  (flags :unsigned-int)
)

; [SHIM] nk_begin_titled — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_begin_titled" nk-begin-titled) :int
  (ctx :pointer)
  (name :pointer)
  (title :pointer)
  (bounds :pointer)
  (flags :unsigned-int)
)

(cffi:defcfun ("nk_end" nk-end) :void
  (ctx :pointer)
)

(cffi:defcfun ("nk_window_find" nk-window-find) :pointer
  (ctx :pointer)
  (name :pointer)
)

; [SHIM] nk_window_get_bounds — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_window_get_bounds" nk-window-get-bounds) :void
  (ctx :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_window_get_position — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_window_get_position" nk-window-get-position) :void
  (ctx :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_window_get_size — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_window_get_size" nk-window-get-size) :void
  (ctx :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

(cffi:defcfun ("nk_window_get_width" nk-window-get-width) :float
  (ctx :pointer)
)

(cffi:defcfun ("nk_window_get_height" nk-window-get-height) :float
  (ctx :pointer)
)

(cffi:defcfun ("nk_window_get_panel" nk-window-get-panel) :pointer
  (ctx :pointer)
)

; [SHIM] nk_window_get_content_region — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_window_get_content_region" nk-window-get-content-region) :void
  (ctx :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_window_get_content_region_min — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_window_get_content_region_min" nk-window-get-content-region-min) :void
  (ctx :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_window_get_content_region_max — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_window_get_content_region_max" nk-window-get-content-region-max) :void
  (ctx :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_window_get_content_region_size — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_window_get_content_region_size" nk-window-get-content-region-size) :void
  (ctx :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

(cffi:defcfun ("nk_window_get_canvas" nk-window-get-canvas) :pointer
  (ctx :pointer)
)

(cffi:defcfun ("nk_window_get_scroll" nk-window-get-scroll) :void
  (ctx :pointer)
  (offset-x :pointer)
  (offset-y :pointer)
)

(cffi:defcfun ("nk_window_has_focus" nk-window-has-focus) :int
  (ctx :pointer)
)

(cffi:defcfun ("nk_window_is_hovered" nk-window-is-hovered) :int
  (ctx :pointer)
)

(cffi:defcfun ("nk_window_is_collapsed" nk-window-is-collapsed) :int
  (ctx :pointer)
  (name :pointer)
)

(cffi:defcfun ("nk_window_is_closed" nk-window-is-closed) :int
  (ctx :pointer)
  (name :pointer)
)

(cffi:defcfun ("nk_window_is_hidden" nk-window-is-hidden) :int
  (ctx :pointer)
  (name :pointer)
)

(cffi:defcfun ("nk_window_is_active" nk-window-is-active) :int
  (ctx :pointer)
  (name :pointer)
)

(cffi:defcfun ("nk_window_is_any_hovered" nk-window-is-any-hovered) :int
  (ctx :pointer)
)

(cffi:defcfun ("nk_item_is_any_active" nk-item-is-any-active) :int
  (ctx :pointer)
)

; [SHIM] nk_window_set_bounds — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_window_set_bounds" nk-window-set-bounds) :void
  (ctx :pointer)
  (name :pointer)
  (bounds :pointer)
)

; [SHIM] nk_window_set_position — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_window_set_position" nk-window-set-position) :void
  (ctx :pointer)
  (name :pointer)
  (pos :pointer)
)

; [SHIM] nk_window_set_size — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_window_set_size" nk-window-set-size) :void
  (ctx :pointer)
  (name :pointer)
  (size :pointer)
)

(cffi:defcfun ("nk_window_set_focus" nk-window-set-focus) :void
  (ctx :pointer)
  (name :pointer)
)

(cffi:defcfun ("nk_window_set_scroll" nk-window-set-scroll) :void
  (ctx :pointer)
  (offset-x :unsigned-int)
  (offset-y :unsigned-int)
)

(cffi:defcfun ("nk_window_close" nk-window-close) :void
  (ctx :pointer)
  (name :pointer)
)

(cffi:defcfun ("nk_window_collapse" nk-window-collapse) :void
  (ctx :pointer)
  (name :pointer)
  (state nk-collapse-states)
)

(cffi:defcfun ("nk_window_collapse_if" nk-window-collapse-if) :void
  (ctx :pointer)
  (name :pointer)
  (state nk-collapse-states)
  (cond :int)
)

(cffi:defcfun ("nk_window_show" nk-window-show) :void
  (ctx :pointer)
  (name :pointer)
  (state nk-show-states)
)

(cffi:defcfun ("nk_window_show_if" nk-window-show-if) :void
  (ctx :pointer)
  (name :pointer)
  (state nk-show-states)
  (cond :int)
)

; [SHIM] nk_rule_horizontal — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rule_horizontal" nk-rule-horizontal) :void
  (ctx :pointer)
  (color :pointer)
  (rounding :int)
)

(cffi:defcfun ("nk_layout_set_min_row_height" nk-layout-set-min-row-height) :void
  (arg0 :pointer)
  (height :float)
)

(cffi:defcfun ("nk_layout_reset_min_row_height" nk-layout-reset-min-row-height) :void
  (arg0 :pointer)
)

; [SHIM] nk_layout_widget_bounds — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_layout_widget_bounds" nk-layout-widget-bounds) :void
  (ctx :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

(cffi:defcfun ("nk_layout_ratio_from_pixel" nk-layout-ratio-from-pixel) :float
  (ctx :pointer)
  (pixel-width :float)
)

(cffi:defcfun ("nk_layout_row_dynamic" nk-layout-row-dynamic) :void
  (ctx :pointer)
  (height :float)
  (cols :int)
)

(cffi:defcfun ("nk_layout_row_static" nk-layout-row-static) :void
  (ctx :pointer)
  (height :float)
  (item-width :int)
  (cols :int)
)

(cffi:defcfun ("nk_layout_row_begin" nk-layout-row-begin) :void
  (ctx :pointer)
  (fmt nk-layout-format)
  (row-height :float)
  (cols :int)
)

(cffi:defcfun ("nk_layout_row_push" nk-layout-row-push) :void
  (arg0 :pointer)
  (value :float)
)

(cffi:defcfun ("nk_layout_row_end" nk-layout-row-end) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_layout_row" nk-layout-row) :void
  (arg0 :pointer)
  (arg1 nk-layout-format)
  (height :float)
  (cols :int)
  (ratio :pointer)
)

(cffi:defcfun ("nk_layout_row_template_begin" nk-layout-row-template-begin) :void
  (arg0 :pointer)
  (row-height :float)
)

(cffi:defcfun ("nk_layout_row_template_push_dynamic" nk-layout-row-template-push-dynamic) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_layout_row_template_push_variable" nk-layout-row-template-push-variable) :void
  (arg0 :pointer)
  (min-width :float)
)

(cffi:defcfun ("nk_layout_row_template_push_static" nk-layout-row-template-push-static) :void
  (arg0 :pointer)
  (width :float)
)

(cffi:defcfun ("nk_layout_row_template_end" nk-layout-row-template-end) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_layout_space_begin" nk-layout-space-begin) :void
  (arg0 :pointer)
  (arg1 nk-layout-format)
  (height :float)
  (widget-count :int)
)

; [SHIM] nk_layout_space_push — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_layout_space_push" nk-layout-space-push) :void
  (arg0 :pointer)
  (bounds :pointer)
)

(cffi:defcfun ("nk_layout_space_end" nk-layout-space-end) :void
  (arg0 :pointer)
)

; [SHIM] nk_layout_space_bounds — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_layout_space_bounds" nk-layout-space-bounds) :void
  (ctx :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_layout_space_to_screen — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_layout_space_to_screen" nk-layout-space-to-screen) :void
  (ctx :pointer)
  (vec :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_layout_space_to_local — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_layout_space_to_local" nk-layout-space-to-local) :void
  (ctx :pointer)
  (vec :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_layout_space_rect_to_screen — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_layout_space_rect_to_screen" nk-layout-space-rect-to-screen) :void
  (ctx :pointer)
  (bounds :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_layout_space_rect_to_local — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_layout_space_rect_to_local" nk-layout-space-rect-to-local) :void
  (ctx :pointer)
  (bounds :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

(cffi:defcfun ("nk_spacer" nk-spacer) :void
  (ctx :pointer)
)

(cffi:defcfun ("nk_group_begin" nk-group-begin) :int
  (arg0 :pointer)
  (title :pointer)
  (arg2 :unsigned-int)
)

(cffi:defcfun ("nk_group_begin_titled" nk-group-begin-titled) :int
  (arg0 :pointer)
  (name :pointer)
  (title :pointer)
  (arg3 :unsigned-int)
)

(cffi:defcfun ("nk_group_end" nk-group-end) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_group_scrolled_offset_begin" nk-group-scrolled-offset-begin) :int
  (arg0 :pointer)
  (x-offset :pointer)
  (y-offset :pointer)
  (title :pointer)
  (flags :unsigned-int)
)

(cffi:defcfun ("nk_group_scrolled_begin" nk-group-scrolled-begin) :int
  (arg0 :pointer)
  (off :pointer)
  (title :pointer)
  (arg3 :unsigned-int)
)

(cffi:defcfun ("nk_group_scrolled_end" nk-group-scrolled-end) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_group_get_scroll" nk-group-get-scroll) :void
  (arg0 :pointer)
  (id :pointer)
  (x-offset :pointer)
  (y-offset :pointer)
)

(cffi:defcfun ("nk_group_set_scroll" nk-group-set-scroll) :void
  (arg0 :pointer)
  (id :pointer)
  (x-offset :unsigned-int)
  (y-offset :unsigned-int)
)

(cffi:defcfun ("nk_tree_push_hashed" nk-tree-push-hashed) :int
  (arg0 :pointer)
  (arg1 nk-tree-type)
  (title :pointer)
  (initial-state nk-collapse-states)
  (hash :pointer)
  (len :int)
  (seed :int)
)

; [SHIM] nk_tree_image_push_hashed — struct-by-value args/return replaced with pointers
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

(cffi:defcfun ("nk_tree_pop" nk-tree-pop) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_tree_state_push" nk-tree-state-push) :int
  (arg0 :pointer)
  (arg1 nk-tree-type)
  (title :pointer)
  (state :pointer)
)

; [SHIM] nk_tree_state_image_push — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_tree_state_image_push" nk-tree-state-image-push) :int
  (arg0 :pointer)
  (arg1 nk-tree-type)
  (arg2 :pointer)
  (title :pointer)
  (state :pointer)
)

(cffi:defcfun ("nk_tree_state_pop" nk-tree-state-pop) :void
  (arg0 :pointer)
)

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

; [SHIM] nk_tree_element_image_push_hashed — struct-by-value args/return replaced with pointers
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

(cffi:defcfun ("nk_tree_element_pop" nk-tree-element-pop) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_list_view_begin" nk-list-view-begin) :int
  (arg0 :pointer)
  (out :pointer)
  (id :pointer)
  (arg3 :unsigned-int)
  (row-height :int)
  (row-count :int)
)

(cffi:defcfun ("nk_list_view_end" nk-list-view-end) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_widget" nk-widget) nk-widget-layout-states
  (arg0 :pointer)
  (arg1 :pointer)
)

; [SHIM] nk_widget_bounds — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_widget_bounds" nk-widget-bounds) :void
  (arg0 :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_widget_position — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_widget_position" nk-widget-position) :void
  (arg0 :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_widget_size — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_widget_size" nk-widget-size) :void
  (arg0 :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

(cffi:defcfun ("nk_widget_width" nk-widget-width) :float
  (arg0 :pointer)
)

(cffi:defcfun ("nk_widget_height" nk-widget-height) :float
  (arg0 :pointer)
)

(cffi:defcfun ("nk_widget_is_hovered" nk-widget-is-hovered) :int
  (arg0 :pointer)
)

(cffi:defcfun ("nk_widget_is_mouse_clicked" nk-widget-is-mouse-clicked) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
)

(cffi:defcfun ("nk_widget_has_mouse_click_down" nk-widget-has-mouse-click-down) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
  (down :int)
)

(cffi:defcfun ("nk_spacing" nk-spacing) :void
  (arg0 :pointer)
  (cols :int)
)

(cffi:defcfun ("nk_widget_disable_begin" nk-widget-disable-begin) :void
  (ctx :pointer)
)

(cffi:defcfun ("nk_widget_disable_end" nk-widget-disable-end) :void
  (ctx :pointer)
)

(cffi:defcfun ("nk_text" nk-text) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :unsigned-int)
)

; [SHIM] nk_text_colored — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_text_colored" nk-text-colored) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :unsigned-int)
  (arg4 :pointer)
)

(cffi:defcfun ("nk_text_wrap" nk-text-wrap) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
)

; [SHIM] nk_text_wrap_colored — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_text_wrap_colored" nk-text-wrap-colored) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :pointer)
)

(cffi:defcfun ("nk_label" nk-label) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (align :unsigned-int)
)

; [SHIM] nk_label_colored — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_label_colored" nk-label-colored) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (align :unsigned-int)
  (arg3 :pointer)
)

(cffi:defcfun ("nk_label_wrap" nk-label-wrap) :void
  (arg0 :pointer)
  (arg1 :pointer)
)

; [SHIM] nk_label_colored_wrap — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_label_colored_wrap" nk-label-colored-wrap) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)

; [SHIM] nk_image — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_image" nk-image) :void
  (arg0 :pointer)
  (arg1 :pointer)
)

; [SHIM] nk_image_color — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_image_color" nk-image-color) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)

; nk_labelf — variadic, skipped (wrap manually if needed)

; nk_labelf_colored — variadic, skipped (wrap manually if needed)

; nk_labelf_wrap — variadic, skipped (wrap manually if needed)

; nk_labelf_colored_wrap — variadic, skipped (wrap manually if needed)

(cffi:defcfun ("nk_labelfv" nk-labelfv) :void
  (arg0 :pointer)
  (arg1 :unsigned-int)
  (arg2 :pointer)
  (arg3 :pointer)
)

; [SHIM] nk_labelfv_colored — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_labelfv_colored" nk-labelfv-colored) :void
  (arg0 :pointer)
  (arg1 :unsigned-int)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer)
)

(cffi:defcfun ("nk_labelfv_wrap" nk-labelfv-wrap) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)

; [SHIM] nk_labelfv_colored_wrap — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_labelfv_colored_wrap" nk-labelfv-colored-wrap) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
)

(cffi:defcfun ("nk_value_bool" nk-value-bool) :void
  (arg0 :pointer)
  (prefix :pointer)
  (arg2 :int)
)

(cffi:defcfun ("nk_value_int" nk-value-int) :void
  (arg0 :pointer)
  (prefix :pointer)
  (arg2 :int)
)

(cffi:defcfun ("nk_value_uint" nk-value-uint) :void
  (arg0 :pointer)
  (prefix :pointer)
  (arg2 :unsigned-int)
)

(cffi:defcfun ("nk_value_float" nk-value-float) :void
  (arg0 :pointer)
  (prefix :pointer)
  (arg2 :float)
)

; [SHIM] nk_value_color_byte — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_value_color_byte" nk-value-color-byte) :void
  (arg0 :pointer)
  (prefix :pointer)
  (arg2 :pointer)
)

; [SHIM] nk_value_color_float — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_value_color_float" nk-value-color-float) :void
  (arg0 :pointer)
  (prefix :pointer)
  (arg2 :pointer)
)

; [SHIM] nk_value_color_hex — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_value_color_hex" nk-value-color-hex) :void
  (arg0 :pointer)
  (prefix :pointer)
  (arg2 :pointer)
)

(cffi:defcfun ("nk_button_text" nk-button-text) :int
  (arg0 :pointer)
  (title :pointer)
  (len :int)
)

(cffi:defcfun ("nk_button_label" nk-button-label) :int
  (arg0 :pointer)
  (title :pointer)
)

; [SHIM] nk_button_color — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_button_color" nk-button-color) :int
  (arg0 :pointer)
  (arg1 :pointer)
)

(cffi:defcfun ("nk_button_symbol" nk-button-symbol) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
)

; [SHIM] nk_button_image — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_button_image" nk-button-image) :int
  (arg0 :pointer)
  (img :pointer)
)

(cffi:defcfun ("nk_button_symbol_label" nk-button-symbol-label) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (text-alignment :unsigned-int)
)

(cffi:defcfun ("nk_button_symbol_text" nk-button-symbol-text) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (arg3 :int)
  (alignment :unsigned-int)
)

; [SHIM] nk_button_image_label — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_button_image_label" nk-button-image-label) :int
  (arg0 :pointer)
  (img :pointer)
  (arg2 :pointer)
  (text-alignment :unsigned-int)
)

; [SHIM] nk_button_image_text — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_button_image_text" nk-button-image-text) :int
  (arg0 :pointer)
  (img :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (alignment :unsigned-int)
)

(cffi:defcfun ("nk_button_text_styled" nk-button-text-styled) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (title :pointer)
  (len :int)
)

(cffi:defcfun ("nk_button_label_styled" nk-button-label-styled) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (title :pointer)
)

(cffi:defcfun ("nk_button_symbol_styled" nk-button-symbol-styled) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 nk-symbol-type)
)

; [SHIM] nk_button_image_styled — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_button_image_styled" nk-button-image-styled) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (img :pointer)
)

(cffi:defcfun ("nk_button_symbol_text_styled" nk-button-symbol-text-styled) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 nk-symbol-type)
  (arg3 :pointer)
  (arg4 :int)
  (alignment :unsigned-int)
)

(cffi:defcfun ("nk_button_symbol_label_styled" nk-button-symbol-label-styled) :int
  (ctx :pointer)
  (style :pointer)
  (symbol nk-symbol-type)
  (title :pointer)
  (align :unsigned-int)
)

; [SHIM] nk_button_image_label_styled — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_button_image_label_styled" nk-button-image-label-styled) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (img :pointer)
  (arg3 :pointer)
  (text-alignment :unsigned-int)
)

; [SHIM] nk_button_image_text_styled — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_button_image_text_styled" nk-button-image-text-styled) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (img :pointer)
  (arg3 :pointer)
  (arg4 :int)
  (alignment :unsigned-int)
)

(cffi:defcfun ("nk_button_set_behavior" nk-button-set-behavior) :void
  (arg0 :pointer)
  (arg1 nk-button-behavior)
)

(cffi:defcfun ("nk_button_push_behavior" nk-button-push-behavior) :int
  (arg0 :pointer)
  (arg1 nk-button-behavior)
)

(cffi:defcfun ("nk_button_pop_behavior" nk-button-pop-behavior) :int
  (arg0 :pointer)
)

(cffi:defcfun ("nk_check_label" nk-check-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (active :int)
)

(cffi:defcfun ("nk_check_text" nk-check-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (active :int)
)

(cffi:defcfun ("nk_check_text_align" nk-check-text-align) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (active :int)
  (widget-alignment :unsigned-int)
  (text-alignment :unsigned-int)
)

(cffi:defcfun ("nk_check_flags_label" nk-check-flags-label) :unsigned-int
  (arg0 :pointer)
  (arg1 :pointer)
  (flags :unsigned-int)
  (value :unsigned-int)
)

(cffi:defcfun ("nk_check_flags_text" nk-check-flags-text) :unsigned-int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (flags :unsigned-int)
  (value :unsigned-int)
)

(cffi:defcfun ("nk_checkbox_label" nk-checkbox-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (active :pointer)
)

(cffi:defcfun ("nk_checkbox_label_align" nk-checkbox-label-align) :int
  (ctx :pointer)
  (label :pointer)
  (active :pointer)
  (widget-alignment :unsigned-int)
  (text-alignment :unsigned-int)
)

(cffi:defcfun ("nk_checkbox_text" nk-checkbox-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (active :pointer)
)

(cffi:defcfun ("nk_checkbox_text_align" nk-checkbox-text-align) :int
  (ctx :pointer)
  (text :pointer)
  (len :int)
  (active :pointer)
  (widget-alignment :unsigned-int)
  (text-alignment :unsigned-int)
)

(cffi:defcfun ("nk_checkbox_flags_label" nk-checkbox-flags-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (flags :pointer)
  (value :unsigned-int)
)

(cffi:defcfun ("nk_checkbox_flags_text" nk-checkbox-flags-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (flags :pointer)
  (value :unsigned-int)
)

(cffi:defcfun ("nk_radio_label" nk-radio-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (active :pointer)
)

(cffi:defcfun ("nk_radio_label_align" nk-radio-label-align) :int
  (ctx :pointer)
  (label :pointer)
  (active :pointer)
  (widget-alignment :unsigned-int)
  (text-alignment :unsigned-int)
)

(cffi:defcfun ("nk_radio_text" nk-radio-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (active :pointer)
)

(cffi:defcfun ("nk_radio_text_align" nk-radio-text-align) :int
  (ctx :pointer)
  (text :pointer)
  (len :int)
  (active :pointer)
  (widget-alignment :unsigned-int)
  (text-alignment :unsigned-int)
)

(cffi:defcfun ("nk_option_label" nk-option-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (active :int)
)

(cffi:defcfun ("nk_option_label_align" nk-option-label-align) :int
  (ctx :pointer)
  (label :pointer)
  (active :int)
  (widget-alignment :unsigned-int)
  (text-alignment :unsigned-int)
)

(cffi:defcfun ("nk_option_text" nk-option-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (active :int)
)

(cffi:defcfun ("nk_option_text_align" nk-option-text-align) :int
  (ctx :pointer)
  (text :pointer)
  (len :int)
  (is-active :int)
  (widget-alignment :unsigned-int)
  (text-alignment :unsigned-int)
)

(cffi:defcfun ("nk_selectable_label" nk-selectable-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (align :unsigned-int)
  (value :pointer)
)

(cffi:defcfun ("nk_selectable_text" nk-selectable-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (align :unsigned-int)
  (value :pointer)
)

; [SHIM] nk_selectable_image_label — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_selectable_image_label" nk-selectable-image-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (align :unsigned-int)
  (value :pointer)
)

; [SHIM] nk_selectable_image_text — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_selectable_image_text" nk-selectable-image-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (align :unsigned-int)
  (value :pointer)
)

(cffi:defcfun ("nk_selectable_symbol_label" nk-selectable-symbol-label) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (align :unsigned-int)
  (value :pointer)
)

(cffi:defcfun ("nk_selectable_symbol_text" nk-selectable-symbol-text) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (arg3 :int)
  (align :unsigned-int)
  (value :pointer)
)

(cffi:defcfun ("nk_select_label" nk-select-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (align :unsigned-int)
  (value :int)
)

(cffi:defcfun ("nk_select_text" nk-select-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (align :unsigned-int)
  (value :int)
)

; [SHIM] nk_select_image_label — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_select_image_label" nk-select-image-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (align :unsigned-int)
  (value :int)
)

; [SHIM] nk_select_image_text — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_select_image_text" nk-select-image-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (align :unsigned-int)
  (value :int)
)

(cffi:defcfun ("nk_select_symbol_label" nk-select-symbol-label) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (align :unsigned-int)
  (value :int)
)

(cffi:defcfun ("nk_select_symbol_text" nk-select-symbol-text) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (arg3 :int)
  (align :unsigned-int)
  (value :int)
)

(cffi:defcfun ("nk_slide_float" nk-slide-float) :float
  (arg0 :pointer)
  (min :float)
  (val :float)
  (max :float)
  (step :float)
)

(cffi:defcfun ("nk_slide_int" nk-slide-int) :int
  (arg0 :pointer)
  (min :int)
  (val :int)
  (max :int)
  (step :int)
)

(cffi:defcfun ("nk_slider_float" nk-slider-float) :int
  (arg0 :pointer)
  (min :float)
  (val :pointer)
  (max :float)
  (step :float)
)

(cffi:defcfun ("nk_slider_int" nk-slider-int) :int
  (arg0 :pointer)
  (min :int)
  (val :pointer)
  (max :int)
  (step :int)
)

(cffi:defcfun ("nk_knob_float" nk-knob-float) :int
  (arg0 :pointer)
  (min :float)
  (val :pointer)
  (max :float)
  (step :float)
  (zero-direction nk-heading)
  (dead-zone-degrees :float)
)

(cffi:defcfun ("nk_knob_int" nk-knob-int) :int
  (arg0 :pointer)
  (min :int)
  (val :pointer)
  (max :int)
  (step :int)
  (zero-direction nk-heading)
  (dead-zone-degrees :float)
)

(cffi:defcfun ("nk_progress" nk-progress) :int
  (arg0 :pointer)
  (cur :pointer)
  (max :unsigned-long)
  (modifyable :int)
)

(cffi:defcfun ("nk_prog" nk-prog) :unsigned-long
  (arg0 :pointer)
  (cur :unsigned-long)
  (max :unsigned-long)
  (modifyable :int)
)

; [SHIM] nk_color_picker — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_color_picker" nk-color-picker) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 nk-color-format)
  (result-out :pointer)  ; caller allocates; filled with return value
)

(cffi:defcfun ("nk_color_pick" nk-color-pick) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 nk-color-format)
)

(cffi:defcfun ("nk_property_int" nk-property-int) :int
  (arg0 :pointer)
  (name :pointer)
  (min :int)
  (val :pointer)
  (max :int)
  (step :int)
  (inc-per-pixel :float)
)

(cffi:defcfun ("nk_property_float" nk-property-float) :int
  (arg0 :pointer)
  (name :pointer)
  (min :float)
  (val :pointer)
  (max :float)
  (step :float)
  (inc-per-pixel :float)
)

(cffi:defcfun ("nk_property_double" nk-property-double) :int
  (arg0 :pointer)
  (name :pointer)
  (min :double)
  (val :pointer)
  (max :double)
  (step :double)
  (inc-per-pixel :float)
)

(cffi:defcfun ("nk_propertyi" nk-propertyi) :int
  (arg0 :pointer)
  (name :pointer)
  (min :int)
  (val :int)
  (max :int)
  (step :int)
  (inc-per-pixel :float)
)

(cffi:defcfun ("nk_propertyf" nk-propertyf) :float
  (arg0 :pointer)
  (name :pointer)
  (min :float)
  (val :float)
  (max :float)
  (step :float)
  (inc-per-pixel :float)
)

(cffi:defcfun ("nk_propertyd" nk-propertyd) :double
  (arg0 :pointer)
  (name :pointer)
  (min :double)
  (val :double)
  (max :double)
  (step :double)
  (inc-per-pixel :float)
)

(cffi:defcfun ("nk_edit_string" nk-edit-string) :unsigned-int
  (arg0 :pointer)
  (arg1 :unsigned-int)
  (buffer :pointer)
  (len :pointer)
  (max :int)
  (arg5 :pointer)
)

(cffi:defcfun ("nk_edit_string_zero_terminated" nk-edit-string-zero-terminated) :unsigned-int
  (arg0 :pointer)
  (arg1 :unsigned-int)
  (buffer :pointer)
  (max :int)
  (arg4 :pointer)
)

(cffi:defcfun ("nk_edit_buffer" nk-edit-buffer) :unsigned-int
  (arg0 :pointer)
  (arg1 :unsigned-int)
  (arg2 :pointer)
  (arg3 :pointer)
)

(cffi:defcfun ("nk_edit_focus" nk-edit-focus) :void
  (arg0 :pointer)
  (flags :unsigned-int)
)

(cffi:defcfun ("nk_edit_unfocus" nk-edit-unfocus) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_chart_begin" nk-chart-begin) :int
  (arg0 :pointer)
  (arg1 nk-chart-type)
  (num :int)
  (min :float)
  (max :float)
)

; [SHIM] nk_chart_begin_colored — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_chart_begin_colored" nk-chart-begin-colored) :int
  (arg0 :pointer)
  (arg1 nk-chart-type)
  (arg2 :pointer)
  (active :pointer)
  (num :int)
  (min :float)
  (max :float)
)

(cffi:defcfun ("nk_chart_add_slot" nk-chart-add-slot) :void
  (ctx :pointer)
  (arg1 nk-chart-type)
  (count :int)
  (min-value :float)
  (max-value :float)
)

; [SHIM] nk_chart_add_slot_colored — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_chart_add_slot_colored" nk-chart-add-slot-colored) :void
  (ctx :pointer)
  (arg1 nk-chart-type)
  (arg2 :pointer)
  (active :pointer)
  (count :int)
  (min-value :float)
  (max-value :float)
)

(cffi:defcfun ("nk_chart_push" nk-chart-push) :unsigned-int
  (arg0 :pointer)
  (arg1 :float)
)

(cffi:defcfun ("nk_chart_push_slot" nk-chart-push-slot) :unsigned-int
  (arg0 :pointer)
  (arg1 :float)
  (arg2 :int)
)

(cffi:defcfun ("nk_chart_end" nk-chart-end) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_plot" nk-plot) :void
  (arg0 :pointer)
  (arg1 nk-chart-type)
  (values :pointer)
  (count :int)
  (offset :int)
)

(cffi:defcfun ("nk_plot_function" nk-plot-function) :void
  (arg0 :pointer)
  (arg1 nk-chart-type)
  (userdata :pointer)
  (value-getter :pointer)
  (count :int)
  (offset :int)
)

; [SHIM] nk_popup_begin — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_popup_begin" nk-popup-begin) :int
  (arg0 :pointer)
  (arg1 nk-popup-type)
  (arg2 :pointer)
  (arg3 :unsigned-int)
  (bounds :pointer)
)

(cffi:defcfun ("nk_popup_close" nk-popup-close) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_popup_end" nk-popup-end) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_popup_get_scroll" nk-popup-get-scroll) :void
  (arg0 :pointer)
  (offset-x :pointer)
  (offset-y :pointer)
)

(cffi:defcfun ("nk_popup_set_scroll" nk-popup-set-scroll) :void
  (arg0 :pointer)
  (offset-x :unsigned-int)
  (offset-y :unsigned-int)
)

; [SHIM] nk_combo — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_combo" nk-combo) :int
  (arg0 :pointer)
  (items :pointer)
  (count :int)
  (selected :int)
  (item-height :int)
  (size :pointer)
)

; [SHIM] nk_combo_separator — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_combo_separator" nk-combo-separator) :int
  (arg0 :pointer)
  (items-separated-by-separator :pointer)
  (separator :int)
  (selected :int)
  (count :int)
  (item-height :int)
  (size :pointer)
)

; [SHIM] nk_combo_string — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_combo_string" nk-combo-string) :int
  (arg0 :pointer)
  (items-separated-by-zeros :pointer)
  (selected :int)
  (count :int)
  (item-height :int)
  (size :pointer)
)

; [SHIM] nk_combo_callback — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_combo_callback" nk-combo-callback) :int
  (arg0 :pointer)
  (item-getter :pointer)
  (userdata :pointer)
  (selected :int)
  (count :int)
  (item-height :int)
  (size :pointer)
)

; [SHIM] nk_combobox — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_combobox" nk-combobox) :int
  (arg0 :pointer)
  (items :pointer)
  (count :int)
  (selected :pointer)
  (item-height :int)
  (size :pointer)
)

; [SHIM] nk_combobox_string — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_combobox_string" nk-combobox-string) :int
  (arg0 :pointer)
  (items-separated-by-zeros :pointer)
  (selected :pointer)
  (count :int)
  (item-height :int)
  (size :pointer)
)

; [SHIM] nk_combobox_separator — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_combobox_separator" nk-combobox-separator) :int
  (arg0 :pointer)
  (items-separated-by-separator :pointer)
  (separator :int)
  (selected :pointer)
  (count :int)
  (item-height :int)
  (size :pointer)
)

; [SHIM] nk_combobox_callback — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_combobox_callback" nk-combobox-callback) :int
  (arg0 :pointer)
  (item-getter :pointer)
  (arg2 :pointer)
  (selected :pointer)
  (count :int)
  (item-height :int)
  (size :pointer)
)

; [SHIM] nk_combo_begin_text — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_combo_begin_text" nk-combo-begin-text) :int
  (arg0 :pointer)
  (selected :pointer)
  (arg2 :int)
  (size :pointer)
)

; [SHIM] nk_combo_begin_label — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_combo_begin_label" nk-combo-begin-label) :int
  (arg0 :pointer)
  (selected :pointer)
  (size :pointer)
)

; [SHIM] nk_combo_begin_color — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_combo_begin_color" nk-combo-begin-color) :int
  (arg0 :pointer)
  (color :pointer)
  (size :pointer)
)

; [SHIM] nk_combo_begin_symbol — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_combo_begin_symbol" nk-combo-begin-symbol) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (size :pointer)
)

; [SHIM] nk_combo_begin_symbol_label — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_combo_begin_symbol_label" nk-combo-begin-symbol-label) :int
  (arg0 :pointer)
  (selected :pointer)
  (arg2 nk-symbol-type)
  (size :pointer)
)

; [SHIM] nk_combo_begin_symbol_text — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_combo_begin_symbol_text" nk-combo-begin-symbol-text) :int
  (arg0 :pointer)
  (selected :pointer)
  (arg2 :int)
  (arg3 nk-symbol-type)
  (size :pointer)
)

; [SHIM] nk_combo_begin_image — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_combo_begin_image" nk-combo-begin-image) :int
  (arg0 :pointer)
  (img :pointer)
  (size :pointer)
)

; [SHIM] nk_combo_begin_image_label — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_combo_begin_image_label" nk-combo-begin-image-label) :int
  (arg0 :pointer)
  (selected :pointer)
  (arg2 :pointer)
  (size :pointer)
)

; [SHIM] nk_combo_begin_image_text — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_combo_begin_image_text" nk-combo-begin-image-text) :int
  (arg0 :pointer)
  (selected :pointer)
  (arg2 :int)
  (arg3 :pointer)
  (size :pointer)
)

(cffi:defcfun ("nk_combo_item_label" nk-combo-item-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (alignment :unsigned-int)
)

(cffi:defcfun ("nk_combo_item_text" nk-combo-item-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (alignment :unsigned-int)
)

; [SHIM] nk_combo_item_image_label — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_combo_item_image_label" nk-combo-item-image-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (alignment :unsigned-int)
)

; [SHIM] nk_combo_item_image_text — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_combo_item_image_text" nk-combo-item-image-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (alignment :unsigned-int)
)

(cffi:defcfun ("nk_combo_item_symbol_label" nk-combo-item-symbol-label) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (alignment :unsigned-int)
)

(cffi:defcfun ("nk_combo_item_symbol_text" nk-combo-item-symbol-text) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (arg3 :int)
  (alignment :unsigned-int)
)

(cffi:defcfun ("nk_combo_close" nk-combo-close) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_combo_end" nk-combo-end) :void
  (arg0 :pointer)
)

; [SHIM] nk_contextual_begin — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_contextual_begin" nk-contextual-begin) :int
  (arg0 :pointer)
  (arg1 :unsigned-int)
  (arg2 :pointer)
  (trigger-bounds :pointer)
)

(cffi:defcfun ("nk_contextual_item_text" nk-contextual-item-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (align :unsigned-int)
)

(cffi:defcfun ("nk_contextual_item_label" nk-contextual-item-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (align :unsigned-int)
)

; [SHIM] nk_contextual_item_image_label — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_contextual_item_image_label" nk-contextual-item-image-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (alignment :unsigned-int)
)

; [SHIM] nk_contextual_item_image_text — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_contextual_item_image_text" nk-contextual-item-image-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (len :int)
  (alignment :unsigned-int)
)

(cffi:defcfun ("nk_contextual_item_symbol_label" nk-contextual-item-symbol-label) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (alignment :unsigned-int)
)

(cffi:defcfun ("nk_contextual_item_symbol_text" nk-contextual-item-symbol-text) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (arg3 :int)
  (alignment :unsigned-int)
)

(cffi:defcfun ("nk_contextual_close" nk-contextual-close) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_contextual_end" nk-contextual-end) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_tooltip" nk-tooltip) :void
  (arg0 :pointer)
  (arg1 :pointer)
)

; [SHIM] nk_tooltip_offset — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_tooltip_offset" nk-tooltip-offset) :void
  (ctx :pointer)
  (text :pointer)
  (position nk-tooltip-pos)
  (offset :pointer)
)

; [SHIM] nk_do_tooltip — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_do_tooltip" nk-do-tooltip) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)

; [SHIM] nk_do_tooltip_delay — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_do_tooltip_delay" nk-do-tooltip-delay) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
)

; [SHIM] nk_do_tooltip_delay_clicked — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_do_tooltip_delay_clicked" nk-do-tooltip-delay-clicked) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (timer :pointer)
  (arg4 :pointer)
)

; nk_tooltipf — variadic, skipped (wrap manually if needed)

(cffi:defcfun ("nk_tooltipfv" nk-tooltipfv) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)

; nk_tooltipf_offset — variadic, skipped (wrap manually if needed)

; [SHIM] nk_tooltipfv_offset — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_tooltipfv_offset" nk-tooltipfv-offset) :void
  (arg0 :pointer)
  (arg1 nk-tooltip-pos)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer)
)

(cffi:defcfun ("nk_tooltip_begin" nk-tooltip-begin) :int
  (arg0 :pointer)
  (width :float)
)

; [SHIM] nk_tooltip_begin_offset — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_tooltip_begin_offset" nk-tooltip-begin-offset) :int
  (arg0 :pointer)
  (arg1 :float)
  (arg2 nk-tooltip-pos)
  (arg3 :pointer)
)

(cffi:defcfun ("nk_tooltip_end" nk-tooltip-end) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_menubar_begin" nk-menubar-begin) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_menubar_end" nk-menubar-end) :void
  (arg0 :pointer)
)

; [SHIM] nk_menu_begin_text — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_menu_begin_text" nk-menu-begin-text) :int
  (arg0 :pointer)
  (title :pointer)
  (title-len :int)
  (align :unsigned-int)
  (size :pointer)
)

; [SHIM] nk_menu_begin_label — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_menu_begin_label" nk-menu-begin-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (align :unsigned-int)
  (size :pointer)
)

; [SHIM] nk_menu_begin_image — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_menu_begin_image" nk-menu-begin-image) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (size :pointer)
)

; [SHIM] nk_menu_begin_image_text — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_menu_begin_image_text" nk-menu-begin-image-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (align :unsigned-int)
  (arg4 :pointer)
  (size :pointer)
)

; [SHIM] nk_menu_begin_image_label — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_menu_begin_image_label" nk-menu-begin-image-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (align :unsigned-int)
  (arg3 :pointer)
  (size :pointer)
)

; [SHIM] nk_menu_begin_symbol — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_menu_begin_symbol" nk-menu-begin-symbol) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 nk-symbol-type)
  (size :pointer)
)

; [SHIM] nk_menu_begin_symbol_text — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_menu_begin_symbol_text" nk-menu-begin-symbol-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (align :unsigned-int)
  (arg4 nk-symbol-type)
  (size :pointer)
)

; [SHIM] nk_menu_begin_symbol_label — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_menu_begin_symbol_label" nk-menu-begin-symbol-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (align :unsigned-int)
  (arg3 nk-symbol-type)
  (size :pointer)
)

(cffi:defcfun ("nk_menu_item_text" nk-menu-item-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (align :unsigned-int)
)

(cffi:defcfun ("nk_menu_item_label" nk-menu-item-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (alignment :unsigned-int)
)

; [SHIM] nk_menu_item_image_label — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_menu_item_image_label" nk-menu-item-image-label) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (alignment :unsigned-int)
)

; [SHIM] nk_menu_item_image_text — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_menu_item_image_text" nk-menu-item-image-text) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (len :int)
  (alignment :unsigned-int)
)

(cffi:defcfun ("nk_menu_item_symbol_text" nk-menu-item-symbol-text) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (arg3 :int)
  (alignment :unsigned-int)
)

(cffi:defcfun ("nk_menu_item_symbol_label" nk-menu-item-symbol-label) :int
  (arg0 :pointer)
  (arg1 nk-symbol-type)
  (arg2 :pointer)
  (alignment :unsigned-int)
)

(cffi:defcfun ("nk_menu_close" nk-menu-close) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_menu_end" nk-menu-end) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_style_default" nk-style-default) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_style_from_table" nk-style-from-table) :void
  (arg0 :pointer)
  (arg1 :pointer)
)

(cffi:defcfun ("nk_style_load_cursor" nk-style-load-cursor) :void
  (arg0 :pointer)
  (arg1 nk-style-cursor)
  (arg2 :pointer)
)

(cffi:defcfun ("nk_style_load_all_cursors" nk-style-load-all-cursors) :void
  (arg0 :pointer)
  (arg1 :pointer)
)

(cffi:defcfun ("nk_style_get_color_by_name" nk-style-get-color-by-name) :pointer
  (arg0 nk-style-colors)
)

(cffi:defcfun ("nk_style_set_font" nk-style-set-font) :void
  (arg0 :pointer)
  (arg1 :pointer)
)

(cffi:defcfun ("nk_style_set_cursor" nk-style-set-cursor) :int
  (arg0 :pointer)
  (arg1 nk-style-cursor)
)

(cffi:defcfun ("nk_style_show_cursor" nk-style-show-cursor) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_style_hide_cursor" nk-style-hide-cursor) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_style_push_font" nk-style-push-font) :int
  (arg0 :pointer)
  (arg1 :pointer)
)

(cffi:defcfun ("nk_style_push_float" nk-style-push-float) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :float)
)

; [SHIM] nk_style_push_vec2 — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_style_push_vec2" nk-style-push-vec2) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)

; [SHIM] nk_style_push_style_item — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_style_push_style_item" nk-style-push-style-item) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)

(cffi:defcfun ("nk_style_push_flags" nk-style-push-flags) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-int)
)

; [SHIM] nk_style_push_color — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_style_push_color" nk-style-push-color) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)

(cffi:defcfun ("nk_style_pop_font" nk-style-pop-font) :int
  (arg0 :pointer)
)

(cffi:defcfun ("nk_style_pop_float" nk-style-pop-float) :int
  (arg0 :pointer)
)

(cffi:defcfun ("nk_style_pop_vec2" nk-style-pop-vec2) :int
  (arg0 :pointer)
)

(cffi:defcfun ("nk_style_pop_style_item" nk-style-pop-style-item) :int
  (arg0 :pointer)
)

(cffi:defcfun ("nk_style_pop_flags" nk-style-pop-flags) :int
  (arg0 :pointer)
)

(cffi:defcfun ("nk_style_pop_color" nk-style-pop-color) :int
  (arg0 :pointer)
)

; [SHIM] nk_rgb — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rgb" nk-rgb) :void
  (r :int)
  (g :int)
  (b :int)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_rgb_iv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rgb_iv" nk-rgb-iv) :void
  (rgb :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_rgb_bv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rgb_bv" nk-rgb-bv) :void
  (rgb :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_rgb_f — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rgb_f" nk-rgb-f) :void
  (r :float)
  (g :float)
  (b :float)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_rgb_fv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rgb_fv" nk-rgb-fv) :void
  (rgb :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_rgb_cf — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rgb_cf" nk-rgb-cf) :void
  (c :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_rgb_hex — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rgb_hex" nk-rgb-hex) :void
  (rgb :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_rgb_factor — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rgb_factor" nk-rgb-factor) :void
  (col :pointer)
  (factor :float)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_rgba — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rgba" nk-rgba) :void
  (r :int)
  (g :int)
  (b :int)
  (a :int)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_rgba_u32 — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rgba_u32" nk-rgba-u32) :void
  (arg0 :unsigned-int)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_rgba_iv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rgba_iv" nk-rgba-iv) :void
  (rgba :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_rgba_bv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rgba_bv" nk-rgba-bv) :void
  (rgba :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_rgba_f — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rgba_f" nk-rgba-f) :void
  (r :float)
  (g :float)
  (b :float)
  (a :float)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_rgba_fv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rgba_fv" nk-rgba-fv) :void
  (rgba :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_rgba_cf — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rgba_cf" nk-rgba-cf) :void
  (c :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_rgba_hex — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rgba_hex" nk-rgba-hex) :void
  (rgb :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_hsva_colorf — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_hsva_colorf" nk-hsva-colorf) :void
  (h :float)
  (s :float)
  (v :float)
  (a :float)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_hsva_colorfv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_hsva_colorfv" nk-hsva-colorfv) :void
  (c :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_colorf_hsva_f — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_colorf_hsva_f" nk-colorf-hsva-f) :void
  (out-h :pointer)
  (out-s :pointer)
  (out-v :pointer)
  (out-a :pointer)
  (in :pointer)
)

; [SHIM] nk_colorf_hsva_fv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_colorf_hsva_fv" nk-colorf-hsva-fv) :void
  (hsva :pointer)
  (in :pointer)
)

; [SHIM] nk_hsv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_hsv" nk-hsv) :void
  (h :int)
  (s :int)
  (v :int)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_hsv_iv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_hsv_iv" nk-hsv-iv) :void
  (hsv :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_hsv_bv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_hsv_bv" nk-hsv-bv) :void
  (hsv :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_hsv_f — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_hsv_f" nk-hsv-f) :void
  (h :float)
  (s :float)
  (v :float)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_hsv_fv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_hsv_fv" nk-hsv-fv) :void
  (hsv :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_hsva — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_hsva" nk-hsva) :void
  (h :int)
  (s :int)
  (v :int)
  (a :int)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_hsva_iv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_hsva_iv" nk-hsva-iv) :void
  (hsva :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_hsva_bv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_hsva_bv" nk-hsva-bv) :void
  (hsva :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_hsva_f — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_hsva_f" nk-hsva-f) :void
  (h :float)
  (s :float)
  (v :float)
  (a :float)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_hsva_fv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_hsva_fv" nk-hsva-fv) :void
  (hsva :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_color_f — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_color_f" nk-color-f) :void
  (r :pointer)
  (g :pointer)
  (b :pointer)
  (a :pointer)
  (arg4 :pointer)
)

; [SHIM] nk_color_fv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_color_fv" nk-color-fv) :void
  (rgba-out :pointer)
  (arg1 :pointer)
)

; [SHIM] nk_color_cf — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_color_cf" nk-color-cf) :void
  (arg0 :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_color_d — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_color_d" nk-color-d) :void
  (r :pointer)
  (g :pointer)
  (b :pointer)
  (a :pointer)
  (arg4 :pointer)
)

; [SHIM] nk_color_dv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_color_dv" nk-color-dv) :void
  (rgba-out :pointer)
  (arg1 :pointer)
)

; [SHIM] nk_color_u32 — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_color_u32" nk-color-u32) :unsigned-int
  (arg0 :pointer)
)

; [SHIM] nk_color_hex_rgba — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_color_hex_rgba" nk-color-hex-rgba) :void
  (output :pointer)
  (arg1 :pointer)
)

; [SHIM] nk_color_hex_rgb — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_color_hex_rgb" nk-color-hex-rgb) :void
  (output :pointer)
  (arg1 :pointer)
)

; [SHIM] nk_color_hsv_i — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_color_hsv_i" nk-color-hsv-i) :void
  (out-h :pointer)
  (out-s :pointer)
  (out-v :pointer)
  (arg3 :pointer)
)

; [SHIM] nk_color_hsv_b — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_color_hsv_b" nk-color-hsv-b) :void
  (out-h :pointer)
  (out-s :pointer)
  (out-v :pointer)
  (arg3 :pointer)
)

; [SHIM] nk_color_hsv_iv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_color_hsv_iv" nk-color-hsv-iv) :void
  (hsv-out :pointer)
  (arg1 :pointer)
)

; [SHIM] nk_color_hsv_bv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_color_hsv_bv" nk-color-hsv-bv) :void
  (hsv-out :pointer)
  (arg1 :pointer)
)

; [SHIM] nk_color_hsv_f — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_color_hsv_f" nk-color-hsv-f) :void
  (out-h :pointer)
  (out-s :pointer)
  (out-v :pointer)
  (arg3 :pointer)
)

; [SHIM] nk_color_hsv_fv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_color_hsv_fv" nk-color-hsv-fv) :void
  (hsv-out :pointer)
  (arg1 :pointer)
)

; [SHIM] nk_color_hsva_i — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_color_hsva_i" nk-color-hsva-i) :void
  (h :pointer)
  (s :pointer)
  (v :pointer)
  (a :pointer)
  (arg4 :pointer)
)

; [SHIM] nk_color_hsva_b — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_color_hsva_b" nk-color-hsva-b) :void
  (h :pointer)
  (s :pointer)
  (v :pointer)
  (a :pointer)
  (arg4 :pointer)
)

; [SHIM] nk_color_hsva_iv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_color_hsva_iv" nk-color-hsva-iv) :void
  (hsva-out :pointer)
  (arg1 :pointer)
)

; [SHIM] nk_color_hsva_bv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_color_hsva_bv" nk-color-hsva-bv) :void
  (hsva-out :pointer)
  (arg1 :pointer)
)

; [SHIM] nk_color_hsva_f — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_color_hsva_f" nk-color-hsva-f) :void
  (out-h :pointer)
  (out-s :pointer)
  (out-v :pointer)
  (out-a :pointer)
  (arg4 :pointer)
)

; [SHIM] nk_color_hsva_fv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_color_hsva_fv" nk-color-hsva-fv) :void
  (hsva-out :pointer)
  (arg1 :pointer)
)

; [SHIM] nk_handle_ptr — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_handle_ptr" nk-handle-ptr) :void
  (arg0 :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_handle_id — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_handle_id" nk-handle-id) :void
  (arg0 :int)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_image_handle — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_image_handle" nk-image-handle) :void
  (arg0 :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_image_ptr — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_image_ptr" nk-image-ptr) :void
  (arg0 :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_image_id — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_image_id" nk-image-id) :void
  (arg0 :int)
  (result-out :pointer)  ; caller allocates; filled with return value
)

(cffi:defcfun ("nk_image_is_subimage" nk-image-is-subimage) :int
  (img :pointer)
)

; [SHIM] nk_subimage_ptr — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_subimage_ptr" nk-subimage-ptr) :void
  (arg0 :pointer)
  (w :unsigned-short)
  (h :unsigned-short)
  (sub-region :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_subimage_id — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_subimage_id" nk-subimage-id) :void
  (arg0 :int)
  (w :unsigned-short)
  (h :unsigned-short)
  (sub-region :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_subimage_handle — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_subimage_handle" nk-subimage-handle) :void
  (arg0 :pointer)
  (w :unsigned-short)
  (h :unsigned-short)
  (sub-region :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_nine_slice_handle — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_nine_slice_handle" nk-nine-slice-handle) :void
  (arg0 :pointer)
  (l :unsigned-short)
  (arg-t :unsigned-short)
  (r :unsigned-short)
  (b :unsigned-short)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_nine_slice_ptr — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_nine_slice_ptr" nk-nine-slice-ptr) :void
  (arg0 :pointer)
  (l :unsigned-short)
  (arg-t :unsigned-short)
  (r :unsigned-short)
  (b :unsigned-short)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_nine_slice_id — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_nine_slice_id" nk-nine-slice-id) :void
  (arg0 :int)
  (l :unsigned-short)
  (arg-t :unsigned-short)
  (r :unsigned-short)
  (b :unsigned-short)
  (result-out :pointer)  ; caller allocates; filled with return value
)

(cffi:defcfun ("nk_nine_slice_is_sub9slice" nk-nine-slice-is-sub9slice) :int
  (img :pointer)
)

; [SHIM] nk_sub9slice_ptr — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_sub9slice_ptr" nk-sub9slice-ptr) :void
  (arg0 :pointer)
  (w :unsigned-short)
  (h :unsigned-short)
  (sub-region :pointer)
  (l :unsigned-short)
  (arg-t :unsigned-short)
  (r :unsigned-short)
  (b :unsigned-short)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_sub9slice_id — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_sub9slice_id" nk-sub9slice-id) :void
  (arg0 :int)
  (w :unsigned-short)
  (h :unsigned-short)
  (sub-region :pointer)
  (l :unsigned-short)
  (arg-t :unsigned-short)
  (r :unsigned-short)
  (b :unsigned-short)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_sub9slice_handle — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_sub9slice_handle" nk-sub9slice-handle) :void
  (arg0 :pointer)
  (w :unsigned-short)
  (h :unsigned-short)
  (sub-region :pointer)
  (l :unsigned-short)
  (arg-t :unsigned-short)
  (r :unsigned-short)
  (b :unsigned-short)
  (result-out :pointer)  ; caller allocates; filled with return value
)

(cffi:defcfun ("nk_murmur_hash" nk-murmur-hash) :unsigned-int
  (key :pointer)
  (len :int)
  (seed :unsigned-int)
)

; [SHIM] nk_triangle_from_direction — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_triangle_from_direction" nk-triangle-from-direction) :void
  (result :pointer)
  (r :pointer)
  (pad-x :float)
  (pad-y :float)
  (arg4 nk-heading)
)

; [SHIM] nk_vec2 — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_vec2" nk-vec2) :void
  (x :float)
  (y :float)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_vec2i — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_vec2i" nk-vec2i) :void
  (x :int)
  (y :int)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_vec2v — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_vec2v" nk-vec2v) :void
  (xy :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_vec2iv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_vec2iv" nk-vec2iv) :void
  (xy :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_get_null_rect — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_get_null_rect" nk-get-null-rect) :void
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_rect — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rect" nk-rect) :void
  (x :float)
  (y :float)
  (w :float)
  (h :float)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_recti — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_recti" nk-recti) :void
  (x :int)
  (y :int)
  (w :int)
  (h :int)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_recta — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_recta" nk-recta) :void
  (pos :pointer)
  (size :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_rectv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rectv" nk-rectv) :void
  (xywh :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_rectiv — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rectiv" nk-rectiv) :void
  (xywh :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_rect_pos — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rect_pos" nk-rect-pos) :void
  (arg0 :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_rect_size — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_rect_size" nk-rect-size) :void
  (arg0 :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

(cffi:defcfun ("nk_strlen" nk-strlen) :int
  (str :pointer)
)

(cffi:defcfun ("nk_stricmp" nk-stricmp) :int
  (s1 :pointer)
  (s2 :pointer)
)

(cffi:defcfun ("nk_stricmpn" nk-stricmpn) :int
  (s1 :pointer)
  (s2 :pointer)
  (n :int)
)

(cffi:defcfun ("nk_strtoi" nk-strtoi) :int
  (str :pointer)
  (endptr :pointer)
)

(cffi:defcfun ("nk_strtof" nk-strtof) :float
  (str :pointer)
  (endptr :pointer)
)

(cffi:defcfun ("nk_strtod" nk-strtod) :double
  (str :pointer)
  (endptr :pointer)
)

(cffi:defcfun ("nk_strfilter" nk-strfilter) :int
  (text :pointer)
  (regexp :pointer)
)

(cffi:defcfun ("nk_strmatch_fuzzy_string" nk-strmatch-fuzzy-string) :int
  (str :pointer)
  (pattern :pointer)
  (out-score :pointer)
)

(cffi:defcfun ("nk_strmatch_fuzzy_text" nk-strmatch-fuzzy-text) :int
  (txt :pointer)
  (txt-len :int)
  (pattern :pointer)
  (out-score :pointer)
)

(cffi:defcfun ("nk_utf_decode" nk-utf-decode) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
)

(cffi:defcfun ("nk_utf_encode" nk-utf-encode) :int
  (arg0 :unsigned-int)
  (arg1 :pointer)
  (arg2 :int)
)

(cffi:defcfun ("nk_utf_len" nk-utf-len) :int
  (arg0 :pointer)
  (byte-len :int)
)

(cffi:defcfun ("nk_utf_at" nk-utf-at) :pointer
  (buffer :pointer)
  (length :int)
  (index :int)
  (unicode :pointer)
  (len :pointer)
)

(cffi:defcfun ("nk_font_default_glyph_ranges" nk-font-default-glyph-ranges) :pointer
)

(cffi:defcfun ("nk_font_chinese_glyph_ranges" nk-font-chinese-glyph-ranges) :pointer
)

(cffi:defcfun ("nk_font_cyrillic_glyph_ranges" nk-font-cyrillic-glyph-ranges) :pointer
)

(cffi:defcfun ("nk_font_korean_glyph_ranges" nk-font-korean-glyph-ranges) :pointer
)

(cffi:defcfun ("nk_font_atlas_init_default" nk-font-atlas-init-default) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_font_atlas_init" nk-font-atlas-init) :void
  (arg0 :pointer)
  (arg1 :pointer)
)

(cffi:defcfun ("nk_font_atlas_init_custom" nk-font-atlas-init-custom) :void
  (arg0 :pointer)
  (persistent :pointer)
  (transient :pointer)
)

(cffi:defcfun ("nk_font_atlas_begin" nk-font-atlas-begin) :void
  (arg0 :pointer)
)

; [SHIM] nk_font_config — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_font_config" nk-font-config) :void
  (pixel-height :float)
  (result-out :pointer)  ; caller allocates; filled with return value
)

(cffi:defcfun ("nk_font_atlas_add" nk-font-atlas-add) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
)

(cffi:defcfun ("nk_font_atlas_add_default" nk-font-atlas-add-default) :pointer
  (arg0 :pointer)
  (height :float)
  (arg2 :pointer)
)

(cffi:defcfun ("nk_font_atlas_add_from_memory" nk-font-atlas-add-from-memory) :pointer
  (atlas :pointer)
  (memory :pointer)
  (size :unsigned-long)
  (height :float)
  (config :pointer)
)

(cffi:defcfun ("nk_font_atlas_add_from_file" nk-font-atlas-add-from-file) :pointer
  (atlas :pointer)
  (file-path :pointer)
  (height :float)
  (arg3 :pointer)
)

(cffi:defcfun ("nk_font_atlas_add_compressed" nk-font-atlas-add-compressed) :pointer
  (arg0 :pointer)
  (memory :pointer)
  (size :unsigned-long)
  (height :float)
  (arg4 :pointer)
)

(cffi:defcfun ("nk_font_atlas_add_compressed_base85" nk-font-atlas-add-compressed-base85) :pointer
  (arg0 :pointer)
  (data :pointer)
  (height :float)
  (config :pointer)
)

(cffi:defcfun ("nk_font_atlas_bake" nk-font-atlas-bake) :pointer
  (arg0 :pointer)
  (width :pointer)
  (height :pointer)
  (arg3 nk-font-atlas-format)
)

; [SHIM] nk_font_atlas_end — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_font_atlas_end" nk-font-atlas-end) :void
  (arg0 :pointer)
  (tex :pointer)
  (arg2 :pointer)
)

(cffi:defcfun ("nk_font_find_glyph" nk-font-find-glyph) :pointer
  (arg0 :pointer)
  (unicode :unsigned-int)
)

(cffi:defcfun ("nk_font_atlas_cleanup" nk-font-atlas-cleanup) :void
  (atlas :pointer)
)

(cffi:defcfun ("nk_font_atlas_clear" nk-font-atlas-clear) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_buffer_init_default" nk-buffer-init-default) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_buffer_init" nk-buffer-init) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (size :unsigned-long)
)

(cffi:defcfun ("nk_buffer_init_fixed" nk-buffer-init-fixed) :void
  (arg0 :pointer)
  (memory :pointer)
  (size :unsigned-long)
)

(cffi:defcfun ("nk_buffer_info" nk-buffer-info) :void
  (arg0 :pointer)
  (arg1 :pointer)
)

(cffi:defcfun ("nk_buffer_push" nk-buffer-push) :void
  (arg0 :pointer)
  (type nk-buffer-allocation-type)
  (memory :pointer)
  (size :unsigned-long)
  (align :unsigned-long)
)

(cffi:defcfun ("nk_buffer_mark" nk-buffer-mark) :void
  (arg0 :pointer)
  (type nk-buffer-allocation-type)
)

(cffi:defcfun ("nk_buffer_reset" nk-buffer-reset) :void
  (arg0 :pointer)
  (type nk-buffer-allocation-type)
)

(cffi:defcfun ("nk_buffer_clear" nk-buffer-clear) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_buffer_free" nk-buffer-free) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_buffer_memory" nk-buffer-memory) :pointer
  (arg0 :pointer)
)

(cffi:defcfun ("nk_buffer_memory_const" nk-buffer-memory-const) :pointer
  (arg0 :pointer)
)

(cffi:defcfun ("nk_buffer_total" nk-buffer-total) :unsigned-long
  (arg0 :pointer)
)

(cffi:defcfun ("nk_str_init_default" nk-str-init-default) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_str_init" nk-str-init) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (size :unsigned-long)
)

(cffi:defcfun ("nk_str_init_fixed" nk-str-init-fixed) :void
  (arg0 :pointer)
  (memory :pointer)
  (size :unsigned-long)
)

(cffi:defcfun ("nk_str_clear" nk-str-clear) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_str_free" nk-str-free) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_str_append_text_char" nk-str-append-text-char) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
)

(cffi:defcfun ("nk_str_append_str_char" nk-str-append-str-char) :int
  (arg0 :pointer)
  (arg1 :pointer)
)

(cffi:defcfun ("nk_str_append_text_utf8" nk-str-append-text-utf8) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
)

(cffi:defcfun ("nk_str_append_str_utf8" nk-str-append-str-utf8) :int
  (arg0 :pointer)
  (arg1 :pointer)
)

(cffi:defcfun ("nk_str_append_text_runes" nk-str-append-text-runes) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
)

(cffi:defcfun ("nk_str_append_str_runes" nk-str-append-str-runes) :int
  (arg0 :pointer)
  (arg1 :pointer)
)

(cffi:defcfun ("nk_str_insert_at_char" nk-str-insert-at-char) :int
  (arg0 :pointer)
  (pos :int)
  (arg2 :pointer)
  (arg3 :int)
)

(cffi:defcfun ("nk_str_insert_at_rune" nk-str-insert-at-rune) :int
  (arg0 :pointer)
  (pos :int)
  (arg2 :pointer)
  (arg3 :int)
)

(cffi:defcfun ("nk_str_insert_text_char" nk-str-insert-text-char) :int
  (arg0 :pointer)
  (pos :int)
  (arg2 :pointer)
  (arg3 :int)
)

(cffi:defcfun ("nk_str_insert_str_char" nk-str-insert-str-char) :int
  (arg0 :pointer)
  (pos :int)
  (arg2 :pointer)
)

(cffi:defcfun ("nk_str_insert_text_utf8" nk-str-insert-text-utf8) :int
  (arg0 :pointer)
  (pos :int)
  (arg2 :pointer)
  (arg3 :int)
)

(cffi:defcfun ("nk_str_insert_str_utf8" nk-str-insert-str-utf8) :int
  (arg0 :pointer)
  (pos :int)
  (arg2 :pointer)
)

(cffi:defcfun ("nk_str_insert_text_runes" nk-str-insert-text-runes) :int
  (arg0 :pointer)
  (pos :int)
  (arg2 :pointer)
  (arg3 :int)
)

(cffi:defcfun ("nk_str_insert_str_runes" nk-str-insert-str-runes) :int
  (arg0 :pointer)
  (pos :int)
  (arg2 :pointer)
)

(cffi:defcfun ("nk_str_remove_chars" nk-str-remove-chars) :void
  (arg0 :pointer)
  (len :int)
)

(cffi:defcfun ("nk_str_remove_runes" nk-str-remove-runes) :void
  (str :pointer)
  (len :int)
)

(cffi:defcfun ("nk_str_delete_chars" nk-str-delete-chars) :void
  (arg0 :pointer)
  (pos :int)
  (len :int)
)

(cffi:defcfun ("nk_str_delete_runes" nk-str-delete-runes) :void
  (arg0 :pointer)
  (pos :int)
  (len :int)
)

(cffi:defcfun ("nk_str_at_char" nk-str-at-char) :pointer
  (arg0 :pointer)
  (pos :int)
)

(cffi:defcfun ("nk_str_at_rune" nk-str-at-rune) :pointer
  (arg0 :pointer)
  (pos :int)
  (unicode :pointer)
  (len :pointer)
)

(cffi:defcfun ("nk_str_rune_at" nk-str-rune-at) :unsigned-int
  (arg0 :pointer)
  (pos :int)
)

(cffi:defcfun ("nk_str_at_char_const" nk-str-at-char-const) :pointer
  (arg0 :pointer)
  (pos :int)
)

(cffi:defcfun ("nk_str_at_const" nk-str-at-const) :pointer
  (arg0 :pointer)
  (pos :int)
  (unicode :pointer)
  (len :pointer)
)

(cffi:defcfun ("nk_str_get" nk-str-get) :pointer
  (arg0 :pointer)
)

(cffi:defcfun ("nk_str_get_const" nk-str-get-const) :pointer
  (arg0 :pointer)
)

(cffi:defcfun ("nk_str_len" nk-str-len) :int
  (arg0 :pointer)
)

(cffi:defcfun ("nk_str_len_char" nk-str-len-char) :int
  (arg0 :pointer)
)

(cffi:defcfun ("nk_filter_default" nk-filter-default) :int
  (arg0 :pointer)
  (unicode :unsigned-int)
)

(cffi:defcfun ("nk_filter_ascii" nk-filter-ascii) :int
  (arg0 :pointer)
  (unicode :unsigned-int)
)

(cffi:defcfun ("nk_filter_float" nk-filter-float) :int
  (arg0 :pointer)
  (unicode :unsigned-int)
)

(cffi:defcfun ("nk_filter_decimal" nk-filter-decimal) :int
  (arg0 :pointer)
  (unicode :unsigned-int)
)

(cffi:defcfun ("nk_filter_hex" nk-filter-hex) :int
  (arg0 :pointer)
  (unicode :unsigned-int)
)

(cffi:defcfun ("nk_filter_oct" nk-filter-oct) :int
  (arg0 :pointer)
  (unicode :unsigned-int)
)

(cffi:defcfun ("nk_filter_binary" nk-filter-binary) :int
  (arg0 :pointer)
  (unicode :unsigned-int)
)

(cffi:defcfun ("nk_textedit_init_default" nk-textedit-init-default) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_textedit_init" nk-textedit-init) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (size :unsigned-long)
)

(cffi:defcfun ("nk_textedit_init_fixed" nk-textedit-init-fixed) :void
  (arg0 :pointer)
  (memory :pointer)
  (size :unsigned-long)
)

(cffi:defcfun ("nk_textedit_free" nk-textedit-free) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_textedit_text" nk-textedit-text) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (total-len :int)
)

(cffi:defcfun ("nk_textedit_delete" nk-textedit-delete) :void
  (arg0 :pointer)
  (where :int)
  (len :int)
)

(cffi:defcfun ("nk_textedit_delete_selection" nk-textedit-delete-selection) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_textedit_select_all" nk-textedit-select-all) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_textedit_cut" nk-textedit-cut) :int
  (arg0 :pointer)
)

(cffi:defcfun ("nk_textedit_paste" nk-textedit-paste) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (len :int)
)

(cffi:defcfun ("nk_textedit_undo" nk-textedit-undo) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_textedit_redo" nk-textedit-redo) :void
  (arg0 :pointer)
)

; [SHIM] nk_stroke_line — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_stroke_line" nk-stroke-line) :void
  (b :pointer)
  (x0 :float)
  (y0 :float)
  (x1 :float)
  (y1 :float)
  (line-thickness :float)
  (arg6 :pointer)
)

; [SHIM] nk_stroke_curve — struct-by-value args/return replaced with pointers
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

; [SHIM] nk_stroke_rect — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_stroke_rect" nk-stroke-rect) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (rounding :float)
  (line-thickness :float)
  (arg4 :pointer)
)

; [SHIM] nk_stroke_circle — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_stroke_circle" nk-stroke-circle) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (line-thickness :float)
  (arg3 :pointer)
)

; [SHIM] nk_stroke_arc — struct-by-value args/return replaced with pointers
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

; [SHIM] nk_stroke_triangle — struct-by-value args/return replaced with pointers
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

; [SHIM] nk_stroke_polyline — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_stroke_polyline" nk-stroke-polyline) :void
  (arg0 :pointer)
  (points :pointer)
  (point-count :int)
  (line-thickness :float)
  (col :pointer)
)

; [SHIM] nk_stroke_polygon — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_stroke_polygon" nk-stroke-polygon) :void
  (arg0 :pointer)
  (points :pointer)
  (point-count :int)
  (line-thickness :float)
  (arg4 :pointer)
)

; [SHIM] nk_fill_rect — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_fill_rect" nk-fill-rect) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (rounding :float)
  (arg3 :pointer)
)

; [SHIM] nk_fill_rect_multi_color — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_fill_rect_multi_color" nk-fill-rect-multi-color) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (left :pointer)
  (top :pointer)
  (right :pointer)
  (bottom :pointer)
)

; [SHIM] nk_fill_circle — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_fill_circle" nk-fill-circle) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)

; [SHIM] nk_fill_arc — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_fill_arc" nk-fill-arc) :void
  (arg0 :pointer)
  (cx :float)
  (cy :float)
  (radius :float)
  (a-min :float)
  (a-max :float)
  (arg6 :pointer)
)

; [SHIM] nk_fill_triangle — struct-by-value args/return replaced with pointers
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

; [SHIM] nk_fill_polygon — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_fill_polygon" nk-fill-polygon) :void
  (arg0 :pointer)
  (points :pointer)
  (point-count :int)
  (arg3 :pointer)
)

; [SHIM] nk_draw_image — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_image" nk-draw-image) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
)

; [SHIM] nk_draw_nine_slice — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_nine_slice" nk-draw-nine-slice) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
)

; [SHIM] nk_draw_text — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_text" nk-draw-text) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (text :pointer)
  (len :int)
  (arg4 :pointer)
  (arg5 :pointer)
  (arg6 :pointer)
)

; [SHIM] nk_push_scissor — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_push_scissor" nk-push-scissor) :void
  (arg0 :pointer)
  (arg1 :pointer)
)

; [SHIM] nk_push_custom — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_push_custom" nk-push-custom) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (usr :pointer)
)

(cffi:defcfun ("nk_input_has_mouse_click" nk-input-has-mouse-click) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
)

; [SHIM] nk_input_has_mouse_click_in_rect — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_input_has_mouse_click_in_rect" nk-input-has-mouse-click-in-rect) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
  (arg2 :pointer)
)

; [SHIM] nk_input_has_mouse_click_in_button_rect — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_input_has_mouse_click_in_button_rect" nk-input-has-mouse-click-in-button-rect) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
  (arg2 :pointer)
)

; [SHIM] nk_input_has_mouse_click_down_in_rect — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_input_has_mouse_click_down_in_rect" nk-input-has-mouse-click-down-in-rect) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
  (arg2 :pointer)
  (down :int)
)

; [SHIM] nk_input_is_mouse_click_in_rect — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_input_is_mouse_click_in_rect" nk-input-is-mouse-click-in-rect) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
  (arg2 :pointer)
)

; [SHIM] nk_input_is_mouse_click_down_in_rect — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_input_is_mouse_click_down_in_rect" nk-input-is-mouse-click-down-in-rect) :int
  (i :pointer)
  (id nk-buttons)
  (b :pointer)
  (down :int)
)

; [SHIM] nk_input_any_mouse_click_in_rect — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_input_any_mouse_click_in_rect" nk-input-any-mouse-click-in-rect) :int
  (arg0 :pointer)
  (arg1 :pointer)
)

; [SHIM] nk_input_is_mouse_prev_hovering_rect — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_input_is_mouse_prev_hovering_rect" nk-input-is-mouse-prev-hovering-rect) :int
  (arg0 :pointer)
  (arg1 :pointer)
)

; [SHIM] nk_input_is_mouse_hovering_rect — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_input_is_mouse_hovering_rect" nk-input-is-mouse-hovering-rect) :int
  (arg0 :pointer)
  (arg1 :pointer)
)

; [SHIM] nk_input_is_mouse_hovering_still_rect — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_input_is_mouse_hovering_still_rect" nk-input-is-mouse-hovering-still-rect) :int
  (arg0 :pointer)
  (arg1 :pointer)
)

; [SHIM] nk_input_is_mouse_hovering_delay_rect — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_input_is_mouse_hovering_delay_rect" nk-input-is-mouse-hovering-delay-rect) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :float)
)

; [SHIM] nk_input_is_mouse_hovering_still_delay_rect — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_input_is_mouse_hovering_still_delay_rect" nk-input-is-mouse-hovering-still-delay-rect) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :float)
)

; [SHIM] nk_input_is_mouse_hovering_still_delay_clicked_rect — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_input_is_mouse_hovering_still_delay_clicked_rect" nk-input-is-mouse-hovering-still-delay-clicked-rect) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :float)
  (arg4 :pointer)
)

(cffi:defcfun ("nk_input_is_mouse_moved" nk-input-is-mouse-moved) :int
  (arg0 :pointer)
)

; [SHIM] nk_input_mouse_clicked — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_input_mouse_clicked" nk-input-mouse-clicked) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
  (arg2 :pointer)
)

(cffi:defcfun ("nk_input_is_mouse_down" nk-input-is-mouse-down) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
)

(cffi:defcfun ("nk_input_is_mouse_pressed" nk-input-is-mouse-pressed) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
)

(cffi:defcfun ("nk_input_is_mouse_released" nk-input-is-mouse-released) :int
  (arg0 :pointer)
  (arg1 nk-buttons)
)

(cffi:defcfun ("nk_input_is_key_pressed" nk-input-is-key-pressed) :int
  (arg0 :pointer)
  (arg1 nk-keys)
)

(cffi:defcfun ("nk_input_is_key_released" nk-input-is-key-released) :int
  (arg0 :pointer)
  (arg1 nk-keys)
)

(cffi:defcfun ("nk_input_is_key_down" nk-input-is-key-down) :int
  (arg0 :pointer)
  (arg1 nk-keys)
)

(cffi:defcfun ("nk_draw_list_init" nk-draw-list-init) :void
  (arg0 :pointer)
)

(cffi:defcfun ("nk_draw_list_setup" nk-draw-list-setup) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (cmds :pointer)
  (vertices :pointer)
  (elements :pointer)
  (line-aa nk-anti-aliasing)
  (shape-aa nk-anti-aliasing)
)

(cffi:defcfun ("nk__draw_list_begin" nk--draw-list-begin) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
)

(cffi:defcfun ("nk__draw_list_next" nk--draw-list-next) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
)

(cffi:defcfun ("nk__draw_list_end" nk--draw-list-end) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
)

(cffi:defcfun ("nk_draw_list_path_clear" nk-draw-list-path-clear) :void
  (arg0 :pointer)
)

; [SHIM] nk_draw_list_path_line_to — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_path_line_to" nk-draw-list-path-line-to) :void
  (arg0 :pointer)
  (pos :pointer)
)

; [SHIM] nk_draw_list_path_arc_to_fast — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_path_arc_to_fast" nk-draw-list-path-arc-to-fast) :void
  (arg0 :pointer)
  (center :pointer)
  (radius :float)
  (a-min :int)
  (a-max :int)
)

; [SHIM] nk_draw_list_path_arc_to — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_path_arc_to" nk-draw-list-path-arc-to) :void
  (arg0 :pointer)
  (center :pointer)
  (radius :float)
  (a-min :float)
  (a-max :float)
  (segments :unsigned-int)
)

; [SHIM] nk_draw_list_path_rect_to — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_path_rect_to" nk-draw-list-path-rect-to) :void
  (arg0 :pointer)
  (a :pointer)
  (b :pointer)
  (rounding :float)
)

; [SHIM] nk_draw_list_path_curve_to — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_path_curve_to" nk-draw-list-path-curve-to) :void
  (arg0 :pointer)
  (p2 :pointer)
  (p3 :pointer)
  (p4 :pointer)
  (num-segments :unsigned-int)
)

; [SHIM] nk_draw_list_path_fill — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_path_fill" nk-draw-list-path-fill) :void
  (arg0 :pointer)
  (arg1 :pointer)
)

; [SHIM] nk_draw_list_path_stroke — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_path_stroke" nk-draw-list-path-stroke) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (closed nk-draw-list-stroke)
  (thickness :float)
)

; [SHIM] nk_draw_list_stroke_line — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_stroke_line" nk-draw-list-stroke-line) :void
  (arg0 :pointer)
  (a :pointer)
  (b :pointer)
  (arg3 :pointer)
  (thickness :float)
)

; [SHIM] nk_draw_list_stroke_rect — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_stroke_rect" nk-draw-list-stroke-rect) :void
  (arg0 :pointer)
  (rect :pointer)
  (arg2 :pointer)
  (rounding :float)
  (thickness :float)
)

; [SHIM] nk_draw_list_stroke_triangle — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_stroke_triangle" nk-draw-list-stroke-triangle) :void
  (arg0 :pointer)
  (a :pointer)
  (b :pointer)
  (c :pointer)
  (arg4 :pointer)
  (thickness :float)
)

; [SHIM] nk_draw_list_stroke_circle — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_stroke_circle" nk-draw-list-stroke-circle) :void
  (arg0 :pointer)
  (center :pointer)
  (radius :float)
  (arg3 :pointer)
  (segs :unsigned-int)
  (thickness :float)
)

; [SHIM] nk_draw_list_stroke_curve — struct-by-value args/return replaced with pointers
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

; [SHIM] nk_draw_list_stroke_poly_line — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_stroke_poly_line" nk-draw-list-stroke-poly-line) :void
  (arg0 :pointer)
  (pnts :pointer)
  (cnt :unsigned-int)
  (arg3 :pointer)
  (arg4 nk-draw-list-stroke)
  (thickness :float)
  (arg6 nk-anti-aliasing)
)

; [SHIM] nk_draw_list_fill_rect — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_fill_rect" nk-draw-list-fill-rect) :void
  (arg0 :pointer)
  (rect :pointer)
  (arg2 :pointer)
  (rounding :float)
)

; [SHIM] nk_draw_list_fill_rect_multi_color — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_fill_rect_multi_color" nk-draw-list-fill-rect-multi-color) :void
  (arg0 :pointer)
  (rect :pointer)
  (left :pointer)
  (top :pointer)
  (right :pointer)
  (bottom :pointer)
)

; [SHIM] nk_draw_list_fill_triangle — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_fill_triangle" nk-draw-list-fill-triangle) :void
  (arg0 :pointer)
  (a :pointer)
  (b :pointer)
  (c :pointer)
  (arg4 :pointer)
)

; [SHIM] nk_draw_list_fill_circle — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_fill_circle" nk-draw-list-fill-circle) :void
  (arg0 :pointer)
  (center :pointer)
  (radius :float)
  (col :pointer)
  (segs :unsigned-int)
)

; [SHIM] nk_draw_list_fill_poly_convex — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_fill_poly_convex" nk-draw-list-fill-poly-convex) :void
  (arg0 :pointer)
  (points :pointer)
  (count :unsigned-int)
  (arg3 :pointer)
  (arg4 nk-anti-aliasing)
)

; [SHIM] nk_draw_list_add_image — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_add_image" nk-draw-list-add-image) :void
  (arg0 :pointer)
  (texture :pointer)
  (rect :pointer)
  (arg3 :pointer)
)

; [SHIM] nk_draw_list_add_text — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_add_text" nk-draw-list-add-text) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (text :pointer)
  (len :int)
  (font-height :float)
  (arg6 :pointer)
)

; [SHIM] nk_draw_list_push_userdata — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_draw_list_push_userdata" nk-draw-list-push-userdata) :void
  (arg0 :pointer)
  (userdata :pointer)
)

; [SHIM] nk_style_item_color — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_style_item_color" nk-style-item-color) :void
  (arg0 :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_style_item_image — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_style_item_image" nk-style-item-image) :void
  (img :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_style_item_nine_slice — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_style_item_nine_slice" nk-style-item-nine-slice) :void
  (slice :pointer)
  (result-out :pointer)  ; caller allocates; filled with return value
)

; [SHIM] nk_style_item_hide — struct-by-value args/return replaced with pointers
(cffi:defcfun ("cl_nk_style_item_hide" nk-style-item-hide) :void
  (result-out :pointer)  ; caller allocates; filled with return value
)
