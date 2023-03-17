//Aiming functions
function aimUp()
{
	//Prevent moving when aiming
	obj_dave.hspeed = 0;
	if obj_dave.facing == "right" {
		obj_dave.sprite_index = aim_right_up;
	} else {
		obj_dave.sprite_index = aim_left_up;
	}
}

function aimDown()
{
	//Prevent moving when aiming
	obj_dave.hspeed = 0;
	if obj_dave.facing == "right" {
		obj_dave.sprite_index = aim_right_down;
	} else {
		obj_dave.sprite_index = aim_left_down;
	}
}

function daveShoot()
{
	//Also check that we are not shooting already or waiting for bullet to be created
	//This is required to prevent rapid fire from being "too fast"
	if obj_dave.isShooting == false and obj_dave.alarm[0] < 0 {
		obj_dave.isShooting = true;
		var delay = 0.3;
		if isLookingUp() {
			if obj_dave.facing == "right" {
				obj_dave.sprite_index = shoot_right_up;
			} else {
				obj_dave.sprite_index = shoot_left_up;
			}
			delay = 0.2;
		} else if isLookingDown() {
			if obj_dave.facing == "right" {
				obj_dave.sprite_index = shoot_right_down;
			} else {
				obj_dave.sprite_index = shoot_left_down;
			}
			delay = 0.2;
		} else {
			if obj_dave.facing == "right" {
				obj_dave.sprite_index = shoot_right_straight;
			} else {
				obj_dave.sprite_index = shoot_left_straight;
			}
			delay = 0.3;
		}
		obj_dave.alarm[0] = delay * room_speed;
	}
}

function shoot()
{
	var bulletX = 0;
	var bulletY = 0;
	var bulletDirection = 0;
	var bulletAngle = 0;
	var bulletYScale = 0.05;
	var bulletXScale = -0.05;
	//Calculate coordinates
	if obj_dave.facing == "right" {
		bulletX = bbox_right;
		bulletDirection = 0;
	} else {
		bulletX = bbox_left;
		bulletDirection = 180;
		bulletXScale = 0.05;
	}
	bulletY = y - sprite_height/5;
	//Make sound
	//audio_play_sound(snd_shooting, 1, false);
	obj_game.alarm[2] = 1;
	//Create bullet
	instance_create_layer(bulletX, bulletY, "Projectiles", obj_bullet, {direction: bulletDirection, image_angle: bulletAngle, image_yscale: bulletYScale, image_xscale: bulletXScale});
	obj_dave.isShooting = false;	
}