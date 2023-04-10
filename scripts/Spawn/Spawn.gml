function spawn()
{
	if obj_game.generate_enemies {
		//For testing only!
		//if !instance_exists(obj_mogul) {
		//	instance_create_layer(room_right_wall.bbox_right + sprite_get_width(spr_mogul)/2, random_range(900 - sprite_get_height(spr_mogul)/2, sprite_get_height(spr_mogul)/2), "Instances", obj_mogul);
		//}
		//return;
		
		if instance_number(obj_enemy) < 5 {
			if obj_game.enemiesSpawned >= 10 {
				var enemy = enemySelection();
			} else {
				var enemy = obj_pop_star;
				obj_game.enemiesSpawned++;
			}
			switch (enemy) {
			    case obj_autotune:
			        instance_create_layer(room_right_wall.bbox_right + sprite_get_width(spr_autotune)/2, random_range(900 - sprite_get_height(spr_autotune)/2, sprite_get_height(spr_autotune)/2), "Instances", obj_autotune);
			        break;
			    case obj_beat_thief:
			        instance_create_layer(room_right_wall.bbox_right + sprite_get_width(spr_beat_thief)/2, random_range(900 - sprite_get_height(spr_beat_thief)/2, sprite_get_height(spr_beat_thief)/2), "Instances", obj_beat_thief);
			        break;
			    case obj_dj_bot:
			        instance_create_layer(room_right_wall.bbox_right + sprite_get_width(spr_dj_bot)/2, 100, "Instances", obj_dj_bot);
			        break;
			    case obj_executive:
			        instance_create_layer(room_right_wall.bbox_right + sprite_get_width(spr_executive)/2, 900, "Instances", obj_executive);
			        break;
			    case obj_lawyer:
			        instance_create_layer(room_right_wall.bbox_right + sprite_get_width(spr_lawyer)/2, 900, "Instances", obj_lawyer);
			        break;
			    case obj_mogul:
			        instance_create_layer(room_right_wall.bbox_right + sprite_get_width(spr_mogul)/2, random_range(900 - sprite_get_height(spr_mogul)/2, sprite_get_height(spr_mogul)/2), "Instances", obj_mogul);
			        break;
			    case obj_pop_star:
			        instance_create_layer(room_right_wall.bbox_right + sprite_get_width(spr_pop_star)/2, random_range(900 - sprite_get_height(spr_pop_star)/2, sprite_get_height(spr_pop_star)/2), "Instances", obj_pop_star);
			        break;
			    default:
			        // code here
			        break;
			}
		}
	}
}

function enemySelection()
{
	//Define enemy variable
	var enemy = noone;
	//Check if we have space for each enemy type
	var maxAutotune = instance_number(obj_autotune) < 1;
	var maxBeatThief = instance_number(obj_beat_thief) < 1;
	var maxDJ = instance_number(obj_dj_bot) < 3;
	var maxExec = instance_number(obj_executive) < 1;
	var maxLawyer = instance_number(obj_lawyer) < 3;
	var maxMogul = instance_number(obj_mogul) < 2;
	var maxPopStar = instance_number(obj_pop_star) < 10;
	//Range start with 1 instead of 0 to allow complete negation of check, if we are at maximum of possible objects
	//Range ends with 103 to accomodate it starting from 1 instead of 0
	var chance = random_range(1, 101);
	if chance <= 36*maxPopStar {
		enemy = obj_pop_star;
	} else if chance <= 56*maxDJ {
		enemy = obj_dj_bot;
	} else if chance <= 71*maxLawyer {
		enemy = obj_lawyer;
	} else if chance <= 79*maxMogul {
		enemy = obj_mogul;
	} else if chance <= 87*maxExec {
		enemy = obj_executive;
	} else if chance <= 94*maxAutotune {
		enemy = obj_autotune;
	} else if chance <= 101*maxBeatThief {
		enemy = obj_beat_thief;
	}
	return enemy;
}

function setNoteFrame()
{
	//Define sprite frame
	if randomFrame || !instance_exists(obj_game) {
		image_index = irandom_range(0, image_number-1);
	} else {
		if obj_game.combo >= 55 {
			image_index = 5;
		} else if obj_game.combo >= 45 {
			image_index = 5;
		} else if obj_game.combo >= 35 {
			image_index = 5;
		} else if obj_game.combo >= 25 {
			image_index = 4;
		} else if obj_game.combo >= 15 {
			image_index = 3;
		} else if obj_game.combo >= 7 {
			image_index = 2;
		} else if obj_game.combo >= 2 {
			image_index = 1;
		} else {
			image_index = 0;
		}
	}
}