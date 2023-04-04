event_inherited();

//If we are in a browser, need to adjust the size of the screen to allow to remove it completely
audio_stop_all();
if room == obj_res_manager.title_menu {
	game_end_alt();
} else {
	room_goto(obj_res_manager.title_menu);
}