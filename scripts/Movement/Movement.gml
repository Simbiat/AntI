//Movement functions
function daveMoveLeft(jump = false)
{
	obj_dave.facing = "left";
	if jump {
		obj_dave.hspeed = -obj_dave.jump_width;
	} else {
		if is_grounded {
			obj_dave.sprite_index = dave_left_run;
		} else {
			obj_dave.sprite_index = dave_left_jump;
		}
		obj_dave.hspeed = -obj_dave.stride;
		//move_and_collide(-obj_dave.stride, 0, obj_invis_wall);
	}
}

function daveMoveRight(jump = false)
{
	obj_dave.facing = "right";
	if jump {
		obj_dave.hspeed = obj_dave.jump_width;
	} else {
		if is_grounded {
			obj_dave.sprite_index = dave_right_run;
		} else {
			obj_dave.sprite_index = dave_right_jump;
		}
		obj_dave.hspeed = obj_dave.stride;
		//move_and_collide(obj_dave.stride, 0, obj_invis_wall);
	}
}

function daveJump()
{
	//audio_play_sound(snd_jump, 1, false);
	isJumping = true;
	obj_dave.vspeed = -obj_dave.jump_height;
	if facing == "right" {
		move_and_collide(10,-obj_dave.jump_height,obj_invis_wall);
		screenshake(1, 2, 0.25, false, true, true, false);
	} else {
		move_and_collide(-10,-obj_dave.jump_height,obj_invis_wall);
		screenshake(1, 2, 0.25, true, false, true, false);
	}
}

function followPlayer()
{
	if isAttacking == false {
		if instance_exists(obj_dave) && closest_floor == obj_dave.closest_floor && !obj_dave.isDead && !obj_dave.invincible {
			//Determine where Dave is relative to the enemy
			var distanceLeft = bbox_left - obj_dave.bbox_right;
			var distanceRight = obj_dave.bbox_left - bbox_right;
			if distanceRight - attack_range_min >= 0 {
				//Dave is on the right
				if facing == "left" {
					facing = "right";
				}
				move_towards_point(obj_dave.bbox_left - attack_range_min, y, stride);
			} else if distanceLeft - attack_range_min >= 0 {
				//Dave is on the left
				if facing == "right" {
					facing = "left";
				}
				move_towards_point(obj_dave.bbox_right + attack_range_min, y, stride);
			}
			move_towards_point(obj_dave.x, y, stride);
		} else {
			if facing == "left" {
				move_towards_point(closest_left_wall.bbox_right, y, stride);
			} else {
				move_towards_point(closest_right_wall.bbox_left, y, stride);
			}
		}
	} else {
		if !attack_while_moving {
			hspeed = 0;	
		}
	}
}