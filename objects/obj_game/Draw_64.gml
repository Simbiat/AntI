draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_font(global.score_font);
//This is for the sake of prototype only. Actual game needs a proper UI element
//draw_text_transformed(room_width/2, room_height - 90, obj_game.points, 10, 10, 0);
draw_text_transformed(room_width/2, room_height - 90, alarm[3], 10, 10, 0);