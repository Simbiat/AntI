with (obj_combo_text) {
	if (id != other.id) {
		other.toReplace = id;
	}
}
if obj_game.combo >= 55 {
	text = "SSSublime";
	font_color = make_color_rgb(43, 200, 216);
} else if obj_game.combo >= 45 {
	text = "SSymphonic";
	font_color = make_color_rgb(247, 220, 111);
} else if obj_game.combo >= 35 {
	text = "Synchronized";
	font_color = make_color_rgb(232, 141, 28);
} else if obj_game.combo >= 25 {
	text = "Amplified";
	font_color = make_color_rgb(127, 64, 191);
} else if obj_game.combo >= 15 {
	text = "Bombastic";
	font_color = make_color_rgb(94, 147, 225);
} else if obj_game.combo >= 7 {
	text = "Colorful";
	font_color = make_color_rgb(56, 154, 110);
} else if obj_game.combo >= 2 {
	text = "Disruptive";
	font_color = make_color_rgb(175, 123, 123);
} else {
	text = "";
}