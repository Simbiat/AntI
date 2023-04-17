hspeed = (obj_res_manager.stride + stride)*obj_res_manager.bg_front_speed;
if instance_exists(obj_player) && !obj_player.is_grounded {
	move_towards_point(closest_left_wall.bbox_left - sprite_width/2, obj_player.y, speed);
} else {
	move_towards_point(closest_left_wall.bbox_left - sprite_width/2, y, speed);
}
//Destroy if the object is past left wall
if bbox_right <= room_left_wall.bbox_left {
	outsideBoundaries = true;
	instance_destroy();	
}
if alarm[1] < 0 && alarm[2] < 0 {
	alarm[1] = attackSpeed*room_speed;	
}