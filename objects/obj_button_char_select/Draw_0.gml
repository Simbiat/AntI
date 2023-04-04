// Draw the button sprite itself
draw_self();

// Change font and alignment
draw_set_font(fnt_button);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

// Draw text on button
draw_text_transformed(x + sprite_width/2, y, "to choose\ncharacter", 0.25, 0.25, 0);
draw_text_transformed(x - string_width("/")/4, y, "/", 0.5, 0.5, 0);

// Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);