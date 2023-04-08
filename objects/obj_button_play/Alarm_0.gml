if blackout != noone {
	layer_sequence_destroy(blackout);
	blackout = noone;
}
obj_res_manager.changingRooms = false;
room_goto(main_room);