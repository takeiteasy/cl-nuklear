/* nuklear_shims.c — Auto-generated C wrappers for struct-by-value functions.
 * Do not edit by hand — regenerate with:
 *   python nuklear2json.py nuklear.h nuklear_api.json
 *   python bindings2lisp.py nuklear_api.json .
 *
 * Compile with -I<path-to-nuklear.h-dir>.
 */

#define NK_INCLUDE_FIXED_TYPES
#define NK_INCLUDE_DEFAULT_ALLOCATOR
#define NK_INCLUDE_STANDARD_IO
#define NK_INCLUDE_STANDARD_VARARGS
#define NK_INCLUDE_VERTEX_BUFFER_OUTPUT
#define NK_INCLUDE_FONT_BAKING
#define NK_INCLUDE_DEFAULT_FONT
#define NK_INCLUDE_COMMAND_USERDATA
#define NK_IMPLEMENTATION
#include "nuklear.h"

void cl_nk_set_user_data(struct nk_context* arg0, nk_handle* handle)
{
    nk_set_user_data(arg0, *handle);
}

void cl_nk_input_scroll(struct nk_context* arg0, struct nk_vec2* val)
{
    nk_input_scroll(arg0, *val);
}

nk_bool cl_nk_begin(struct nk_context* ctx, const char* title, struct nk_rect* bounds, nk_flags flags)
{
    return nk_begin(ctx, title, *bounds, flags);
}

nk_bool cl_nk_begin_titled(struct nk_context* ctx, const char* name, const char* title, struct nk_rect* bounds, nk_flags flags)
{
    return nk_begin_titled(ctx, name, title, *bounds, flags);
}

void cl_nk_window_get_bounds(struct nk_context* ctx, struct nk_rect* result_out)
{
    *result_out = nk_window_get_bounds(ctx);
}

void cl_nk_window_get_position(struct nk_context* ctx, struct nk_vec2* result_out)
{
    *result_out = nk_window_get_position(ctx);
}

void cl_nk_window_get_size(struct nk_context* ctx, struct nk_vec2* result_out)
{
    *result_out = nk_window_get_size(ctx);
}

void cl_nk_window_get_content_region(struct nk_context* ctx, struct nk_rect* result_out)
{
    *result_out = nk_window_get_content_region(ctx);
}

void cl_nk_window_get_content_region_min(struct nk_context* ctx, struct nk_vec2* result_out)
{
    *result_out = nk_window_get_content_region_min(ctx);
}

void cl_nk_window_get_content_region_max(struct nk_context* ctx, struct nk_vec2* result_out)
{
    *result_out = nk_window_get_content_region_max(ctx);
}

void cl_nk_window_get_content_region_size(struct nk_context* ctx, struct nk_vec2* result_out)
{
    *result_out = nk_window_get_content_region_size(ctx);
}

void cl_nk_window_set_bounds(struct nk_context* ctx, const char* name, struct nk_rect* bounds)
{
    nk_window_set_bounds(ctx, name, *bounds);
}

void cl_nk_window_set_position(struct nk_context* ctx, const char* name, struct nk_vec2* pos)
{
    nk_window_set_position(ctx, name, *pos);
}

void cl_nk_window_set_size(struct nk_context* ctx, const char* name, struct nk_vec2* size)
{
    nk_window_set_size(ctx, name, *size);
}

void cl_nk_rule_horizontal(struct nk_context* ctx, struct nk_color* color, nk_bool rounding)
{
    nk_rule_horizontal(ctx, *color, rounding);
}

void cl_nk_layout_widget_bounds(struct nk_context* ctx, struct nk_rect* result_out)
{
    *result_out = nk_layout_widget_bounds(ctx);
}

void cl_nk_layout_space_push(struct nk_context* arg0, struct nk_rect* bounds)
{
    nk_layout_space_push(arg0, *bounds);
}

void cl_nk_layout_space_bounds(struct nk_context* ctx, struct nk_rect* result_out)
{
    *result_out = nk_layout_space_bounds(ctx);
}

void cl_nk_layout_space_to_screen(struct nk_context* ctx, struct nk_vec2* vec, struct nk_vec2* result_out)
{
    *result_out = nk_layout_space_to_screen(ctx, *vec);
}

void cl_nk_layout_space_to_local(struct nk_context* ctx, struct nk_vec2* vec, struct nk_vec2* result_out)
{
    *result_out = nk_layout_space_to_local(ctx, *vec);
}

void cl_nk_layout_space_rect_to_screen(struct nk_context* ctx, struct nk_rect* bounds, struct nk_rect* result_out)
{
    *result_out = nk_layout_space_rect_to_screen(ctx, *bounds);
}

void cl_nk_layout_space_rect_to_local(struct nk_context* ctx, struct nk_rect* bounds, struct nk_rect* result_out)
{
    *result_out = nk_layout_space_rect_to_local(ctx, *bounds);
}

nk_bool cl_nk_tree_image_push_hashed(struct nk_context* arg0, enum nk_tree_type arg1, struct nk_image* arg2, const char* title, enum nk_collapse_states initial_state, const char* hash, int len, int seed)
{
    return nk_tree_image_push_hashed(arg0, arg1, *arg2, title, initial_state, hash, len, seed);
}

nk_bool cl_nk_tree_state_image_push(struct nk_context* arg0, enum nk_tree_type arg1, struct nk_image* arg2, const char* title, enum nk_collapse_states* state)
{
    return nk_tree_state_image_push(arg0, arg1, *arg2, title, state);
}

nk_bool cl_nk_tree_element_image_push_hashed(struct nk_context* arg0, enum nk_tree_type arg1, struct nk_image* arg2, const char* title, enum nk_collapse_states initial_state, nk_bool* selected, const char* hash, int len, int seed)
{
    return nk_tree_element_image_push_hashed(arg0, arg1, *arg2, title, initial_state, selected, hash, len, seed);
}

void cl_nk_widget_bounds(struct nk_context* arg0, struct nk_rect* result_out)
{
    *result_out = nk_widget_bounds(arg0);
}

void cl_nk_widget_position(struct nk_context* arg0, struct nk_vec2* result_out)
{
    *result_out = nk_widget_position(arg0);
}

void cl_nk_widget_size(struct nk_context* arg0, struct nk_vec2* result_out)
{
    *result_out = nk_widget_size(arg0);
}

void cl_nk_text_colored(struct nk_context* arg0, const char* arg1, int arg2, nk_flags arg3, struct nk_color* arg4)
{
    nk_text_colored(arg0, arg1, arg2, arg3, *arg4);
}

void cl_nk_text_wrap_colored(struct nk_context* arg0, const char* arg1, int arg2, struct nk_color* arg3)
{
    nk_text_wrap_colored(arg0, arg1, arg2, *arg3);
}

void cl_nk_label_colored(struct nk_context* arg0, const char* arg1, nk_flags align, struct nk_color* arg3)
{
    nk_label_colored(arg0, arg1, align, *arg3);
}

void cl_nk_label_colored_wrap(struct nk_context* arg0, const char* arg1, struct nk_color* arg2)
{
    nk_label_colored_wrap(arg0, arg1, *arg2);
}

void cl_nk_image(struct nk_context* arg0, struct nk_image* arg1)
{
    nk_image(arg0, *arg1);
}

void cl_nk_image_color(struct nk_context* arg0, struct nk_image* arg1, struct nk_color* arg2)
{
    nk_image_color(arg0, *arg1, *arg2);
}

void cl_nk_labelfv_colored(struct nk_context* arg0, nk_flags arg1, struct nk_color* arg2, const char* arg3, va_list arg4)
{
    nk_labelfv_colored(arg0, arg1, *arg2, arg3, arg4);
}

void cl_nk_labelfv_colored_wrap(struct nk_context* arg0, struct nk_color* arg1, const char* arg2, va_list arg3)
{
    nk_labelfv_colored_wrap(arg0, *arg1, arg2, arg3);
}

void cl_nk_value_color_byte(struct nk_context* arg0, const char* prefix, struct nk_color* arg2)
{
    nk_value_color_byte(arg0, prefix, *arg2);
}

void cl_nk_value_color_float(struct nk_context* arg0, const char* prefix, struct nk_color* arg2)
{
    nk_value_color_float(arg0, prefix, *arg2);
}

void cl_nk_value_color_hex(struct nk_context* arg0, const char* prefix, struct nk_color* arg2)
{
    nk_value_color_hex(arg0, prefix, *arg2);
}

nk_bool cl_nk_button_color(struct nk_context* arg0, struct nk_color* arg1)
{
    return nk_button_color(arg0, *arg1);
}

nk_bool cl_nk_button_image(struct nk_context* arg0, struct nk_image* img)
{
    return nk_button_image(arg0, *img);
}

nk_bool cl_nk_button_image_label(struct nk_context* arg0, struct nk_image* img, const char* arg2, nk_flags text_alignment)
{
    return nk_button_image_label(arg0, *img, arg2, text_alignment);
}

nk_bool cl_nk_button_image_text(struct nk_context* arg0, struct nk_image* img, const char* arg2, int arg3, nk_flags alignment)
{
    return nk_button_image_text(arg0, *img, arg2, arg3, alignment);
}

nk_bool cl_nk_button_image_styled(struct nk_context* arg0, struct nk_style_button* arg1, struct nk_image* img)
{
    return nk_button_image_styled(arg0, arg1, *img);
}

nk_bool cl_nk_button_image_label_styled(struct nk_context* arg0, struct nk_style_button* arg1, struct nk_image* img, const char* arg3, nk_flags text_alignment)
{
    return nk_button_image_label_styled(arg0, arg1, *img, arg3, text_alignment);
}

nk_bool cl_nk_button_image_text_styled(struct nk_context* arg0, struct nk_style_button* arg1, struct nk_image* img, const char* arg3, int arg4, nk_flags alignment)
{
    return nk_button_image_text_styled(arg0, arg1, *img, arg3, arg4, alignment);
}

nk_bool cl_nk_selectable_image_label(struct nk_context* arg0, struct nk_image* arg1, const char* arg2, nk_flags align, nk_bool* value)
{
    return nk_selectable_image_label(arg0, *arg1, arg2, align, value);
}

nk_bool cl_nk_selectable_image_text(struct nk_context* arg0, struct nk_image* arg1, const char* arg2, int arg3, nk_flags align, nk_bool* value)
{
    return nk_selectable_image_text(arg0, *arg1, arg2, arg3, align, value);
}

nk_bool cl_nk_select_image_label(struct nk_context* arg0, struct nk_image* arg1, const char* arg2, nk_flags align, nk_bool value)
{
    return nk_select_image_label(arg0, *arg1, arg2, align, value);
}

nk_bool cl_nk_select_image_text(struct nk_context* arg0, struct nk_image* arg1, const char* arg2, int arg3, nk_flags align, nk_bool value)
{
    return nk_select_image_text(arg0, *arg1, arg2, arg3, align, value);
}

void cl_nk_color_picker(struct nk_context* arg0, struct nk_colorf* arg1, enum nk_color_format arg2, struct nk_colorf* result_out)
{
    *result_out = nk_color_picker(arg0, *arg1, arg2);
}

nk_bool cl_nk_chart_begin_colored(struct nk_context* arg0, enum nk_chart_type arg1, struct nk_color* arg2, struct nk_color* active, int num, float min, float max)
{
    return nk_chart_begin_colored(arg0, arg1, *arg2, *active, num, min, max);
}

void cl_nk_chart_add_slot_colored(struct nk_context* ctx, enum nk_chart_type arg1, struct nk_color* arg2, struct nk_color* active, int count, float min_value, float max_value)
{
    nk_chart_add_slot_colored(ctx, arg1, *arg2, *active, count, min_value, max_value);
}

nk_bool cl_nk_popup_begin(struct nk_context* arg0, enum nk_popup_type arg1, const char* arg2, nk_flags arg3, struct nk_rect* bounds)
{
    return nk_popup_begin(arg0, arg1, arg2, arg3, *bounds);
}

int cl_nk_combo(struct nk_context* arg0, const char* const* items, int count, int selected, int item_height, struct nk_vec2* size)
{
    return nk_combo(arg0, items, count, selected, item_height, *size);
}

int cl_nk_combo_separator(struct nk_context* arg0, const char* items_separated_by_separator, int separator, int selected, int count, int item_height, struct nk_vec2* size)
{
    return nk_combo_separator(arg0, items_separated_by_separator, separator, selected, count, item_height, *size);
}

int cl_nk_combo_string(struct nk_context* arg0, const char* items_separated_by_zeros, int selected, int count, int item_height, struct nk_vec2* size)
{
    return nk_combo_string(arg0, items_separated_by_zeros, selected, count, item_height, *size);
}

int cl_nk_combo_callback(struct nk_context* arg0, void* item_getter, void* userdata, int selected, int count, int item_height, struct nk_vec2* size)
{
    return nk_combo_callback(arg0, item_getter, userdata, selected, count, item_height, *size);
}

nk_bool cl_nk_combobox(struct nk_context* arg0, const char* const* items, int count, int* selected, int item_height, struct nk_vec2* size)
{
    return nk_combobox(arg0, items, count, selected, item_height, *size);
}

nk_bool cl_nk_combobox_string(struct nk_context* arg0, const char* items_separated_by_zeros, int* selected, int count, int item_height, struct nk_vec2* size)
{
    return nk_combobox_string(arg0, items_separated_by_zeros, selected, count, item_height, *size);
}

nk_bool cl_nk_combobox_separator(struct nk_context* arg0, const char* items_separated_by_separator, int separator, int* selected, int count, int item_height, struct nk_vec2* size)
{
    return nk_combobox_separator(arg0, items_separated_by_separator, separator, selected, count, item_height, *size);
}

nk_bool cl_nk_combobox_callback(struct nk_context* arg0, void* item_getter, void* arg2, int* selected, int count, int item_height, struct nk_vec2* size)
{
    return nk_combobox_callback(arg0, item_getter, arg2, selected, count, item_height, *size);
}

nk_bool cl_nk_combo_begin_text(struct nk_context* arg0, const char* selected, int arg2, struct nk_vec2* size)
{
    return nk_combo_begin_text(arg0, selected, arg2, *size);
}

nk_bool cl_nk_combo_begin_label(struct nk_context* arg0, const char* selected, struct nk_vec2* size)
{
    return nk_combo_begin_label(arg0, selected, *size);
}

nk_bool cl_nk_combo_begin_color(struct nk_context* arg0, struct nk_color* color, struct nk_vec2* size)
{
    return nk_combo_begin_color(arg0, *color, *size);
}

nk_bool cl_nk_combo_begin_symbol(struct nk_context* arg0, enum nk_symbol_type arg1, struct nk_vec2* size)
{
    return nk_combo_begin_symbol(arg0, arg1, *size);
}

nk_bool cl_nk_combo_begin_symbol_label(struct nk_context* arg0, const char* selected, enum nk_symbol_type arg2, struct nk_vec2* size)
{
    return nk_combo_begin_symbol_label(arg0, selected, arg2, *size);
}

nk_bool cl_nk_combo_begin_symbol_text(struct nk_context* arg0, const char* selected, int arg2, enum nk_symbol_type arg3, struct nk_vec2* size)
{
    return nk_combo_begin_symbol_text(arg0, selected, arg2, arg3, *size);
}

nk_bool cl_nk_combo_begin_image(struct nk_context* arg0, struct nk_image* img, struct nk_vec2* size)
{
    return nk_combo_begin_image(arg0, *img, *size);
}

nk_bool cl_nk_combo_begin_image_label(struct nk_context* arg0, const char* selected, struct nk_image* arg2, struct nk_vec2* size)
{
    return nk_combo_begin_image_label(arg0, selected, *arg2, *size);
}

nk_bool cl_nk_combo_begin_image_text(struct nk_context* arg0, const char* selected, int arg2, struct nk_image* arg3, struct nk_vec2* size)
{
    return nk_combo_begin_image_text(arg0, selected, arg2, *arg3, *size);
}

nk_bool cl_nk_combo_item_image_label(struct nk_context* arg0, struct nk_image* arg1, const char* arg2, nk_flags alignment)
{
    return nk_combo_item_image_label(arg0, *arg1, arg2, alignment);
}

nk_bool cl_nk_combo_item_image_text(struct nk_context* arg0, struct nk_image* arg1, const char* arg2, int arg3, nk_flags alignment)
{
    return nk_combo_item_image_text(arg0, *arg1, arg2, arg3, alignment);
}

nk_bool cl_nk_contextual_begin(struct nk_context* arg0, nk_flags arg1, struct nk_vec2* arg2, struct nk_rect* trigger_bounds)
{
    return nk_contextual_begin(arg0, arg1, *arg2, *trigger_bounds);
}

nk_bool cl_nk_contextual_item_image_label(struct nk_context* arg0, struct nk_image* arg1, const char* arg2, nk_flags alignment)
{
    return nk_contextual_item_image_label(arg0, *arg1, arg2, alignment);
}

nk_bool cl_nk_contextual_item_image_text(struct nk_context* arg0, struct nk_image* arg1, const char* arg2, int len, nk_flags alignment)
{
    return nk_contextual_item_image_text(arg0, *arg1, arg2, len, alignment);
}

void cl_nk_tooltip_offset(struct nk_context* ctx, const char* text, enum nk_tooltip_pos position, struct nk_vec2* offset)
{
    nk_tooltip_offset(ctx, text, position, *offset);
}

void cl_nk_do_tooltip(struct nk_context* arg0, const char* arg1, struct nk_rect* arg2)
{
    nk_do_tooltip(arg0, arg1, *arg2);
}

void cl_nk_do_tooltip_delay(struct nk_context* arg0, const char* arg1, struct nk_rect* arg2, float* arg3)
{
    nk_do_tooltip_delay(arg0, arg1, *arg2, arg3);
}

void cl_nk_do_tooltip_delay_clicked(struct nk_context* arg0, const char* arg1, struct nk_rect* arg2, float* timer, nk_bool* arg4)
{
    nk_do_tooltip_delay_clicked(arg0, arg1, *arg2, timer, arg4);
}

void cl_nk_tooltipfv_offset(struct nk_context* arg0, enum nk_tooltip_pos arg1, struct nk_vec2* arg2, const char* arg3, va_list arg4)
{
    nk_tooltipfv_offset(arg0, arg1, *arg2, arg3, arg4);
}

nk_bool cl_nk_tooltip_begin_offset(struct nk_context* arg0, float arg1, enum nk_tooltip_pos arg2, struct nk_vec2* arg3)
{
    return nk_tooltip_begin_offset(arg0, arg1, arg2, *arg3);
}

nk_bool cl_nk_menu_begin_text(struct nk_context* arg0, const char* title, int title_len, nk_flags align, struct nk_vec2* size)
{
    return nk_menu_begin_text(arg0, title, title_len, align, *size);
}

nk_bool cl_nk_menu_begin_label(struct nk_context* arg0, const char* arg1, nk_flags align, struct nk_vec2* size)
{
    return nk_menu_begin_label(arg0, arg1, align, *size);
}

nk_bool cl_nk_menu_begin_image(struct nk_context* arg0, const char* arg1, struct nk_image* arg2, struct nk_vec2* size)
{
    return nk_menu_begin_image(arg0, arg1, *arg2, *size);
}

nk_bool cl_nk_menu_begin_image_text(struct nk_context* arg0, const char* arg1, int arg2, nk_flags align, struct nk_image* arg4, struct nk_vec2* size)
{
    return nk_menu_begin_image_text(arg0, arg1, arg2, align, *arg4, *size);
}

nk_bool cl_nk_menu_begin_image_label(struct nk_context* arg0, const char* arg1, nk_flags align, struct nk_image* arg3, struct nk_vec2* size)
{
    return nk_menu_begin_image_label(arg0, arg1, align, *arg3, *size);
}

nk_bool cl_nk_menu_begin_symbol(struct nk_context* arg0, const char* arg1, enum nk_symbol_type arg2, struct nk_vec2* size)
{
    return nk_menu_begin_symbol(arg0, arg1, arg2, *size);
}

nk_bool cl_nk_menu_begin_symbol_text(struct nk_context* arg0, const char* arg1, int arg2, nk_flags align, enum nk_symbol_type arg4, struct nk_vec2* size)
{
    return nk_menu_begin_symbol_text(arg0, arg1, arg2, align, arg4, *size);
}

nk_bool cl_nk_menu_begin_symbol_label(struct nk_context* arg0, const char* arg1, nk_flags align, enum nk_symbol_type arg3, struct nk_vec2* size)
{
    return nk_menu_begin_symbol_label(arg0, arg1, align, arg3, *size);
}

nk_bool cl_nk_menu_item_image_label(struct nk_context* arg0, struct nk_image* arg1, const char* arg2, nk_flags alignment)
{
    return nk_menu_item_image_label(arg0, *arg1, arg2, alignment);
}

nk_bool cl_nk_menu_item_image_text(struct nk_context* arg0, struct nk_image* arg1, const char* arg2, int len, nk_flags alignment)
{
    return nk_menu_item_image_text(arg0, *arg1, arg2, len, alignment);
}

nk_bool cl_nk_style_push_vec2(struct nk_context* arg0, struct nk_vec2* arg1, struct nk_vec2* arg2)
{
    return nk_style_push_vec2(arg0, arg1, *arg2);
}

nk_bool cl_nk_style_push_style_item(struct nk_context* arg0, struct nk_style_item* arg1, struct nk_style_item* arg2)
{
    return nk_style_push_style_item(arg0, arg1, *arg2);
}

nk_bool cl_nk_style_push_color(struct nk_context* arg0, struct nk_color* arg1, struct nk_color* arg2)
{
    return nk_style_push_color(arg0, arg1, *arg2);
}

void cl_nk_rgb(int r, int g, int b, struct nk_color* result_out)
{
    *result_out = nk_rgb(r, g, b);
}

void cl_nk_rgb_iv(const int* rgb, struct nk_color* result_out)
{
    *result_out = nk_rgb_iv(rgb);
}

void cl_nk_rgb_bv(nk_byte* rgb, struct nk_color* result_out)
{
    *result_out = nk_rgb_bv(rgb);
}

void cl_nk_rgb_f(float r, float g, float b, struct nk_color* result_out)
{
    *result_out = nk_rgb_f(r, g, b);
}

void cl_nk_rgb_fv(const float* rgb, struct nk_color* result_out)
{
    *result_out = nk_rgb_fv(rgb);
}

void cl_nk_rgb_cf(struct nk_colorf* c, struct nk_color* result_out)
{
    *result_out = nk_rgb_cf(*c);
}

void cl_nk_rgb_hex(const char* rgb, struct nk_color* result_out)
{
    *result_out = nk_rgb_hex(rgb);
}

void cl_nk_rgb_factor(struct nk_color* col, float factor, struct nk_color* result_out)
{
    *result_out = nk_rgb_factor(*col, factor);
}

void cl_nk_rgba(int r, int g, int b, int a, struct nk_color* result_out)
{
    *result_out = nk_rgba(r, g, b, a);
}

void cl_nk_rgba_u32(nk_uint arg0, struct nk_color* result_out)
{
    *result_out = nk_rgba_u32(arg0);
}

void cl_nk_rgba_iv(const int* rgba, struct nk_color* result_out)
{
    *result_out = nk_rgba_iv(rgba);
}

void cl_nk_rgba_bv(nk_byte* rgba, struct nk_color* result_out)
{
    *result_out = nk_rgba_bv(rgba);
}

void cl_nk_rgba_f(float r, float g, float b, float a, struct nk_color* result_out)
{
    *result_out = nk_rgba_f(r, g, b, a);
}

void cl_nk_rgba_fv(const float* rgba, struct nk_color* result_out)
{
    *result_out = nk_rgba_fv(rgba);
}

void cl_nk_rgba_cf(struct nk_colorf* c, struct nk_color* result_out)
{
    *result_out = nk_rgba_cf(*c);
}

void cl_nk_rgba_hex(const char* rgb, struct nk_color* result_out)
{
    *result_out = nk_rgba_hex(rgb);
}

void cl_nk_hsva_colorf(float h, float s, float v, float a, struct nk_colorf* result_out)
{
    *result_out = nk_hsva_colorf(h, s, v, a);
}

void cl_nk_hsva_colorfv(const float* c, struct nk_colorf* result_out)
{
    *result_out = nk_hsva_colorfv(c);
}

void cl_nk_colorf_hsva_f(float* out_h, float* out_s, float* out_v, float* out_a, struct nk_colorf* in)
{
    nk_colorf_hsva_f(out_h, out_s, out_v, out_a, *in);
}

void cl_nk_colorf_hsva_fv(float* hsva, struct nk_colorf* in)
{
    nk_colorf_hsva_fv(hsva, *in);
}

void cl_nk_hsv(int h, int s, int v, struct nk_color* result_out)
{
    *result_out = nk_hsv(h, s, v);
}

void cl_nk_hsv_iv(const int* hsv, struct nk_color* result_out)
{
    *result_out = nk_hsv_iv(hsv);
}

void cl_nk_hsv_bv(nk_byte* hsv, struct nk_color* result_out)
{
    *result_out = nk_hsv_bv(hsv);
}

void cl_nk_hsv_f(float h, float s, float v, struct nk_color* result_out)
{
    *result_out = nk_hsv_f(h, s, v);
}

void cl_nk_hsv_fv(const float* hsv, struct nk_color* result_out)
{
    *result_out = nk_hsv_fv(hsv);
}

void cl_nk_hsva(int h, int s, int v, int a, struct nk_color* result_out)
{
    *result_out = nk_hsva(h, s, v, a);
}

void cl_nk_hsva_iv(const int* hsva, struct nk_color* result_out)
{
    *result_out = nk_hsva_iv(hsva);
}

void cl_nk_hsva_bv(nk_byte* hsva, struct nk_color* result_out)
{
    *result_out = nk_hsva_bv(hsva);
}

void cl_nk_hsva_f(float h, float s, float v, float a, struct nk_color* result_out)
{
    *result_out = nk_hsva_f(h, s, v, a);
}

void cl_nk_hsva_fv(const float* hsva, struct nk_color* result_out)
{
    *result_out = nk_hsva_fv(hsva);
}

void cl_nk_color_f(float* r, float* g, float* b, float* a, struct nk_color* arg4)
{
    nk_color_f(r, g, b, a, *arg4);
}

void cl_nk_color_fv(float* rgba_out, struct nk_color* arg1)
{
    nk_color_fv(rgba_out, *arg1);
}

void cl_nk_color_cf(struct nk_color* arg0, struct nk_colorf* result_out)
{
    *result_out = nk_color_cf(*arg0);
}

void cl_nk_color_d(double* r, double* g, double* b, double* a, struct nk_color* arg4)
{
    nk_color_d(r, g, b, a, *arg4);
}

void cl_nk_color_dv(double* rgba_out, struct nk_color* arg1)
{
    nk_color_dv(rgba_out, *arg1);
}

nk_uint cl_nk_color_u32(struct nk_color* arg0)
{
    return nk_color_u32(*arg0);
}

void cl_nk_color_hex_rgba(char* output, struct nk_color* arg1)
{
    nk_color_hex_rgba(output, *arg1);
}

void cl_nk_color_hex_rgb(char* output, struct nk_color* arg1)
{
    nk_color_hex_rgb(output, *arg1);
}

void cl_nk_color_hsv_i(int* out_h, int* out_s, int* out_v, struct nk_color* arg3)
{
    nk_color_hsv_i(out_h, out_s, out_v, *arg3);
}

void cl_nk_color_hsv_b(nk_byte* out_h, nk_byte* out_s, nk_byte* out_v, struct nk_color* arg3)
{
    nk_color_hsv_b(out_h, out_s, out_v, *arg3);
}

void cl_nk_color_hsv_iv(int* hsv_out, struct nk_color* arg1)
{
    nk_color_hsv_iv(hsv_out, *arg1);
}

void cl_nk_color_hsv_bv(nk_byte* hsv_out, struct nk_color* arg1)
{
    nk_color_hsv_bv(hsv_out, *arg1);
}

void cl_nk_color_hsv_f(float* out_h, float* out_s, float* out_v, struct nk_color* arg3)
{
    nk_color_hsv_f(out_h, out_s, out_v, *arg3);
}

void cl_nk_color_hsv_fv(float* hsv_out, struct nk_color* arg1)
{
    nk_color_hsv_fv(hsv_out, *arg1);
}

void cl_nk_color_hsva_i(int* h, int* s, int* v, int* a, struct nk_color* arg4)
{
    nk_color_hsva_i(h, s, v, a, *arg4);
}

void cl_nk_color_hsva_b(nk_byte* h, nk_byte* s, nk_byte* v, nk_byte* a, struct nk_color* arg4)
{
    nk_color_hsva_b(h, s, v, a, *arg4);
}

void cl_nk_color_hsva_iv(int* hsva_out, struct nk_color* arg1)
{
    nk_color_hsva_iv(hsva_out, *arg1);
}

void cl_nk_color_hsva_bv(nk_byte* hsva_out, struct nk_color* arg1)
{
    nk_color_hsva_bv(hsva_out, *arg1);
}

void cl_nk_color_hsva_f(float* out_h, float* out_s, float* out_v, float* out_a, struct nk_color* arg4)
{
    nk_color_hsva_f(out_h, out_s, out_v, out_a, *arg4);
}

void cl_nk_color_hsva_fv(float* hsva_out, struct nk_color* arg1)
{
    nk_color_hsva_fv(hsva_out, *arg1);
}

void cl_nk_handle_ptr(void* arg0, nk_handle* result_out)
{
    *result_out = nk_handle_ptr(arg0);
}

void cl_nk_handle_id(int arg0, nk_handle* result_out)
{
    *result_out = nk_handle_id(arg0);
}

void cl_nk_image_handle(nk_handle* arg0, struct nk_image* result_out)
{
    *result_out = nk_image_handle(*arg0);
}

void cl_nk_image_ptr(void* arg0, struct nk_image* result_out)
{
    *result_out = nk_image_ptr(arg0);
}

void cl_nk_image_id(int arg0, struct nk_image* result_out)
{
    *result_out = nk_image_id(arg0);
}

void cl_nk_subimage_ptr(void* arg0, nk_ushort w, nk_ushort h, struct nk_rect* sub_region, struct nk_image* result_out)
{
    *result_out = nk_subimage_ptr(arg0, w, h, *sub_region);
}

void cl_nk_subimage_id(int arg0, nk_ushort w, nk_ushort h, struct nk_rect* sub_region, struct nk_image* result_out)
{
    *result_out = nk_subimage_id(arg0, w, h, *sub_region);
}

void cl_nk_subimage_handle(nk_handle* arg0, nk_ushort w, nk_ushort h, struct nk_rect* sub_region, struct nk_image* result_out)
{
    *result_out = nk_subimage_handle(*arg0, w, h, *sub_region);
}

void cl_nk_nine_slice_handle(nk_handle* arg0, nk_ushort l, nk_ushort t, nk_ushort r, nk_ushort b, struct nk_nine_slice* result_out)
{
    *result_out = nk_nine_slice_handle(*arg0, l, t, r, b);
}

void cl_nk_nine_slice_ptr(void* arg0, nk_ushort l, nk_ushort t, nk_ushort r, nk_ushort b, struct nk_nine_slice* result_out)
{
    *result_out = nk_nine_slice_ptr(arg0, l, t, r, b);
}

void cl_nk_nine_slice_id(int arg0, nk_ushort l, nk_ushort t, nk_ushort r, nk_ushort b, struct nk_nine_slice* result_out)
{
    *result_out = nk_nine_slice_id(arg0, l, t, r, b);
}

void cl_nk_sub9slice_ptr(void* arg0, nk_ushort w, nk_ushort h, struct nk_rect* sub_region, nk_ushort l, nk_ushort t, nk_ushort r, nk_ushort b, struct nk_nine_slice* result_out)
{
    *result_out = nk_sub9slice_ptr(arg0, w, h, *sub_region, l, t, r, b);
}

void cl_nk_sub9slice_id(int arg0, nk_ushort w, nk_ushort h, struct nk_rect* sub_region, nk_ushort l, nk_ushort t, nk_ushort r, nk_ushort b, struct nk_nine_slice* result_out)
{
    *result_out = nk_sub9slice_id(arg0, w, h, *sub_region, l, t, r, b);
}

void cl_nk_sub9slice_handle(nk_handle* arg0, nk_ushort w, nk_ushort h, struct nk_rect* sub_region, nk_ushort l, nk_ushort t, nk_ushort r, nk_ushort b, struct nk_nine_slice* result_out)
{
    *result_out = nk_sub9slice_handle(*arg0, w, h, *sub_region, l, t, r, b);
}

void cl_nk_triangle_from_direction(struct nk_vec2* result, struct nk_rect* r, float pad_x, float pad_y, enum nk_heading arg4)
{
    nk_triangle_from_direction(result, *r, pad_x, pad_y, arg4);
}

void cl_nk_vec2(float x, float y, struct nk_vec2* result_out)
{
    *result_out = nk_vec2(x, y);
}

void cl_nk_vec2i(int x, int y, struct nk_vec2* result_out)
{
    *result_out = nk_vec2i(x, y);
}

void cl_nk_vec2v(const float* xy, struct nk_vec2* result_out)
{
    *result_out = nk_vec2v(xy);
}

void cl_nk_vec2iv(const int* xy, struct nk_vec2* result_out)
{
    *result_out = nk_vec2iv(xy);
}

void cl_nk_get_null_rect(struct nk_rect* result_out)
{
    *result_out = nk_get_null_rect();
}

void cl_nk_rect(float x, float y, float w, float h, struct nk_rect* result_out)
{
    *result_out = nk_rect(x, y, w, h);
}

void cl_nk_recti(int x, int y, int w, int h, struct nk_rect* result_out)
{
    *result_out = nk_recti(x, y, w, h);
}

void cl_nk_recta(struct nk_vec2* pos, struct nk_vec2* size, struct nk_rect* result_out)
{
    *result_out = nk_recta(*pos, *size);
}

void cl_nk_rectv(const float* xywh, struct nk_rect* result_out)
{
    *result_out = nk_rectv(xywh);
}

void cl_nk_rectiv(const int* xywh, struct nk_rect* result_out)
{
    *result_out = nk_rectiv(xywh);
}

void cl_nk_rect_pos(struct nk_rect* arg0, struct nk_vec2* result_out)
{
    *result_out = nk_rect_pos(*arg0);
}

void cl_nk_rect_size(struct nk_rect* arg0, struct nk_vec2* result_out)
{
    *result_out = nk_rect_size(*arg0);
}

void cl_nk_font_config(float pixel_height, struct nk_font_config* result_out)
{
    *result_out = nk_font_config(pixel_height);
}

void cl_nk_font_atlas_end(struct nk_font_atlas* arg0, nk_handle* tex, struct nk_draw_null_texture* arg2)
{
    nk_font_atlas_end(arg0, *tex, arg2);
}

void cl_nk_stroke_line(struct nk_command_buffer* b, float x0, float y0, float x1, float y1, float line_thickness, struct nk_color* arg6)
{
    nk_stroke_line(b, x0, y0, x1, y1, line_thickness, *arg6);
}

void cl_nk_stroke_curve(struct nk_command_buffer* arg0, float arg1, float arg2, float arg3, float arg4, float arg5, float arg6, float arg7, float arg8, float line_thickness, struct nk_color* arg10)
{
    nk_stroke_curve(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, line_thickness, *arg10);
}

void cl_nk_stroke_rect(struct nk_command_buffer* arg0, struct nk_rect* arg1, float rounding, float line_thickness, struct nk_color* arg4)
{
    nk_stroke_rect(arg0, *arg1, rounding, line_thickness, *arg4);
}

void cl_nk_stroke_circle(struct nk_command_buffer* arg0, struct nk_rect* arg1, float line_thickness, struct nk_color* arg3)
{
    nk_stroke_circle(arg0, *arg1, line_thickness, *arg3);
}

void cl_nk_stroke_arc(struct nk_command_buffer* arg0, float cx, float cy, float radius, float a_min, float a_max, float line_thickness, struct nk_color* arg7)
{
    nk_stroke_arc(arg0, cx, cy, radius, a_min, a_max, line_thickness, *arg7);
}

void cl_nk_stroke_triangle(struct nk_command_buffer* arg0, float arg1, float arg2, float arg3, float arg4, float arg5, float arg6, float line_thichness, struct nk_color* arg8)
{
    nk_stroke_triangle(arg0, arg1, arg2, arg3, arg4, arg5, arg6, line_thichness, *arg8);
}

void cl_nk_stroke_polyline(struct nk_command_buffer* arg0, const float* points, int point_count, float line_thickness, struct nk_color* col)
{
    nk_stroke_polyline(arg0, points, point_count, line_thickness, *col);
}

void cl_nk_stroke_polygon(struct nk_command_buffer* arg0, const float* points, int point_count, float line_thickness, struct nk_color* arg4)
{
    nk_stroke_polygon(arg0, points, point_count, line_thickness, *arg4);
}

void cl_nk_fill_rect(struct nk_command_buffer* arg0, struct nk_rect* arg1, float rounding, struct nk_color* arg3)
{
    nk_fill_rect(arg0, *arg1, rounding, *arg3);
}

void cl_nk_fill_rect_multi_color(struct nk_command_buffer* arg0, struct nk_rect* arg1, struct nk_color* left, struct nk_color* top, struct nk_color* right, struct nk_color* bottom)
{
    nk_fill_rect_multi_color(arg0, *arg1, *left, *top, *right, *bottom);
}

void cl_nk_fill_circle(struct nk_command_buffer* arg0, struct nk_rect* arg1, struct nk_color* arg2)
{
    nk_fill_circle(arg0, *arg1, *arg2);
}

void cl_nk_fill_arc(struct nk_command_buffer* arg0, float cx, float cy, float radius, float a_min, float a_max, struct nk_color* arg6)
{
    nk_fill_arc(arg0, cx, cy, radius, a_min, a_max, *arg6);
}

void cl_nk_fill_triangle(struct nk_command_buffer* arg0, float x0, float y0, float x1, float y1, float x2, float y2, struct nk_color* arg7)
{
    nk_fill_triangle(arg0, x0, y0, x1, y1, x2, y2, *arg7);
}

void cl_nk_fill_polygon(struct nk_command_buffer* arg0, const float* points, int point_count, struct nk_color* arg3)
{
    nk_fill_polygon(arg0, points, point_count, *arg3);
}

void cl_nk_draw_image(struct nk_command_buffer* arg0, struct nk_rect* arg1, struct nk_image* arg2, struct nk_color* arg3)
{
    nk_draw_image(arg0, *arg1, arg2, *arg3);
}

void cl_nk_draw_nine_slice(struct nk_command_buffer* arg0, struct nk_rect* arg1, struct nk_nine_slice* arg2, struct nk_color* arg3)
{
    nk_draw_nine_slice(arg0, *arg1, arg2, *arg3);
}

void cl_nk_draw_text(struct nk_command_buffer* arg0, struct nk_rect* arg1, const char* text, int len, struct nk_user_font* arg4, struct nk_color* arg5, struct nk_color* arg6)
{
    nk_draw_text(arg0, *arg1, text, len, arg4, *arg5, *arg6);
}

void cl_nk_push_scissor(struct nk_command_buffer* arg0, struct nk_rect* arg1)
{
    nk_push_scissor(arg0, *arg1);
}

void cl_nk_push_custom(struct nk_command_buffer* arg0, struct nk_rect* arg1, nk_command_custom_callback arg2, nk_handle* usr)
{
    nk_push_custom(arg0, *arg1, arg2, *usr);
}

nk_bool cl_nk_input_has_mouse_click_in_rect(struct nk_input* arg0, enum nk_buttons arg1, struct nk_rect* arg2)
{
    return nk_input_has_mouse_click_in_rect(arg0, arg1, *arg2);
}

nk_bool cl_nk_input_has_mouse_click_in_button_rect(struct nk_input* arg0, enum nk_buttons arg1, struct nk_rect* arg2)
{
    return nk_input_has_mouse_click_in_button_rect(arg0, arg1, *arg2);
}

nk_bool cl_nk_input_has_mouse_click_down_in_rect(struct nk_input* arg0, enum nk_buttons arg1, struct nk_rect* arg2, nk_bool down)
{
    return nk_input_has_mouse_click_down_in_rect(arg0, arg1, *arg2, down);
}

nk_bool cl_nk_input_is_mouse_click_in_rect(struct nk_input* arg0, enum nk_buttons arg1, struct nk_rect* arg2)
{
    return nk_input_is_mouse_click_in_rect(arg0, arg1, *arg2);
}

nk_bool cl_nk_input_is_mouse_click_down_in_rect(struct nk_input* i, enum nk_buttons id, struct nk_rect* b, nk_bool down)
{
    return nk_input_is_mouse_click_down_in_rect(i, id, *b, down);
}

nk_bool cl_nk_input_any_mouse_click_in_rect(struct nk_input* arg0, struct nk_rect* arg1)
{
    return nk_input_any_mouse_click_in_rect(arg0, *arg1);
}

nk_bool cl_nk_input_is_mouse_prev_hovering_rect(struct nk_input* arg0, struct nk_rect* arg1)
{
    return nk_input_is_mouse_prev_hovering_rect(arg0, *arg1);
}

nk_bool cl_nk_input_is_mouse_hovering_rect(struct nk_input* arg0, struct nk_rect* arg1)
{
    return nk_input_is_mouse_hovering_rect(arg0, *arg1);
}

nk_bool cl_nk_input_is_mouse_hovering_still_rect(struct nk_input* arg0, struct nk_rect* arg1)
{
    return nk_input_is_mouse_hovering_still_rect(arg0, *arg1);
}

nk_bool cl_nk_input_is_mouse_hovering_delay_rect(struct nk_context* arg0, struct nk_rect* arg1, float* arg2, float arg3)
{
    return nk_input_is_mouse_hovering_delay_rect(arg0, *arg1, arg2, arg3);
}

nk_bool cl_nk_input_is_mouse_hovering_still_delay_rect(struct nk_context* arg0, struct nk_rect* arg1, float* arg2, float arg3)
{
    return nk_input_is_mouse_hovering_still_delay_rect(arg0, *arg1, arg2, arg3);
}

nk_bool cl_nk_input_is_mouse_hovering_still_delay_clicked_rect(struct nk_context* arg0, struct nk_rect* arg1, float* arg2, float arg3, nk_bool* arg4)
{
    return nk_input_is_mouse_hovering_still_delay_clicked_rect(arg0, *arg1, arg2, arg3, arg4);
}

nk_bool cl_nk_input_mouse_clicked(struct nk_input* arg0, enum nk_buttons arg1, struct nk_rect* arg2)
{
    return nk_input_mouse_clicked(arg0, arg1, *arg2);
}

void cl_nk_draw_list_path_line_to(struct nk_draw_list* arg0, struct nk_vec2* pos)
{
    nk_draw_list_path_line_to(arg0, *pos);
}

void cl_nk_draw_list_path_arc_to_fast(struct nk_draw_list* arg0, struct nk_vec2* center, float radius, int a_min, int a_max)
{
    nk_draw_list_path_arc_to_fast(arg0, *center, radius, a_min, a_max);
}

void cl_nk_draw_list_path_arc_to(struct nk_draw_list* arg0, struct nk_vec2* center, float radius, float a_min, float a_max, unsigned int segments)
{
    nk_draw_list_path_arc_to(arg0, *center, radius, a_min, a_max, segments);
}

void cl_nk_draw_list_path_rect_to(struct nk_draw_list* arg0, struct nk_vec2* a, struct nk_vec2* b, float rounding)
{
    nk_draw_list_path_rect_to(arg0, *a, *b, rounding);
}

void cl_nk_draw_list_path_curve_to(struct nk_draw_list* arg0, struct nk_vec2* p2, struct nk_vec2* p3, struct nk_vec2* p4, unsigned int num_segments)
{
    nk_draw_list_path_curve_to(arg0, *p2, *p3, *p4, num_segments);
}

void cl_nk_draw_list_path_fill(struct nk_draw_list* arg0, struct nk_color* arg1)
{
    nk_draw_list_path_fill(arg0, *arg1);
}

void cl_nk_draw_list_path_stroke(struct nk_draw_list* arg0, struct nk_color* arg1, enum nk_draw_list_stroke closed, float thickness)
{
    nk_draw_list_path_stroke(arg0, *arg1, closed, thickness);
}

void cl_nk_draw_list_stroke_line(struct nk_draw_list* arg0, struct nk_vec2* a, struct nk_vec2* b, struct nk_color* arg3, float thickness)
{
    nk_draw_list_stroke_line(arg0, *a, *b, *arg3, thickness);
}

void cl_nk_draw_list_stroke_rect(struct nk_draw_list* arg0, struct nk_rect* rect, struct nk_color* arg2, float rounding, float thickness)
{
    nk_draw_list_stroke_rect(arg0, *rect, *arg2, rounding, thickness);
}

void cl_nk_draw_list_stroke_triangle(struct nk_draw_list* arg0, struct nk_vec2* a, struct nk_vec2* b, struct nk_vec2* c, struct nk_color* arg4, float thickness)
{
    nk_draw_list_stroke_triangle(arg0, *a, *b, *c, *arg4, thickness);
}

void cl_nk_draw_list_stroke_circle(struct nk_draw_list* arg0, struct nk_vec2* center, float radius, struct nk_color* arg3, unsigned int segs, float thickness)
{
    nk_draw_list_stroke_circle(arg0, *center, radius, *arg3, segs, thickness);
}

void cl_nk_draw_list_stroke_curve(struct nk_draw_list* arg0, struct nk_vec2* p0, struct nk_vec2* cp0, struct nk_vec2* cp1, struct nk_vec2* p1, struct nk_color* arg5, unsigned int segments, float thickness)
{
    nk_draw_list_stroke_curve(arg0, *p0, *cp0, *cp1, *p1, *arg5, segments, thickness);
}

void cl_nk_draw_list_stroke_poly_line(struct nk_draw_list* arg0, struct nk_vec2* pnts, const unsigned int cnt, struct nk_color* arg3, enum nk_draw_list_stroke arg4, float thickness, enum nk_anti_aliasing arg6)
{
    nk_draw_list_stroke_poly_line(arg0, pnts, cnt, *arg3, arg4, thickness, arg6);
}

void cl_nk_draw_list_fill_rect(struct nk_draw_list* arg0, struct nk_rect* rect, struct nk_color* arg2, float rounding)
{
    nk_draw_list_fill_rect(arg0, *rect, *arg2, rounding);
}

void cl_nk_draw_list_fill_rect_multi_color(struct nk_draw_list* arg0, struct nk_rect* rect, struct nk_color* left, struct nk_color* top, struct nk_color* right, struct nk_color* bottom)
{
    nk_draw_list_fill_rect_multi_color(arg0, *rect, *left, *top, *right, *bottom);
}

void cl_nk_draw_list_fill_triangle(struct nk_draw_list* arg0, struct nk_vec2* a, struct nk_vec2* b, struct nk_vec2* c, struct nk_color* arg4)
{
    nk_draw_list_fill_triangle(arg0, *a, *b, *c, *arg4);
}

void cl_nk_draw_list_fill_circle(struct nk_draw_list* arg0, struct nk_vec2* center, float radius, struct nk_color* col, unsigned int segs)
{
    nk_draw_list_fill_circle(arg0, *center, radius, *col, segs);
}

void cl_nk_draw_list_fill_poly_convex(struct nk_draw_list* arg0, struct nk_vec2* points, const unsigned int count, struct nk_color* arg3, enum nk_anti_aliasing arg4)
{
    nk_draw_list_fill_poly_convex(arg0, points, count, *arg3, arg4);
}

void cl_nk_draw_list_add_image(struct nk_draw_list* arg0, struct nk_image* texture, struct nk_rect* rect, struct nk_color* arg3)
{
    nk_draw_list_add_image(arg0, *texture, *rect, *arg3);
}

void cl_nk_draw_list_add_text(struct nk_draw_list* arg0, struct nk_user_font* arg1, struct nk_rect* arg2, const char* text, int len, float font_height, struct nk_color* arg6)
{
    nk_draw_list_add_text(arg0, arg1, *arg2, text, len, font_height, *arg6);
}

void cl_nk_draw_list_push_userdata(struct nk_draw_list* arg0, nk_handle* userdata)
{
    nk_draw_list_push_userdata(arg0, *userdata);
}

void cl_nk_style_item_color(struct nk_color* arg0, struct nk_style_item* result_out)
{
    *result_out = nk_style_item_color(*arg0);
}

void cl_nk_style_item_image(struct nk_image* img, struct nk_style_item* result_out)
{
    *result_out = nk_style_item_image(*img);
}

void cl_nk_style_item_nine_slice(struct nk_nine_slice* slice, struct nk_style_item* result_out)
{
    *result_out = nk_style_item_nine_slice(*slice);
}

void cl_nk_style_item_hide(struct nk_style_item* result_out)
{
    *result_out = nk_style_item_hide();
}
