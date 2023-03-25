//Define speed based on combo
if obj_game.combo > max_speed {
	speed = max_speed;
} else {
	speed = max(1, obj_game.combo);
}
//Define scale based on combo
if obj_game.combo > max_speed {
	var scale = min(3, max((obj_game.combo - 10)/2), 1);
	image_yscale = image_yscale * scale;
	image_xscale = image_xscale * scale;
}