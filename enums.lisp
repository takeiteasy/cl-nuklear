(in-package :nuklear)

;;; Enumerations

(defconstant nk-false 0)
(defconstant nk-true 1)

(cffi:defcenum nk-heading
  (:nk-up 0)
  (:nk-right 1)
  (:nk-down 2)
  (:nk-left 3)
)

(cffi:defcenum nk-button-behavior
  (:nk-button-default 0)
  (:nk-button-repeater 1)
)

(cffi:defcenum nk-modify
  (:nk-fixed 0)
  (:nk-modifiable 1)
)

(cffi:defcenum nk-orientation
  (:nk-vertical 0)
  (:nk-horizontal 1)
)

(cffi:defcenum nk-collapse-states
  (:nk-minimized 0)
  (:nk-maximized 1)
)

(cffi:defcenum nk-show-states
  (:nk-hidden 0)
  (:nk-shown 1)
)

(cffi:defcenum nk-chart-type
  (:nk-chart-lines 0)
  (:nk-chart-column 1)
  (:nk-chart-max 2)
)

(cffi:defcenum nk-chart-event
  (:nk-chart-hovering 1)
  (:nk-chart-clicked 2)
)

(cffi:defcenum nk-color-format
  (:nk-rgb 0)
  (:nk-rgba 1)
)

(cffi:defcenum nk-popup-type
  (:nk-popup-static 0)
  (:nk-popup-dynamic 1)
)

(cffi:defcenum nk-layout-format
  (:nk-dynamic 0)
  (:nk-static 1)
)

(cffi:defcenum nk-tree-type
  (:nk-tree-node 0)
  (:nk-tree-tab 1)
)

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

(cffi:defcenum nk-buttons
  (:nk-button-left 0)
  (:nk-button-middle 1)
  (:nk-button-right 2)
  (:nk-button-double 3)
  (:nk-button-x1 4)
  (:nk-button-x2 5)
  (:nk-button-max 6)
)

(cffi:defcenum nk-anti-aliasing
  (:nk-anti-aliasing-off 0)
  (:nk-anti-aliasing-on 1)
)

(cffi:defcenum nk-convert-result
  (:nk-convert-success 0)
  (:nk-convert-invalid-param 1)
  (:nk-convert-command-buffer-full 2)
  (:nk-convert-vertex-buffer-full 4)
  (:nk-convert-element-buffer-full 8)
)

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

(cffi:defcenum nk-widget-align
  (:nk-widget-align-left 1)
  (:nk-widget-align-centered 2)
  (:nk-widget-align-right 4)
  (:nk-widget-align-top 8)
  (:nk-widget-align-middle 16)
  (:nk-widget-align-bottom 32)
)

(cffi:defcenum nk-widget-alignment
  (:nk-widget-left 17)
  (:nk-widget-centered 18)
  (:nk-widget-right 20)
)

(cffi:defcenum nk-widget-layout-states
  (:nk-widget-invalid 0)
  (:nk-widget-valid 1)
  (:nk-widget-rom 2)
  (:nk-widget-disabled 3)
)

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

(cffi:defcenum nk-text-align
  (:nk-text-align-left 1)
  (:nk-text-align-centered 2)
  (:nk-text-align-right 4)
  (:nk-text-align-top 8)
  (:nk-text-align-middle 16)
  (:nk-text-align-bottom 32)
)

(cffi:defcenum nk-text-alignment
  (:nk-text-left 17)
  (:nk-text-centered 18)
  (:nk-text-right 20)
)

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

(cffi:defcenum nk-edit-types
  (:nk-edit-simple 512)
  (:nk-edit-field 608)
  (:nk-edit-box 1640)
  (:nk-edit-editor 1128)
)

(cffi:defcenum nk-edit-events
  (:nk-edit-active 1)
  (:nk-edit-inactive 2)
  (:nk-edit-activated 4)
  (:nk-edit-deactivated 8)
  (:nk-edit-committed 16)
)

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

(cffi:defcenum nk-font-coord-type
  (:nk-coord-uv 0)
  (:nk-coord-pixel 1)
)

(cffi:defcenum nk-font-atlas-format
  (:nk-font-atlas-alpha8 0)
  (:nk-font-atlas-rgba32 1)
)

(cffi:defcenum nk-allocation-type
  (:nk-buffer-fixed 0)
  (:nk-buffer-dynamic 1)
)

(cffi:defcenum nk-buffer-allocation-type
  (:nk-buffer-front 0)
  (:nk-buffer-back 1)
  (:nk-buffer-max 2)
)

(cffi:defcenum nk-text-edit-type
  (:nk-text-edit-single-line 0)
  (:nk-text-edit-multi-line 1)
)

(cffi:defcenum nk-text-edit-mode
  (:nk-text-edit-mode-view 0)
  (:nk-text-edit-mode-insert 1)
  (:nk-text-edit-mode-replace 2)
)

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

(cffi:defcenum nk-command-clipping
  (:nk-clipping-off 0)
  (:nk-clipping-on 1)
)

(cffi:defcenum nk-draw-list-stroke
  (:nk-stroke-open 0)
  (:nk-stroke-closed 1)
)

(cffi:defcenum nk-draw-vertex-layout-attribute
  (:nk-vertex-position 0)
  (:nk-vertex-color 1)
  (:nk-vertex-texcoord 2)
  (:nk-vertex-attribute-count 3)
)

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

(cffi:defcenum nk-style-item-type
  (:nk-style-item-color 0)
  (:nk-style-item-image 1)
  (:nk-style-item-nine-slice 2)
)

(cffi:defcenum nk-style-header-align
  (:nk-header-left 0)
  (:nk-header-right 1)
)

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

(cffi:defcenum nk-panel-set
  (:nk-panel-set-nonblock 240)
  (:nk-panel-set-popup 244)
  (:nk-panel-set-sub 246)
)

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
