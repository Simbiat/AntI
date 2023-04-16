// Draw the button sprite itself
draw_self();

// Change font and alignment
draw_set_font(fnt_button);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw text on button
if image_xscale >= 0.4 {
	//var finalScore = "Final score: "+string(obj_game.points_total);
	//text_outline(x, y + sprite_height/2, finalScore);
	//text_outline(x, y + sprite_height/2 + string_height(finalScore), "Highest score: "+string(obj_res_manager.points_highest));
}

// Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);