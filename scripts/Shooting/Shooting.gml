function daveShoot()
{
	//Also check that we are not shooting already or waiting for bullet to be created
	//This is required to prevent rapid fire from being "too fast"
	if obj_dave.isShooting == false and obj_dave.alarm[0] < 0 {
		obj_dave.isShooting = true;
		var delay = 0.3;
		if obj_dave.facing == "right" {
			obj_dave.sprite_index = shoot_right_straight;
		} else {
			obj_dave.sprite_index = shoot_left_straight;
		}
		obj_dave.alarm[0] = delay * room_speed;
	}
}

function shoot(_target = noone)
{
	var bulletX = 0;
	var bulletY = 0;
	//Calculate coordinates
	bulletX = bbox_right;
	bulletY = y - sprite_height/5;
	obj_game.alarm[2] = 1;
	//Create bullet
	if _target == noone {
		instance_create_layer(bulletX, bulletY, "Projectiles", obj_bullet);
	} else {
		instance_create_layer(bulletX, bulletY, "Projectiles", obj_bullet_instakill, {target: _target});
	}
	obj_dave.isShooting = false;	
}