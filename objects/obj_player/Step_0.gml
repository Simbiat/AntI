event_inherited();
if !is_grounded {
	sprite_index = dave_right_jump;
} else {
	sprite_index = dave_right_stand;
}
if isDead {
	hspeed = 0;
	sprite_index = dave_right_jump;
} else {
	processActions();
}

//Check if any of the enemies are close
/*
var enemies = ds_list_create();
var enemiesNumber = collision_rectangle_list(0, 0, x + sprite_width*2, room_height*global.screen_scale, obj_zombie, false, true, enemies, false);
if enemiesNumber > 0 {
    for (var i = 0; i < enemiesNumber; ++i;) {
		var alreadyTargeted = false;
		//Check if any instakill bullets are targetting this enemy already
		for (var i = 0; i < instance_number(obj_bullet_instakill); ++i;) {
			var bullet = instance_find(obj_bullet_instakill,i);
			if bullet.target == enemies[| i] {
				alreadyTargeted = true;
				//Break loop early
				break;
			}
		}
		if !alreadyTargeted {
			//Shoot a note towards the enemy
			shoot(enemies[| i]);
		}
    }
}
ds_list_destroy(enemies);
*/