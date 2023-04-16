draw_set_colour(c_white);
draw_set_halign(fa_left);
//draw_text_transformed(0, (room_height - 120), "Combo: "+string(combo), 0.5, 0.5, 0);
draw_text_transformed(0, (room_height - 60), "Lives: "+string(max(hp, 0)), 0.5, 0.5, 0);
draw_set_halign(fa_center);
if hp >= 0 {
	var prevFont = draw_get_font();
	draw_set_font(fnt_score);
	draw_set_colour(make_colour_rgb(212, 175, 55));
	//text_outline(room_width/2, (room_height - 110), string(points_total), make_colour_rgb(212, 175, 55), c_black, 2);
	draw_set_font(prevFont);
	draw_set_colour(c_white);
}