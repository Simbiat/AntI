//Check if player object exists and off the ground
if instance_exists(obj_player) {
	if allow_prompts && !instance_exists(obj_prompt) && alarm[3] < 0 {
		//Generate prompt
		if initialPromptUsed {
			instance_create_layer(room_width/2, room_height/2, "UI", obj_prompt, {ttl: 2*room_speed});
		} else {
			instance_create_layer(room_width/2, room_height/2, "UI", obj_prompt, {ttl: 2*room_speed, initial: true});
		}
		alarm[3] = 2*room_speed + room_speed;
	}
	if  !obj_player.is_grounded {
		//Spawn enemies only if we are in the air
		if alarm[1] < 0 {
			alarm[1] = 2*room_speed;
		}
		//Add 1 point per second
		if alarm[4] < 0 {
			alarm[4] = room_speed;
		}
	} else {
		alarm[4] = -1;
	}
}
if combo >= 55 {
	score_multiplier = 7;
} else if combo >= 45 {
	score_multiplier = 6;
} else if combo >= 35 {
	score_multiplier = 5;
} else if combo >= 25 {
	score_multiplier = 4;
} else if combo >= 15 {
	score_multiplier = 3;
} else if combo >= 7 {
	score_multiplier = 2;
} else {
	score_multiplier = 1;
}

//Update highest combo
if combo > obj_res_manager.combo_highest {
	obj_res_manager.combo_highest = combo;
	if obj_res_manager.desaturation > 0 {
		obj_res_manager.desaturation -= 0.01538461538461538*2;
	}
} else {
	if instance_exists(obj_player) && !obj_player.is_grounded && alarm[5] < 0 {
		alarm[5] = 5*room_speed;
	}
}

//Update highest points
points_total = points_enemies + points_prompts + points_time;
if points_total > obj_res_manager.points_highest {
	obj_res_manager.points_highest = points_total;
}