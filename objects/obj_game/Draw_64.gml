draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_text_transformed(0, (room_height - 120)*global.screen_scale, "Combo: "+string(combo), 0.5*global.screen_scale, 0.5*global.screen_scale, 0);
draw_text_transformed(0, (room_height - 60)*global.screen_scale, "Lives: "+string(hp), 0.5*global.screen_scale, 0.5*global.screen_scale, 0);
if musicID != noone {
	draw_set_halign(fa_center);
	draw_text_transformed(room_width/2*global.screen_scale, (room_height - 120)*global.screen_scale, "Time left: "+string(int64(timeLeft)), 0.5*global.screen_scale, 0.5*global.screen_scale, 0);
}
draw_set_halign(fa_center);
draw_text_transformed(room_width/2*global.screen_scale, (room_height - 60)*global.screen_scale, "Score: "+string(points), 0.5*global.screen_scale, 0.5*global.screen_scale, 0);