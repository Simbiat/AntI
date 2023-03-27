function spawn(object_index)
{
	switch (object_index) {
		//This is for demo only
	    case obj_player:
	        instance_create_layer(107, 839, "Instances", object_index);
	        break;
		case obj_flying_bomb:
			//Lowest Y = 812
			//Highest Y = 0 + sprite_get_height(spr_flying_bomb)
	        instance_create_layer(1805, random_range(812, sprite_get_height(spr_flying_bomb)*7/2), "Instances", object_index);
	        break;
	    default:
	        // code here
	        break;
	}
}