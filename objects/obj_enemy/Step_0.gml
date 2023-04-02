applyPhysics();
speed = stride * min(max(obj_game.combo/4, 1), 10);

//Destroy if the object is past left wall
if bbox_right <= room_left_wall.bbox_left {
	instance_destroy();	
}