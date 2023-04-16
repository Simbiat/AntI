targetValue = obj_game.points_prompts;

var successRate = obj_game.prompts_correct*100/(obj_game.prompts_correct + obj_game.prompts_incorrect + obj_game.prompts_missed);
if successRate >= 98 {
	grade = "SSS";
} else if successRate >= 90 {
	grade = "SS";
} else if successRate >= 75 {
	grade = "S";
} else if successRate >= 60 {
	grade = "A";
} else if successRate >= 45 {
	grade = "B";
} else if successRate >= 30 {
	grade = "C";
} else {
	grade = "D";
}