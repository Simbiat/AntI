var prevFont = draw_get_font();
draw_set_font(fnt_flying_score);
text_outline(x, y, string(points), make_colour_rgb(212, 175, 55), c_black, 2);
draw_set_font(prevFont);
draw_set_colour(c_white);