function daveJump(down = false)
{
	//audio_play_sound(snd_jump, 1, false);
	isJumping = true;
	if down {
		obj_dave.vspeed = obj_dave.jump_height/2;
		move_and_collide(0, obj_dave.jump_height, obj_invis_floor);
	} else {
		obj_dave.vspeed = -obj_dave.jump_height;
		//move_and_collide(10, -obj_dave.jump_height, obj_invis_wall);
		move_and_collide(0, -obj_dave.jump_height, obj_invis_ceil);
	}
}



function followPlayer()
{
	move_towards_point(closest_left_wall.bbox_right, y, stride);
}