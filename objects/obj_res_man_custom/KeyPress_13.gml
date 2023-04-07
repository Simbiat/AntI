/// @description Start game
if room == title_menu {
	with obj_button_play {
		event_user(0);
	}
} else if room == main_room {
	if instance_exists(obj_button_play_again) {
		with obj_button_play_again {
			event_user(0);
		}
	}
}