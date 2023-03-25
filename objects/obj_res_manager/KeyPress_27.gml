if room == rm_menu {
	game_end_alt();	
} else {
	audio_stop_all();
	room_goto(rm_menu);
}