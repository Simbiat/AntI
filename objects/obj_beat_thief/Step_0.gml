event_inherited();
if facing == "right" {
	hspeed = (obj_res_manager.stride/obj_res_manager.stride_divider + stride)*obj_res_manager.bg_front_speed;	
}

noseLocation();

if x == targetX {
	changeDirection();
}
move_towards_point(targetX, targetY, min(speed, point_distance(x, y, targetX, targetY)));

//Suck in notes
suckNotes();