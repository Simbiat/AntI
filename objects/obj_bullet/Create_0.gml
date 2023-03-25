//Define speed based on combo
if obj_game.combo > max_speed {
	speed = max_speed;
} else {
	speed = max(1, obj_game.combo);
}
//Define scale based on combo
if obj_game.combo > max_speed {
	var scale = min(10, max((obj_game.combo - max_speed), 1))/100;
	image_yscale += scale;
	image_xscale += scale;
}