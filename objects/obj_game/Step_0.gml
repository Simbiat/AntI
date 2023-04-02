if musicID != noone {
	timeLeft = audio_sound_length(musicID) - audio_sound_get_track_position(musicID);
	if timeLeft < 0 {
		timeLeft = 0;	
	}
}
//Check if player object exists and off the ground
if instance_exists(obj_player) {
	if !instance_exists(obj_prompt) && alarm[3] < 0 {
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
if combo >= 35 {
	score_multiplier = 5;
} else if combo >= 25 {
	score_multiplier = 4;
} else if combo >= 15 {
	score_multiplier = 3;
} else if combo >= 5 {
	score_multiplier = 2;
} else {
	score_multiplier = 1;
}