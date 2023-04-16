targetValue = -obj_game.hp_lost * 500;

//Time variant is used for scaling. If value is -2000 this already means, that some lives were gained
//so most likely we have been in the air for qutie some time, thus we need to reduce the speed
//at which the grade is being reduced.
var timeVariant = 500*max(0, floor(obj_game.points_time/60) - 1);
if targetValue <= -3500+timeVariant {
	grade = "D";
} else if value <= -2500+timeVariant {
	grade = "C";
} else if targetValue <= -2000+timeVariant {
	grade = "B";
} else if targetValue <= -1500+timeVariant {
	grade = "A";
} else if targetValue <= -1000 {
	grade = "S";
} else if targetValue <= -500 {
	grade = "SS";
} else {
	grade = "SSS";
}