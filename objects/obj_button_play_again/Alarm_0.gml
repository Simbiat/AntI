if blackout != noone {
	layer_sequence_destroy(blackout);
	blackout = noone;
}
obj_res_manager.changingRooms = false;
audio_stop_all();
room_restart();