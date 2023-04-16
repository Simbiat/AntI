//Set alignment
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

//Set font
draw_set_colour(c_white);
var prevFont = draw_get_font();
draw_set_font(fnt_button);

//Draw text
text_outline(x, y, text, c_white, c_black, 4, 0, 0.6);

//Reset font
draw_set_font(prevFont);
draw_set_colour(c_white);