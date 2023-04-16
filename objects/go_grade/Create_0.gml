//Grade the total score
var total = totalScore();
var totalScoreGrade = "D";
var timeVariant = max(0, floor(obj_game.points_time/60) - 1);
if total >= 4000*timeVariant {
	totalScoreGrade = "SSS";
} else if total >= 3500*timeVariant {
	totalScoreGrade = "SS";
} else if total >= 3000*timeVariant {
	totalScoreGrade = "S";
} else if total >= 2500*timeVariant {
	totalScoreGrade = "A";
} else if total >= 2000*timeVariant {
	totalScoreGrade = "B";
} else if total >= 1500*timeVariant {
	totalScoreGrade = "C";
} else {
	totalScoreGrade = "D";
}

var finalGrade = median(
					gradeToNumber(go_enemies_points.grade),
					gradeToNumber(go_prompts_points.grade),
					gradeToNumber(go_airtime_points.grade),
					gradeToNumber(go_damage_points.grade),
					gradeToNumber(totalScoreGrade)
				);

if finalGrade >= 7 {
	text = "SSS";
	font_color = gradeToColor("sss");
} else if finalGrade >= 6 {
	text = "SS";
	font_color = gradeToColor("ss");
} else if finalGrade >= 5 {
	text = "S";
	font_color = gradeToColor("s");
} else if finalGrade >= 4 {
	text = "A";
	font_color = gradeToColor("a");
} else if finalGrade >= 3 {
	text = "B";
	font_color = gradeToColor("b");
} else if finalGrade >= 2 {
	text = "C";
	font_color = gradeToColor("c");
} else {
	text = "D";
	font_color = gradeToColor("d");
}