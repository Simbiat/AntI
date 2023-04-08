if obj_game.combo < 2 {
	instance_destroy();
}
if scale < 1 {
	scale += 0.0333;
	scale += 0.0333;
	if scale >= 1 {
		//Update the destination point
		var prevFont = draw_get_font();
		draw_set_font(fnt_combo);
		strWidth = string_width(text);
		draw_set_font(prevFont);
		destX = 20 + strWidth/2;
		destY = room_height - 120;
	}
}
var distance = point_distance(x, y, destX, destY);
// If we're at the destination coordinates
if (distance == 0) {
	//if destX != 0 {
	    // Set instance speed to zero to stop moving
	    speed = 0;
		if toReplace != noone {
			instance_destroy(toReplace);
		}
	//}
} else {
	if max_step >= 0 {
	    // Move towards the destination coordinates by no more than max_step
	    move_towards_point(destX, destY, min(distance, max_step));
	}
	max_step++;
}