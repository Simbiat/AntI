function applyPhysics()
{
	closest_floor = room_floor;
	closest_ceil = room_ceiling;
	closest_left_wall = room_left_wall;
	closest_right_wall = room_right_wall;
	is_grounded = isGrounded();
	if object_get_parent(object_index) == obj_enemy {
		if facing == "left" {
			if destroyOnLeft {
				move_towards_point(closest_left_wall.bbox_left - sprite_width/2, y, hspeed);
			} else {
				move_towards_point(closest_left_wall.bbox_right, y, hspeed);
			}
		} else {
			move_towards_point(closest_right_wall.bbox_right, y, hspeed);
		}
		//Player seems to work fine with just collision event, but enemies get too far without this
		//horizontalCollisions();
	} else {
		applyGravity();
	}
	//move_bounce_all(false);
}

function ground()
{
	closest_floor = room_floor;
	if bbox_bottom < closest_floor.bbox_top {
		y += (closest_floor.bbox_top - bbox_bottom);
	} else if  bbox_bottom < closest_floor.bbox_top {
		y -= (bbox_bottom - closest_floor.bbox_top);
	}	
	if vspeed > 0 {
		vspeed = 0;
	}
}

function isGrounded()
{
	//Should not happen, but if there is no floor, we are definitely not grounded
	if closest_floor == noone {
		return false;	
	}
	if bbox_bottom == closest_floor.bbox_top {
		return true;	
	} else {
		return false;	
	}
}

function applyGravity() {
	if !is_grounded {
		//Get distance
		var distance = closest_floor.bbox_top - bbox_bottom;
		if distance <= 0 {
			vspeed = 0;	
			//Thismay mean we are "below" the floor and need to adjust position
			y += distance;
			if (object_index == obj_player) {
				if isJumping {
					daveLand();
				}
			}
		} else {
			if vspeed + gravityForce <= distance {
				vspeed += gravityForce;
			} else {
				vspeed = distance;
				if (object_index == obj_player) {
					daveLand();
				}
			}
		}
	} else {
		vspeed = 0;
		if (object_index == obj_player) {
			if isJumping {
				daveLand();
			}
		}
	}
}

//Function for when Dave lands on the ground
function daveLand()
{
	if (closest_floor == room_floor) {
		screenshake(0.5, 1, 0.25, false, false, false, true);
	}
	play_sound(snd_landing);
	isJumping = false;
	damagePlayer();
	if obj_game.hp < 0 {
		audio_stop_sound(obj_res_manager.music_file);
	}
}

function horizontalCollisions()
{
	//Get distance
	var distanceLeft = bbox_left - closest_left_wall.bbox_right;
	var distanceRight = closest_right_wall.bbox_left - bbox_right;
	if facing == "left" {
		if distanceLeft <= 0 {
			hspeed = 0;	
			x -= distanceLeft;
			facing = "right";
		} else {
			if stride <= distanceLeft {
				hspeed = -stride;
			} else {
				hspeed = -distanceLeft;
			}
		}
	} else {
		if distanceRight <= 0 {
			hspeed = 0;	
			x += distanceRight;
			facing = "left";
		} else {
			if stride <= distanceRight {
				hspeed = stride;
			} else {
				hspeed = distanceRight;
			}
		}
	}
}

function screenshake(time, magnitude, fade = 0.25, left = true, right = true, top = true, bottom = true) {
	obj_screenshake.shaking = true;
	obj_screenshake.time = time;
	obj_screenshake.magnitude = magnitude;
	obj_screenshake.fade = fade;
	obj_screenshake.left = left;
	obj_screenshake.right = right;
	obj_screenshake.top = top;
	obj_screenshake.bottom = bottom;
}