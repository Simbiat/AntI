event_inherited();
if facing == "right" {
	hspeed = (obj_res_manager.stride + stride)*obj_res_manager.bg_front_speed;	
}

noseLocation();

if x == targetX {
	changeDirection();
}
move_towards_point(targetX, targetY, min(speed, point_distance(x, y, targetX, targetY)));


//Destroy if the object is past left wall
if bbox_right <= room_left_wall.bbox_left {
	instance_destroy();	
}

//Suck in notes
suckNotes();