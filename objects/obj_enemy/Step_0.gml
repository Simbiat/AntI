applyPhysics();
if !isAttacking || (isAttacking && attackWhileMoving) {
	if facing == "left" {
		//When facing left the speed if a bit higher, due to relativity
		hspeed = -(obj_res_manager.stride/obj_res_manager.stride_divider + stride)*obj_res_manager.bg_front_speed;
	} else {
		hspeed = stride*obj_res_manager.bg_front_speed;
	}
} else {
	//Even when stopped, we need to move the object along with the background
	hspeed = -(obj_res_manager.stride/obj_res_manager.stride_divider)*obj_res_manager.bg_front_speed;
}
//Destroy if the object is past left wall
if bbox_right <= room_left_wall.bbox_left {
	outsideBoundaries = true;
	instance_destroy();	
}