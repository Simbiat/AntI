if !finished && x == targetX {
	finished = true;
	//Trigger next sequence
	if next_sequence != noone {
		layer_sequence_create("GameOver", room_width/2, room_height/2, next_sequence);
	} else if valueObject != noone {
		instance_create_layer(room_width/2 - 150, y, "UI", valueObject);
	}
}