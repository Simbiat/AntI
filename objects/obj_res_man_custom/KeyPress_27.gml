// Inherit the parent event
event_inherited();

if room != title_menu {
	audio_stop_all();
	room_goto(title_menu);
}