/// @param xx X for the text
/// @param yy Y for the text
/// @param textToDraw Text
/// @param textColor Text color
/// @param outlineColor Outline color
/// @param outlineThickness Outline thickness
/// @param maxWidth The maximum width in pixels of the string before a line break
/// @param scale Scale of the text
function text_outline(xx, yy, textToDraw, textColor = c_white, outlineColor = c_black, outlineThickness = 4, maxWidth = 0, scale = 1)
{
	if maxWidth <= 0 {
		maxWidth = room_width - outlineThickness;
	} else {
		maxWidth -= outlineThickness;
	}
	if !variable_global_exists("font_line_sep") {
		global.font_line_sep = 1;
	}
	// Draw the text with an outline
	draw_set_color(outlineColor);
	draw_text_ext_transformed(xx - outlineThickness, yy, textToDraw, global.font_line_sep, maxWidth, scale, scale, 0);
	draw_text_ext_transformed(xx + outlineThickness, yy, textToDraw, global.font_line_sep, maxWidth, scale, scale, 0);
	draw_text_ext_transformed(xx, yy - outlineThickness, textToDraw, global.font_line_sep, maxWidth, scale, scale, 0);
	draw_text_ext_transformed(xx, yy + outlineThickness, textToDraw, global.font_line_sep, maxWidth, scale, scale, 0);
	draw_set_color(textColor);
	draw_text_ext_transformed(xx, yy, textToDraw, global.font_line_sep, maxWidth, scale, scale, 0);
	//Reset color to default
	draw_set_color(c_white);
}