targetValue = obj_game.points_enemies;

var successRate = obj_game.enemies_killed*100/obj_game.enemies_spawned;
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