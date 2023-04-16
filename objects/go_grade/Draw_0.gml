var prevFont = draw_get_font();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_combo_scale10);
text_outline(x, y, text, font_color, c_black, 2, 0, image_xscale);

if image_xscale == 1 && obj_game.newRecord {
	draw_set_font(fnt_button);
	var stringWidth = string_width(go_total_points.prefix+string(round(go_total_points.value))+go_total_points.postfix);
	var stringHeight = string_height(go_total_points.prefix+string(round(go_total_points.value))+go_total_points.postfix);
	draw_set_font(fnt_flying_score);
	text_outline(go_total_points.x + stringWidth/2, go_total_points.y - stringHeight/2, "New record", make_colour_rgb(212, 175, 55), c_black, 15);
}

draw_set_font(prevFont);
draw_set_colour(c_white);