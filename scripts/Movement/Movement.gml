function daveJump(down = false)
{
	//audio_play_sound(snd_jump, 1, false);
	isJumping = true;
	if down {
		obj_player.vspeed = obj_player.jump_height/2;
		move_and_collide(0, obj_player.jump_height, obj_invis_floor);
	} else {
		obj_player.vspeed = -obj_player.jump_height;
		//move_and_collide(10, -obj_player.jump_height, obj_invis_wall);
		move_and_collide(0, -obj_player.jump_height, obj_invis_ceil);
	}
}



function followPlayer()
{
	move_towards_point(closest_left_wall.bbox_right, y, stride);
}