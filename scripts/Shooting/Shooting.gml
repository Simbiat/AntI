function daveShoot()
{
	//Also check that we are not shooting already or waiting for bullet to be created
	//This is required to prevent rapid fire from being "too fast"
	if obj_player.isShooting == false and obj_player.alarm[0] < 0 {
		obj_player.isShooting = true;
		var delay = 0.3;
		obj_player.alarm[0] = delay * room_speed;
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
	obj_player.isShooting = false;	
}

function punish()
{
	screenshake(1, 2, 0.25, false, true, true, false);
	daveJump(true);	
}