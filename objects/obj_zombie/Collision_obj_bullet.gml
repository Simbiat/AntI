if other.target == noone {
	instance_destroy(other);
	hp -= 1;
	if (hp == 0) {
		//Temporary code for testing
		spawn(obj_zombie);
		//Destroy the instance
		instance_destroy();
	} else {
		blink_on_hit = true;
		alarm[0] = 0.25*room_speed;
	}
} else {
	if other.target == id {
		instance_destroy(other);
	}
	//Temporary code for testing
	spawn(obj_zombie);
	//Destroy the instance
	instance_destroy();
}