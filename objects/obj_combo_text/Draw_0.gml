var prevFont = draw_get_font();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_combo);
text_outline(x, y, text, font_color, c_black, 2, 0, scale);
draw_set_font(prevFont);
draw_set_colour(c_white);