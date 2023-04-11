function spawn()
{
	if obj_game.generate_enemies {
		//For testing only!
		//if !instance_exists(obj_mogul) {
		//	instance_create_layer(room_right_wall.bbox_right + sprite_get_width(spr_mogul)/2, random_range(900 - sprite_get_height(spr_mogul)/2, sprite_get_height(spr_mogul)/2), "Instances", obj_mogul);
		//}
		//return;
		
		if instance_number(obj_enemy) < 3 {
			var enemy = noone;
			switch (obj_game.enemiesSpawned) {
				//First 10 enemies are Pop Stars (basic enemies)
			    case 0: case 1: case 2: case 3: case 4: case 5: case 6: case 7: case 8: case 9:
			        enemy = obj_pop_star;
			        break;
				case 10: case 11:
					//11 and 12 is Laywer. 11th is allowed only if there no more enemies, and 12th is allowed if 11th was killed
					if instance_exists(obj_enemy) {
						return;
					}
					enemy = obj_lawyer;
					break;
				case 12: case 13: case 14: case 15: case 16: case 17:
					//Next 6 enemies are either Laywer or Pop Star. If a Lawyer is present - allow only Pop Star, otherwise - randomize
					enemy = enemySelectionTutorial(true, false, false, false, false, false);
					break;
				case 18: case 19:
					//17 and 18 is DJ Bot. Same logic as with Lawyers
					if instance_exists(obj_enemy) {
						return;
					}
					enemy = obj_dj_bot;
					break;
				case 20: case 21: case 22: case 23: case 24: case 25:
					//Next 6 enemies are either of the 3
					enemy = enemySelectionTutorial(true, true, false, false, false, false);
					break;
				case 26: case 27:
					//We continue with similar pattern. Now Autotune Monster
					if instance_exists(obj_enemy) {
						return;
					}
					enemy = obj_autotune;
					break;
				case 28: case 29: case 30: case 31: case 32: case 33:
					//Next 6 enemies are either of the 4
					enemy = enemySelectionTutorial(true, true, true, false, false, false);
					break;
				case 34: case 35:
					//We continue with similar pattern. Now AI Executive
					if instance_exists(obj_enemy) {
						return;
					}
					enemy = obj_executive;
					break;
				case 36: case 37: case 38: case 39: case 40: case 41:
					//Next 6 enemies are either of the 5, but do not spawn lawyer, if executive is present and vice versa
					enemy = enemySelectionTutorial(true, true, true, true, false, false);
					break;
				case 42: case 43:
					//We continue with similar pattern. Now Mogul
					if instance_exists(obj_enemy) {
						return;
					}
					enemy = obj_mogul;
					break;
				case 44: case 45: case 46: case 47: case 48: case 49:
					//Next 6 enemies are either of the 6, but do not spawn lawyer, if executive is present and vice versa,
					//and do not spawn Mogul if Autotune is present and vice versa
					enemy = enemySelectionTutorial(true, true, true, true, true, false);
					break;
				case 50: case 51:
					//We continue with similar pattern. Now Beat Thief
					if instance_exists(obj_enemy) {
						return;
					}
					enemy = obj_beat_thief;
					break;
				case 52: case 53: case 54: case 55: case 56: case 57:
					//Next 6 enemies are either of the 7, but do not spawn lawyer, if executive is present and vice versa,
					//and do not spawn Beat Thief if either Mogul or Autotune is present and vice versa
					enemy = enemySelectionTutorial(true, true, true, true, true, true);
					break;
			    default:
					//Random enemy
			        enemy = enemySelection();
			        break;
			}
			
			
			//Actual spawn based on the enemy selected
			obj_game.enemiesSpawned++;
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
			        //Do nothing
			        break;
			}
		}
	}
}

function enemySelectionTutorial(lawyer = true, dj = true, autotune = true, executive = true, mogul = true, thief = true)
{
	var enemy = obj_pop_star;
	// create a list of all the possible enemies
	var enemy_list = ds_list_create();
	//Pop Star can always be spawned, so we do not add it
	if lawyer {
		ds_list_add(enemy_list, obj_lawyer);
	}
	if dj {
		ds_list_add(enemy_list, obj_dj_bot);
	}
	if autotune {
		ds_list_add(enemy_list, obj_autotune);
	}
	if executive {
		ds_list_add(enemy_list, obj_executive);
	}
	if mogul {
		ds_list_add(enemy_list, obj_mogul);
	}
	if thief {
		ds_list_add(enemy_list, obj_beat_thief);
	}
	//We need to ago through the lest in reverse, because when we do ds_list_delete, the items "above" the removed one are moved by -1 in the index,
	//which causes weird behavior in some situations. And there is even no errors, if you are removing a non-existent index
	for (var i = ds_list_size(enemy_list) - 1; i >= 0; i--) {
		//Check if enemy is already spawned
		if (instance_number(enemy_list[| i]) > 0) {
			ds_list_delete(enemy_list, i);
		} else {
			//Check if this enemy is dependent on another enemy type, and those already exist
			switch (enemy_list[| i]) {
			    case obj_lawyer:
			        if instance_exists(obj_executive) {
						ds_list_delete(enemy_list, i);
					}
			        break;
			    case obj_executive:
			        if instance_exists(obj_lawyer) {
						ds_list_delete(enemy_list, i);
					}
			        break;
			    case obj_autotune:
			        if instance_exists(obj_mogul) || instance_exists(obj_beat_thief) {
						ds_list_delete(enemy_list, i);
					}
			        break;
			    case obj_mogul:
			        if instance_exists(obj_autotune) || instance_exists(obj_beat_thief) {
						ds_list_delete(enemy_list, i);
					}
			        break;
			    case obj_beat_thief:
			        if instance_exists(obj_autotune) || instance_exists(obj_mogul) {
						ds_list_delete(enemy_list, i);
					}
			        break;
			    default:
			        //Do nothing
			        break;
			}
		}
    }
	//If list size is not empty - randomly select an enemy
	if (ds_list_size(enemy_list) > 0) {
		enemy = enemy_list[| irandom(ds_list_size(enemy_list) - 1)];
	}
	//Cleanup
	ds_list_destroy(enemy_list);
	return enemy;
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