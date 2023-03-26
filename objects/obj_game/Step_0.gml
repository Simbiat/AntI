//Chekc if player object exists
if instance_exists(obj_player) && !obj_player.is_grounded && alarm[3] < 0 {
	instance_create_layer(room_width/2, room_height/2, "UI", obj_prompt, {ttl: 2*room_speed});
	alarm[3] = 2*room_speed + room_speed;
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