// Draw the button sprite itself
draw_self();

// Change font and alignment
draw_set_font(fnt_button);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw text on button
if image_xscale >= 0.4 {
	//draw_text_transformed(x, y + sprite_height/2, "Final score: "+string(obj_game.points)+"\nHighest score: "+string(obj_res_manager.points_highest), 0.5, 0.5, 0);
	text_outline(x, y + sprite_height/2, "Final score: "+string(obj_game.points));
	text_outline(x, y + sprite_height/2 + string_height("Final score: "+string(obj_game.points)), "Highest score: "+string(obj_res_manager.points_highest));
}

// Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);