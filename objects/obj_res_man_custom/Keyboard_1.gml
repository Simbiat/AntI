/// @description Arrow controls in title screen
if room == title_menu {
	if keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right) {
		//Character selection
		with obj_button_char_select {
			event_user(0);
		}
	} else if keyboard_check_pressed(vk_up) {
		with volume_up {
			event_user(0);
		}
	} else if keyboard_check_pressed(vk_down) {
		with volume_down {
			event_user(0);
		}
	}
}
