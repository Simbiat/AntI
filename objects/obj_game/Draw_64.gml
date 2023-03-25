draw_set_colour(c_white);
draw_set_halign(fa_center);
//This is for the sake of prototype only. Actual game needs a proper UI element
//draw_text_transformed(room_width/2, room_height - 90, obj_game.points, 10, 10, 0);
//draw_text_transformed(room_width/2*global.scale, (room_height - 90)*global.scale, alarm[3], 10, 10, 0);
draw_text_transformed(room_width/2*global.screen_scale, (room_height - 90)*global.screen_scale, "Combo: "+string(combo), 10*global.screen_scale, 10*global.screen_scale, 0);