hspeed = stride;
move_towards_point(-sprite_width/2, y, hspeed);

//Destroy if the object is past left wall
if bbox_right <= 0 {
	outsideBoundaries = true;
	instance_destroy();	
}