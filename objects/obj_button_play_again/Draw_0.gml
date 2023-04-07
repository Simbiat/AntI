// Draw the button sprite itself
draw_self();

// Change font and alignment
draw_set_font(fnt_button);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

// Draw text on button
draw_text_transformed(x + sprite_width/2, y, "to play again", 0.75, 0.75, 0)

// Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);