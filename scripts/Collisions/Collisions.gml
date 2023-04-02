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
			game_restart();
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