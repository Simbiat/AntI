function spawn(object_index)
{
	switch (object_index) {
		//This is for demo only
	    case obj_dave:
	        instance_create_layer(107, 839, "Instances", object_index);
	        break;
		case obj_frank:
	        instance_create_layer(1729, 673, "Instances", object_index);
	        break;
		case obj_zombie:
	        instance_create_layer(1805, 812, "Instances", object_index);
	        break;
	    default:
	        // code here
	        break;
	}
}