//Set alignment
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

//Set font
draw_set_colour(c_white);
var prevFont = draw_get_font();
draw_set_font(fnt_button);

//Draw text
text_outline(x, y, prefix+string(round(value))+postfix, font_color, c_black, 4, 0, 0.6);

if finished && points && string_lower(grade) != "e" {
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	//Get the width of text
	var stringWidth = string_width(prefix+string(round(value))+postfix);
	//Draw the actual grade
	draw_set_font(fnt_combo_scale2);
	text_outline(x + stringWidth - string_width(grade)/3, y - string_height(grade)/3, grade, gradeToColor(grade), c_black, 4, 0, 1);
}
if finished && bonus && bonus_multiplier != 0 {
	var bonus_value = value*bonus_multiplier;
	if bonus_value != 0 {
		draw_set_font(fnt_button);
		var stringWidth = string_width(prefix+string(round(value))+postfix);
		if bonus_value > 0 {
			text_outline(x + stringWidth, y, "+"+string(round(bonus_value))+"pts", c_green, c_black, 4, 0, 0.6);
		} else {
			text_outline(x + stringWidth, y, string(round(bonus_value))+"pts", c_red, c_black, 4, 0, 0.6);
		}
	}
	
}

//Reset font
draw_set_font(prevFont);
draw_set_colour(c_white);