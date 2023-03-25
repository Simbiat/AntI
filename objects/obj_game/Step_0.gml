//Chekc if player object exists
if instance_exists(obj_dave) && !obj_dave.is_grounded && alarm[3] < 0 {
	instance_create_layer(room_width/2, room_height/2, "UI", obj_prompt, {ttl: 2*room_speed});
	alarm[3] = 2*room_speed + room_speed;
}