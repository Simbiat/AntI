draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_text_transformed(0, (room_height - 90)*global.screen_scale, "Combo: "+string(combo), 0.5*global.screen_scale, 0.5*global.screen_scale, 0);
draw_set_halign(fa_right);
draw_text_transformed(room_width*global.screen_scale, (room_height - 90)*global.screen_scale, "Score: "+string(points), 0.5*global.screen_scale, 0.5*global.screen_scale, 0);