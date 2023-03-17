event_inherited();
if !is_grounded {
	faceDirection(dave_left_jump, dave_right_jump);
} else {
	faceDirection(dave_left_stand, dave_right_stand);
}
if isDead {
	hspeed = 0;
	faceDirection(dave_left_jump, dave_right_jump);
} else {
	if isActing() {
		processActions();
		//Variable jump
		obj_dave.vspeed = max(obj_dave.vspeed, -obj_dave.jump_height/3);
	} else {
		hspeed = 0;
	}
}