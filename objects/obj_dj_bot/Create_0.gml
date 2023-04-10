// Inherit the parent event
event_inherited();

//Generate the vinyl
vinyl = instance_create_layer(x-stride, y, "EnemyProjectiles", obj_vinyl);
alarm[1] = attackSpeed*room_speed;