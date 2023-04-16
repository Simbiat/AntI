with (obj_combo_text) {
	if (id != other.id) {
		other.toReplace = id;
	}
}
if obj_game.combo >= 55 {
	text = "SSSublime";
	font_color = gradeToColor("sss");
} else if obj_game.combo >= 45 {
	text = "SSymphonic";
	font_color = gradeToColor("ss");
} else if obj_game.combo >= 35 {
	text = "Synchronized";
	font_color = gradeToColor("s");
} else if obj_game.combo >= 25 {
	text = "Amplified";
	font_color = gradeToColor("a");
} else if obj_game.combo >= 15 {
	text = "Bombastic";
	font_color = gradeToColor("b");
} else if obj_game.combo >= 7 {
	text = "Colorful";
	font_color = gradeToColor("c");
} else if obj_game.combo >= 2 {
	text = "Disruptive";
	font_color = gradeToColor("d");
} else {
	text = "";
}