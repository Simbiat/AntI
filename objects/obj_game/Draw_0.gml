draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_text_transformed(0, (room_height - 120), "Combo: "+string(combo), 0.5, 0.5, 0);
draw_text_transformed(0, (room_height - 60), "Lives: "+string(max(hp, 0)), 0.5, 0.5, 0);
draw_set_halign(fa_center);
if hp >= 0 {
	draw_text_transformed(room_width/2, (room_height - 60), "Score: "+string(points), 0.5, 0.5, 0);
}