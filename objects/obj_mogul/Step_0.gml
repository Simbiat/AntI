if !isAttacking {
	if facing == "left" {
		//When facing left the speed if a bit higher, due to relativity
		hspeed = (obj_res_manager.stride/(obj_res_manager.stride_divider*2) + stride)*obj_res_manager.bg_front_speed;
	} else {
		hspeed = stride*obj_res_manager.bg_front_speed;
	}
} else {
	//Even when stopped, we need to move the object along with the background
	hspeed = (obj_res_manager.stride/obj_res_manager.stride_divider)*obj_res_manager.bg_front_speed;
}


if y == targetY || x = targetX {
	//Switch direction
	if going == "up" {
		if alarm[1] < 0 && alarm[2] < 0 {
			alarm[1] = attackSpeed*room_speed;
		}
	} else {
		going = "up";
		zigZag();
	}
}
move_towards_point(targetX, targetY, min(speed, point_distance(x, y, targetX, targetY)));

//Destroy if the object is past left wall
if bbox_right <= room_left_wall.bbox_left {
	outsideBoundaries = true;
	instance_destroy();	
}