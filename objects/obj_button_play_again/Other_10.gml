if !obj_res_manager.changingRooms {
	audio_stop_all();
	obj_res_manager.changingRooms = true;
	//Black-out transition
	blackout = layer_sequence_create("BlackInOut", room_width/2, room_height/2, seq_black_out);
	alarm[0] = 119;
}