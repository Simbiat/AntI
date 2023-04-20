draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text_transformed(x + sprite_width/2, y, "x"+string(max(obj_game.hp, 0)), 0.5, 0.5, 0);
draw_self();