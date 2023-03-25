function spawn(object_index)
{
	switch (object_index) {
		//This is for demo only
	    case obj_dave:
	        instance_create_layer(107, 839, "Instances", object_index);
	        break;
		case obj_zombie:
			//Lowest Y = 812
			//Highest Y = 0 + sprite_get_height(zombie_left_walk)
	        instance_create_layer(1805, random_range(812, sprite_get_height(zombie_left_walk)*7/2), "Instances", object_index);
	        break;
	    default:
	        // code here
	        break;
	}
}