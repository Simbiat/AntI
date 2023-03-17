event_inherited();
function reduceHP()
{
	hp -= 1;
	if (hp == 0) {
	
	
	
	
		//Temporary code for testing
		switch (object_index) {
		    case obj_zombie:
		        spawn(obj_frank);
		        break;
			case obj_frank:
		        spawn(obj_zombie);
		        break;
		    default:
		        //Do nothing
		        break;
		}
	
	
	
	
	
		//Destroy the instance
		instance_destroy();
	} else {
		blink_on_hit = true;
		alarm[0] = 0.25*room_speed;
	}
}
