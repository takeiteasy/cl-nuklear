(in-package :nuklear)

;;; Enumerations

(defconstant nk-false 0)
(defconstant nk-true 1)

; nk_heading
#-ecl
(cffi:defcenum nk-heading
  (:nk-up 0)
  (:nk-right 1)
  (:nk-down 2)
  (:nk-left 3)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-up 0)
  (defconstant nk-right 1)
  (defconstant nk-down 2)
  (defconstant nk-left 3)
)

; nk_button_behavior
#-ecl
(cffi:defcenum nk-button-behavior
  (:nk-button-default 0)
  (:nk-button-repeater 1)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-button-default 0)
  (defconstant nk-button-repeater 1)
)

; nk_modify
#-ecl
(cffi:defcenum nk-modify
  (:nk-fixed 0)
  (:nk-modifiable 1)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-fixed 0)
  (defconstant nk-modifiable 1)
)

; nk_orientation
#-ecl
(cffi:defcenum nk-orientation
  (:nk-vertical 0)
  (:nk-horizontal 1)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-vertical 0)
  (defconstant nk-horizontal 1)
)

; nk_collapse_states
#-ecl
(cffi:defcenum nk-collapse-states
  (:nk-minimized 0)
  (:nk-maximized 1)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-minimized 0)
  (defconstant nk-maximized 1)
)

; nk_show_states
#-ecl
(cffi:defcenum nk-show-states
  (:nk-hidden 0)
  (:nk-shown 1)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-hidden 0)
  (defconstant nk-shown 1)
)

; nk_chart_type
#-ecl
(cffi:defcenum nk-chart-type
  (:nk-chart-lines 0)
  (:nk-chart-column 1)
  (:nk-chart-max 2)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-chart-lines 0)
  (defconstant nk-chart-column 1)
  (defconstant nk-chart-max 2)
)

; nk_chart_event
#-ecl
(cffi:defcenum nk-chart-event
  (:nk-chart-hovering 1)
  (:nk-chart-clicked 2)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-chart-hovering 1)
  (defconstant nk-chart-clicked 2)
)

; nk_color_format
#-ecl
(cffi:defcenum nk-color-format
  (:nk-rgb 0)
  (:nk-rgba 1)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-rgb 0)
  (defconstant nk-rgba 1)
)

; nk_popup_type
#-ecl
(cffi:defcenum nk-popup-type
  (:nk-popup-static 0)
  (:nk-popup-dynamic 1)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-popup-static 0)
  (defconstant nk-popup-dynamic 1)
)

; nk_layout_format
#-ecl
(cffi:defcenum nk-layout-format
  (:nk-dynamic 0)
  (:nk-static 1)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-dynamic 0)
  (defconstant nk-static 1)
)

; nk_tree_type
#-ecl
(cffi:defcenum nk-tree-type
  (:nk-tree-node 0)
  (:nk-tree-tab 1)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-tree-node 0)
  (defconstant nk-tree-tab 1)
)

; nk_tooltip_pos
#-ecl
(cffi:defcenum nk-tooltip-pos
  (:nk-top-left 0)
  (:nk-top-center 1)
  (:nk-top-right 2)
  (:nk-middle-left 3)
  (:nk-middle-center 4)
  (:nk-middle-right 5)
  (:nk-bottom-left 6)
  (:nk-bottom-center 7)
  (:nk-bottom-right 8)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-top-left 0)
  (defconstant nk-top-center 1)
  (defconstant nk-top-right 2)
  (defconstant nk-middle-left 3)
  (defconstant nk-middle-center 4)
  (defconstant nk-middle-right 5)
  (defconstant nk-bottom-left 6)
  (defconstant nk-bottom-center 7)
  (defconstant nk-bottom-right 8)
)

; nk_symbol_type
#-ecl
(cffi:defcenum nk-symbol-type
  (:nk-symbol-none 0)
  (:nk-symbol-x 1)
  (:nk-symbol-underscore 2)
  (:nk-symbol-circle-solid 3)
  (:nk-symbol-circle-outline 4)
  (:nk-symbol-rect-solid 5)
  (:nk-symbol-rect-outline 6)
  (:nk-symbol-triangle-up 7)
  (:nk-symbol-triangle-down 8)
  (:nk-symbol-triangle-left 9)
  (:nk-symbol-triangle-right 10)
  (:nk-symbol-plus 11)
  (:nk-symbol-minus 12)
  (:nk-symbol-triangle-up-outline 13)
  (:nk-symbol-triangle-down-outline 14)
  (:nk-symbol-triangle-left-outline 15)
  (:nk-symbol-triangle-right-outline 16)
  (:nk-symbol-chevron-up 17)
  (:nk-symbol-chevron-right 18)
  (:nk-symbol-chevron-down 19)
  (:nk-symbol-chevron-left 20)
  (:nk-symbol-hamburger 21)
  (:nk-symbol-max 22)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-symbol-none 0)
  (defconstant nk-symbol-x 1)
  (defconstant nk-symbol-underscore 2)
  (defconstant nk-symbol-circle-solid 3)
  (defconstant nk-symbol-circle-outline 4)
  (defconstant nk-symbol-rect-solid 5)
  (defconstant nk-symbol-rect-outline 6)
  (defconstant nk-symbol-triangle-up 7)
  (defconstant nk-symbol-triangle-down 8)
  (defconstant nk-symbol-triangle-left 9)
  (defconstant nk-symbol-triangle-right 10)
  (defconstant nk-symbol-plus 11)
  (defconstant nk-symbol-minus 12)
  (defconstant nk-symbol-triangle-up-outline 13)
  (defconstant nk-symbol-triangle-down-outline 14)
  (defconstant nk-symbol-triangle-left-outline 15)
  (defconstant nk-symbol-triangle-right-outline 16)
  (defconstant nk-symbol-chevron-up 17)
  (defconstant nk-symbol-chevron-right 18)
  (defconstant nk-symbol-chevron-down 19)
  (defconstant nk-symbol-chevron-left 20)
  (defconstant nk-symbol-hamburger 21)
  (defconstant nk-symbol-max 22)
)

; nk_keys
#-ecl
(cffi:defcenum nk-keys
  (:nk-key-none 0)
  (:nk-key-shift 1)
  (:nk-key-ctrl 2)
  (:nk-key-del 3)
  (:nk-key-enter 4)
  (:nk-key-tab 5)
  (:nk-key-backspace 6)
  (:nk-key-copy 7)
  (:nk-key-cut 8)
  (:nk-key-paste 9)
  (:nk-key-up 10)
  (:nk-key-down 11)
  (:nk-key-left 12)
  (:nk-key-right 13)
  (:nk-key-text-insert-mode 14)
  (:nk-key-text-replace-mode 15)
  (:nk-key-text-reset-mode 16)
  (:nk-key-text-line-start 17)
  (:nk-key-text-line-end 18)
  (:nk-key-text-start 19)
  (:nk-key-text-end 20)
  (:nk-key-text-undo 21)
  (:nk-key-text-redo 22)
  (:nk-key-text-select-all 23)
  (:nk-key-text-word-left 24)
  (:nk-key-text-word-right 25)
  (:nk-key-scroll-start 26)
  (:nk-key-scroll-end 27)
  (:nk-key-scroll-down 28)
  (:nk-key-scroll-up 29)
  (:nk-key-alt 30)
  (:nk-key-f1 31)
  (:nk-key-f2 32)
  (:nk-key-f3 33)
  (:nk-key-f4 34)
  (:nk-key-f5 35)
  (:nk-key-f6 36)
  (:nk-key-f7 37)
  (:nk-key-f8 38)
  (:nk-key-f9 39)
  (:nk-key-f10 40)
  (:nk-key-f11 41)
  (:nk-key-f12 42)
  (:nk-key-max 43)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-key-none 0)
  (defconstant nk-key-shift 1)
  (defconstant nk-key-ctrl 2)
  (defconstant nk-key-del 3)
  (defconstant nk-key-enter 4)
  (defconstant nk-key-tab 5)
  (defconstant nk-key-backspace 6)
  (defconstant nk-key-copy 7)
  (defconstant nk-key-cut 8)
  (defconstant nk-key-paste 9)
  (defconstant nk-key-up 10)
  (defconstant nk-key-down 11)
  (defconstant nk-key-left 12)
  (defconstant nk-key-right 13)
  (defconstant nk-key-text-insert-mode 14)
  (defconstant nk-key-text-replace-mode 15)
  (defconstant nk-key-text-reset-mode 16)
  (defconstant nk-key-text-line-start 17)
  (defconstant nk-key-text-line-end 18)
  (defconstant nk-key-text-start 19)
  (defconstant nk-key-text-end 20)
  (defconstant nk-key-text-undo 21)
  (defconstant nk-key-text-redo 22)
  (defconstant nk-key-text-select-all 23)
  (defconstant nk-key-text-word-left 24)
  (defconstant nk-key-text-word-right 25)
  (defconstant nk-key-scroll-start 26)
  (defconstant nk-key-scroll-end 27)
  (defconstant nk-key-scroll-down 28)
  (defconstant nk-key-scroll-up 29)
  (defconstant nk-key-alt 30)
  (defconstant nk-key-f1 31)
  (defconstant nk-key-f2 32)
  (defconstant nk-key-f3 33)
  (defconstant nk-key-f4 34)
  (defconstant nk-key-f5 35)
  (defconstant nk-key-f6 36)
  (defconstant nk-key-f7 37)
  (defconstant nk-key-f8 38)
  (defconstant nk-key-f9 39)
  (defconstant nk-key-f10 40)
  (defconstant nk-key-f11 41)
  (defconstant nk-key-f12 42)
  (defconstant nk-key-max 43)
)

; nk_buttons
#-ecl
(cffi:defcenum nk-buttons
  (:nk-button-left 0)
  (:nk-button-middle 1)
  (:nk-button-right 2)
  (:nk-button-double 3)
  (:nk-button-x1 4)
  (:nk-button-x2 5)
  (:nk-button-max 6)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-button-left 0)
  (defconstant nk-button-middle 1)
  (defconstant nk-button-right 2)
  (defconstant nk-button-double 3)
  (defconstant nk-button-x1 4)
  (defconstant nk-button-x2 5)
  (defconstant nk-button-max 6)
)

; nk_anti_aliasing
#-ecl
(cffi:defcenum nk-anti-aliasing
  (:nk-anti-aliasing-off 0)
  (:nk-anti-aliasing-on 1)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-anti-aliasing-off 0)
  (defconstant nk-anti-aliasing-on 1)
)

; nk_convert_result
#-ecl
(cffi:defcenum nk-convert-result
  (:nk-convert-success 0)
  (:nk-convert-invalid-param 1)
  (:nk-convert-command-buffer-full 2)
  (:nk-convert-vertex-buffer-full 4)
  (:nk-convert-element-buffer-full 8)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-convert-success 0)
  (defconstant nk-convert-invalid-param 1)
  (defconstant nk-convert-command-buffer-full 2)
  (defconstant nk-convert-vertex-buffer-full 4)
  (defconstant nk-convert-element-buffer-full 8)
)

; nk_panel_flags
#-ecl
(cffi:defcenum nk-panel-flags
  (:nk-window-border 1)
  (:nk-window-movable 2)
  (:nk-window-scalable 4)
  (:nk-window-closable 8)
  (:nk-window-minimizable 16)
  (:nk-window-no-scrollbar 32)
  (:nk-window-title 64)
  (:nk-window-scroll-auto-hide 128)
  (:nk-window-background 256)
  (:nk-window-scale-left 512)
  (:nk-window-no-input 1024)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-window-border 1)
  (defconstant nk-window-movable 2)
  (defconstant nk-window-scalable 4)
  (defconstant nk-window-closable 8)
  (defconstant nk-window-minimizable 16)
  (defconstant nk-window-no-scrollbar 32)
  (defconstant nk-window-title 64)
  (defconstant nk-window-scroll-auto-hide 128)
  (defconstant nk-window-background 256)
  (defconstant nk-window-scale-left 512)
  (defconstant nk-window-no-input 1024)
)

; nk_widget_align
#-ecl
(cffi:defcenum nk-widget-align
  (:nk-widget-align-left 1)
  (:nk-widget-align-centered 2)
  (:nk-widget-align-right 4)
  (:nk-widget-align-top 8)
  (:nk-widget-align-middle 16)
  (:nk-widget-align-bottom 32)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-widget-align-left 1)
  (defconstant nk-widget-align-centered 2)
  (defconstant nk-widget-align-right 4)
  (defconstant nk-widget-align-top 8)
  (defconstant nk-widget-align-middle 16)
  (defconstant nk-widget-align-bottom 32)
)

; nk_widget_alignment
#-ecl
(cffi:defcenum nk-widget-alignment
  (:nk-widget-left 17)
  (:nk-widget-centered 18)
  (:nk-widget-right 20)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-widget-left 17)
  (defconstant nk-widget-centered 18)
  (defconstant nk-widget-right 20)
)

; nk_widget_layout_states
#-ecl
(cffi:defcenum nk-widget-layout-states
  (:nk-widget-invalid 0)
  (:nk-widget-valid 1)
  (:nk-widget-rom 2)
  (:nk-widget-disabled 3)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-widget-invalid 0)
  (defconstant nk-widget-valid 1)
  (defconstant nk-widget-rom 2)
  (defconstant nk-widget-disabled 3)
)

; nk_widget_states
#-ecl
(cffi:defcenum nk-widget-states
  (:nk-widget-state-modified 2)
  (:nk-widget-state-inactive 4)
  (:nk-widget-state-entered 8)
  (:nk-widget-state-hover 16)
  (:nk-widget-state-actived 32)
  (:nk-widget-state-left 64)
  (:nk-widget-state-hovered 18)
  (:nk-widget-state-active 34)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-widget-state-modified 2)
  (defconstant nk-widget-state-inactive 4)
  (defconstant nk-widget-state-entered 8)
  (defconstant nk-widget-state-hover 16)
  (defconstant nk-widget-state-actived 32)
  (defconstant nk-widget-state-left 64)
  (defconstant nk-widget-state-hovered 18)
  (defconstant nk-widget-state-active 34)
)

; nk_text_align
#-ecl
(cffi:defcenum nk-text-align
  (:nk-text-align-left 1)
  (:nk-text-align-centered 2)
  (:nk-text-align-right 4)
  (:nk-text-align-top 8)
  (:nk-text-align-middle 16)
  (:nk-text-align-bottom 32)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-text-align-left 1)
  (defconstant nk-text-align-centered 2)
  (defconstant nk-text-align-right 4)
  (defconstant nk-text-align-top 8)
  (defconstant nk-text-align-middle 16)
  (defconstant nk-text-align-bottom 32)
)

; nk_text_alignment
#-ecl
(cffi:defcenum nk-text-alignment
  (:nk-text-left 17)
  (:nk-text-centered 18)
  (:nk-text-right 20)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-text-left 17)
  (defconstant nk-text-centered 18)
  (defconstant nk-text-right 20)
)

; nk_edit_flags
#-ecl
(cffi:defcenum nk-edit-flags
  (:nk-edit-default 0)
  (:nk-edit-read-only 1)
  (:nk-edit-auto-select 2)
  (:nk-edit-sig-enter 4)
  (:nk-edit-allow-tab 8)
  (:nk-edit-no-cursor 16)
  (:nk-edit-selectable 32)
  (:nk-edit-clipboard 64)
  (:nk-edit-ctrl-enter-newline 128)
  (:nk-edit-no-horizontal-scroll 256)
  (:nk-edit-always-insert-mode 512)
  (:nk-edit-multiline 1024)
  (:nk-edit-goto-end-on-activate 2048)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-edit-default 0)
  (defconstant nk-edit-read-only 1)
  (defconstant nk-edit-auto-select 2)
  (defconstant nk-edit-sig-enter 4)
  (defconstant nk-edit-allow-tab 8)
  (defconstant nk-edit-no-cursor 16)
  (defconstant nk-edit-selectable 32)
  (defconstant nk-edit-clipboard 64)
  (defconstant nk-edit-ctrl-enter-newline 128)
  (defconstant nk-edit-no-horizontal-scroll 256)
  (defconstant nk-edit-always-insert-mode 512)
  (defconstant nk-edit-multiline 1024)
  (defconstant nk-edit-goto-end-on-activate 2048)
)

; nk_edit_types
#-ecl
(cffi:defcenum nk-edit-types
  (:nk-edit-simple 512)
  (:nk-edit-field 608)
  (:nk-edit-box 1640)
  (:nk-edit-editor 1128)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-edit-simple 512)
  (defconstant nk-edit-field 608)
  (defconstant nk-edit-box 1640)
  (defconstant nk-edit-editor 1128)
)

; nk_edit_events
#-ecl
(cffi:defcenum nk-edit-events
  (:nk-edit-active 1)
  (:nk-edit-inactive 2)
  (:nk-edit-activated 4)
  (:nk-edit-deactivated 8)
  (:nk-edit-committed 16)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-edit-active 1)
  (defconstant nk-edit-inactive 2)
  (defconstant nk-edit-activated 4)
  (defconstant nk-edit-deactivated 8)
  (defconstant nk-edit-committed 16)
)

; nk_style_colors
#-ecl
(cffi:defcenum nk-style-colors
  (:nk-color-text 0)
  (:nk-color-window 1)
  (:nk-color-header 2)
  (:nk-color-border 3)
  (:nk-color-button 4)
  (:nk-color-button-hover 5)
  (:nk-color-button-active 6)
  (:nk-color-toggle 7)
  (:nk-color-toggle-hover 8)
  (:nk-color-toggle-cursor 9)
  (:nk-color-select 10)
  (:nk-color-select-active 11)
  (:nk-color-slider 12)
  (:nk-color-slider-cursor 13)
  (:nk-color-slider-cursor-hover 14)
  (:nk-color-slider-cursor-active 15)
  (:nk-color-property 16)
  (:nk-color-edit 17)
  (:nk-color-edit-cursor 18)
  (:nk-color-combo 19)
  (:nk-color-chart 20)
  (:nk-color-chart-color 21)
  (:nk-color-chart-color-highlight 22)
  (:nk-color-scrollbar 23)
  (:nk-color-scrollbar-cursor 24)
  (:nk-color-scrollbar-cursor-hover 25)
  (:nk-color-scrollbar-cursor-active 26)
  (:nk-color-tab-header 27)
  (:nk-color-knob 28)
  (:nk-color-knob-cursor 29)
  (:nk-color-knob-cursor-hover 30)
  (:nk-color-knob-cursor-active 31)
  (:nk-color-count 32)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-color-text 0)
  (defconstant nk-color-window 1)
  (defconstant nk-color-header 2)
  (defconstant nk-color-border 3)
  (defconstant nk-color-button 4)
  (defconstant nk-color-button-hover 5)
  (defconstant nk-color-button-active 6)
  (defconstant nk-color-toggle 7)
  (defconstant nk-color-toggle-hover 8)
  (defconstant nk-color-toggle-cursor 9)
  (defconstant nk-color-select 10)
  (defconstant nk-color-select-active 11)
  (defconstant nk-color-slider 12)
  (defconstant nk-color-slider-cursor 13)
  (defconstant nk-color-slider-cursor-hover 14)
  (defconstant nk-color-slider-cursor-active 15)
  (defconstant nk-color-property 16)
  (defconstant nk-color-edit 17)
  (defconstant nk-color-edit-cursor 18)
  (defconstant nk-color-combo 19)
  (defconstant nk-color-chart 20)
  (defconstant nk-color-chart-color 21)
  (defconstant nk-color-chart-color-highlight 22)
  (defconstant nk-color-scrollbar 23)
  (defconstant nk-color-scrollbar-cursor 24)
  (defconstant nk-color-scrollbar-cursor-hover 25)
  (defconstant nk-color-scrollbar-cursor-active 26)
  (defconstant nk-color-tab-header 27)
  (defconstant nk-color-knob 28)
  (defconstant nk-color-knob-cursor 29)
  (defconstant nk-color-knob-cursor-hover 30)
  (defconstant nk-color-knob-cursor-active 31)
  (defconstant nk-color-count 32)
)

; nk_style_cursor
#-ecl
(cffi:defcenum nk-style-cursor
  (:nk-cursor-arrow 0)
  (:nk-cursor-text 1)
  (:nk-cursor-move 2)
  (:nk-cursor-resize-vertical 3)
  (:nk-cursor-resize-horizontal 4)
  (:nk-cursor-resize-top-left-down-right 5)
  (:nk-cursor-resize-top-right-down-left 6)
  (:nk-cursor-count 7)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-cursor-arrow 0)
  (defconstant nk-cursor-text 1)
  (defconstant nk-cursor-move 2)
  (defconstant nk-cursor-resize-vertical 3)
  (defconstant nk-cursor-resize-horizontal 4)
  (defconstant nk-cursor-resize-top-left-down-right 5)
  (defconstant nk-cursor-resize-top-right-down-left 6)
  (defconstant nk-cursor-count 7)
)

; nk_font_coord_type
#-ecl
(cffi:defcenum nk-font-coord-type
  (:nk-coord-uv 0)
  (:nk-coord-pixel 1)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-coord-uv 0)
  (defconstant nk-coord-pixel 1)
)

; nk_font_atlas_format
#-ecl
(cffi:defcenum nk-font-atlas-format
  (:nk-font-atlas-alpha8 0)
  (:nk-font-atlas-rgba32 1)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-font-atlas-alpha8 0)
  (defconstant nk-font-atlas-rgba32 1)
)

; nk_allocation_type
#-ecl
(cffi:defcenum nk-allocation-type
  (:nk-buffer-fixed 0)
  (:nk-buffer-dynamic 1)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-buffer-fixed 0)
  (defconstant nk-buffer-dynamic 1)
)

; nk_buffer_allocation_type
#-ecl
(cffi:defcenum nk-buffer-allocation-type
  (:nk-buffer-front 0)
  (:nk-buffer-back 1)
  (:nk-buffer-max 2)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-buffer-front 0)
  (defconstant nk-buffer-back 1)
  (defconstant nk-buffer-max 2)
)

; nk_text_edit_type
#-ecl
(cffi:defcenum nk-text-edit-type
  (:nk-text-edit-single-line 0)
  (:nk-text-edit-multi-line 1)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-text-edit-single-line 0)
  (defconstant nk-text-edit-multi-line 1)
)

; nk_text_edit_mode
#-ecl
(cffi:defcenum nk-text-edit-mode
  (:nk-text-edit-mode-view 0)
  (:nk-text-edit-mode-insert 1)
  (:nk-text-edit-mode-replace 2)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-text-edit-mode-view 0)
  (defconstant nk-text-edit-mode-insert 1)
  (defconstant nk-text-edit-mode-replace 2)
)

; nk_command_type
#-ecl
(cffi:defcenum nk-command-type
  (:nk-command-nop 0)
  (:nk-command-scissor 1)
  (:nk-command-line 2)
  (:nk-command-curve 3)
  (:nk-command-rect 4)
  (:nk-command-rect-filled 5)
  (:nk-command-rect-multi-color 6)
  (:nk-command-circle 7)
  (:nk-command-circle-filled 8)
  (:nk-command-arc 9)
  (:nk-command-arc-filled 10)
  (:nk-command-triangle 11)
  (:nk-command-triangle-filled 12)
  (:nk-command-polygon 13)
  (:nk-command-polygon-filled 14)
  (:nk-command-polyline 15)
  (:nk-command-text 16)
  (:nk-command-image 17)
  (:nk-command-custom 18)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-command-nop 0)
  (defconstant nk-command-scissor 1)
  (defconstant nk-command-line 2)
  (defconstant nk-command-curve 3)
  (defconstant nk-command-rect 4)
  (defconstant nk-command-rect-filled 5)
  (defconstant nk-command-rect-multi-color 6)
  (defconstant nk-command-circle 7)
  (defconstant nk-command-circle-filled 8)
  (defconstant nk-command-arc 9)
  (defconstant nk-command-arc-filled 10)
  (defconstant nk-command-triangle 11)
  (defconstant nk-command-triangle-filled 12)
  (defconstant nk-command-polygon 13)
  (defconstant nk-command-polygon-filled 14)
  (defconstant nk-command-polyline 15)
  (defconstant nk-command-text 16)
  (defconstant nk-command-image 17)
  (defconstant nk-command-custom 18)
)

; nk_command_clipping
#-ecl
(cffi:defcenum nk-command-clipping
  (:nk-clipping-off 0)
  (:nk-clipping-on 1)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-clipping-off 0)
  (defconstant nk-clipping-on 1)
)

; nk_draw_list_stroke
#-ecl
(cffi:defcenum nk-draw-list-stroke
  (:nk-stroke-open 0)
  (:nk-stroke-closed 1)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-stroke-open 0)
  (defconstant nk-stroke-closed 1)
)

; nk_draw_vertex_layout_attribute
#-ecl
(cffi:defcenum nk-draw-vertex-layout-attribute
  (:nk-vertex-position 0)
  (:nk-vertex-color 1)
  (:nk-vertex-texcoord 2)
  (:nk-vertex-attribute-count 3)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-vertex-position 0)
  (defconstant nk-vertex-color 1)
  (defconstant nk-vertex-texcoord 2)
  (defconstant nk-vertex-attribute-count 3)
)

; nk_draw_vertex_layout_format
#-ecl
(cffi:defcenum nk-draw-vertex-layout-format
  (:nk-format-schar 0)
  (:nk-format-sshort 1)
  (:nk-format-sint 2)
  (:nk-format-uchar 3)
  (:nk-format-ushort 4)
  (:nk-format-uint 5)
  (:nk-format-float 6)
  (:nk-format-double 7)
  (:nk-format-color-begin 8)
  (:nk-format-r8g8b8 8)
  (:nk-format-r16g15b16 9)
  (:nk-format-r32g32b32 10)
  (:nk-format-r8g8b8a8 11)
  (:nk-format-b8g8r8a8 12)
  (:nk-format-r16g15b16a16 13)
  (:nk-format-r32g32b32a32 14)
  (:nk-format-r32g32b32a32-float 15)
  (:nk-format-r32g32b32a32-double 16)
  (:nk-format-rgb32 17)
  (:nk-format-rgba32 18)
  (:nk-format-color-end 18)
  (:nk-format-count 19)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-format-schar 0)
  (defconstant nk-format-sshort 1)
  (defconstant nk-format-sint 2)
  (defconstant nk-format-uchar 3)
  (defconstant nk-format-ushort 4)
  (defconstant nk-format-uint 5)
  (defconstant nk-format-float 6)
  (defconstant nk-format-double 7)
  (defconstant nk-format-color-begin 8)
  (defconstant nk-format-r8g8b8 8)
  (defconstant nk-format-r16g15b16 9)
  (defconstant nk-format-r32g32b32 10)
  (defconstant nk-format-r8g8b8a8 11)
  (defconstant nk-format-b8g8r8a8 12)
  (defconstant nk-format-r16g15b16a16 13)
  (defconstant nk-format-r32g32b32a32 14)
  (defconstant nk-format-r32g32b32a32-float 15)
  (defconstant nk-format-r32g32b32a32-double 16)
  (defconstant nk-format-rgb32 17)
  (defconstant nk-format-rgba32 18)
  (defconstant nk-format-color-end 18)
  (defconstant nk-format-count 19)
)

; nk_style_item_type
#-ecl
(cffi:defcenum nk-style-item-type
  (:nk-style-item-color 0)
  (:nk-style-item-image 1)
  (:nk-style-item-nine-slice 2)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-style-item-color 0)
  (defconstant nk-style-item-image 1)
  (defconstant nk-style-item-nine-slice 2)
)

; nk_style_header_align
#-ecl
(cffi:defcenum nk-style-header-align
  (:nk-header-left 0)
  (:nk-header-right 1)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-header-left 0)
  (defconstant nk-header-right 1)
)

; nk_panel_type
#-ecl
(cffi:defcenum nk-panel-type
  (:nk-panel-none 0)
  (:nk-panel-window 1)
  (:nk-panel-group 2)
  (:nk-panel-popup 4)
  (:nk-panel-contextual 16)
  (:nk-panel-combo 32)
  (:nk-panel-menu 64)
  (:nk-panel-tooltip 128)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-panel-none 0)
  (defconstant nk-panel-window 1)
  (defconstant nk-panel-group 2)
  (defconstant nk-panel-popup 4)
  (defconstant nk-panel-contextual 16)
  (defconstant nk-panel-combo 32)
  (defconstant nk-panel-menu 64)
  (defconstant nk-panel-tooltip 128)
)

; nk_panel_set
#-ecl
(cffi:defcenum nk-panel-set
  (:nk-panel-set-nonblock 240)
  (:nk-panel-set-popup 244)
  (:nk-panel-set-sub 246)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-panel-set-nonblock 240)
  (defconstant nk-panel-set-popup 244)
  (defconstant nk-panel-set-sub 246)
)

; nk_panel_row_layout_type
#-ecl
(cffi:defcenum nk-panel-row-layout-type
  (:nk-layout-dynamic-fixed 0)
  (:nk-layout-dynamic-row 1)
  (:nk-layout-dynamic-free 2)
  (:nk-layout-dynamic 3)
  (:nk-layout-static-fixed 4)
  (:nk-layout-static-row 5)
  (:nk-layout-static-free 6)
  (:nk-layout-static 7)
  (:nk-layout-template 8)
  (:nk-layout-count 9)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-layout-dynamic-fixed 0)
  (defconstant nk-layout-dynamic-row 1)
  (defconstant nk-layout-dynamic-free 2)
  (defconstant nk-layout-dynamic 3)
  (defconstant nk-layout-static-fixed 4)
  (defconstant nk-layout-static-row 5)
  (defconstant nk-layout-static-free 6)
  (defconstant nk-layout-static 7)
  (defconstant nk-layout-template 8)
  (defconstant nk-layout-count 9)
)

; nk_window_flags
#-ecl
(cffi:defcenum nk-window-flags
  (:nk-window-private 2048)
  (:nk-window-dynamic 2048)
  (:nk-window-rom 4096)
  (:nk-window-not-interactive 5120)
  (:nk-window-hidden 8192)
  (:nk-window-closed 16384)
  (:nk-window-minimized 32768)
  (:nk-window-remove-rom 65536)
)
#+ecl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant nk-window-private 2048)
  (defconstant nk-window-dynamic 2048)
  (defconstant nk-window-rom 4096)
  (defconstant nk-window-not-interactive 5120)
  (defconstant nk-window-hidden 8192)
  (defconstant nk-window-closed 16384)
  (defconstant nk-window-minimized 32768)
  (defconstant nk-window-remove-rom 65536)
)
