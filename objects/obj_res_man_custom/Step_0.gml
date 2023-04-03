// Inherit the parent event
event_inherited();

if gamepad != noone && gamepad_is_connected(gamepad) {
	//Menu on gamepad Start button
	if gamepad_button_check_pressed(gamepad, gp_start) {
		if room == main_room {
			audio_stop_all();
			room_goto(title_menu);
		} else {
			room_goto(main_room);
		}
	}
	if gamepad_button_check_pressed(gamepad, gp_face2) {
		if room == title_menu {
			game_end_alt();
		}
	}
	//Character selection with gamepad
	//For some reason gp_select is always registeed at gamepad slot 0, so using a "backup"
	//Bug reported under #208139 ticket
	if room == title_menu && (gamepad_button_check_released(gamepad, gp_select) && gamepad_button_check_released(0, gp_select)) {
		if charid == 0 {
			charSelect(1);
		} else {
			charSelect(0);
		}
	}
}

//Parallax effect
if instance_exists(obj_player) && obj_player.is_grounded == false {
	layer_x("city_front", -lerp(0, bg_offset, 0.8));
	layer_x("city_back", -lerp(0, bg_offset, 0.5));
	layer_x("sky", -lerp(0, bg_offset, 0.65));
	bg_offset += obj_player.stride;
}