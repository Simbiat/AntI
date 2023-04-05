function damagePlayer()
{
	if instance_exists(obj_player) {
		if !obj_player.invincible {
			obj_game.hp -= 1;
		}
		if !obj_player.is_grounded {
			with obj_player {
				//Gold tone and black&white luminence (close to sepia effect)
				blinkShader(sha_tone, 5, room_speed/10, [1.0, 0.843, 0.0], [0.299, 0.587, 0.114]);
				//Block jumping
				invincible = true;
				canJump = false
				if alarm[1] < 0 {
					alarm[1] = room_speed;
				}
				if alarm[3] < 0 {
					alarm[3] = room_speed;
				}
				//Bring to ground
				vspeed = obj_player.jump_height;
				//move_and_collide(0, room_height-y, room_floor);
			}
		}
		if obj_game.hp < 0 {
			with obj_button_quit {
				event_user(0);	
			}
		}
	}
}

function damageEnemy(addPoints = true)
{
	hp -= 1;
	if (hp == 0) {
		//Add points
		if addPoints {
			obj_game.points += obj_game.score_multiplier*points;
		}
		//Destroy the instance
		instance_destroy();
	} else {
		blink_on_hit = true;
		alarm[0] = 0.25*room_speed;
	}
}

function autoTarget(targetXPos = 0)
{
	var toTarget = noone;
	var enemiesNumber = instance_number(obj_enemy);
	if enemiesNumber > 0 {
	    for (var i = 0; i < enemiesNumber; ++i;) {
			var alreadyTargeted = false;
			//Get the enemy
			var enemy = instance_find(obj_enemy,i);
			//Enemy is a potential target only if it's X position is less than argument
			if enemy.x <= targetXPos {
				//Check if any instakill bullets are targetting this enemy already
				for (var j = 0; j < instance_number(obj_bullet); ++j;) {
					var bullet = instance_find(obj_bullet,j);
					if bullet.target == enemy {
						alreadyTargeted = true;
						//Break loop early
						break;
					}
				}
				if !alreadyTargeted {
					//Shoot a note towards the enemy
					toTarget = enemy;
				}
			}
	    }
	}
	return toTarget;
}