//Handle styling
if selected {
	if pressed {
		image_index = 2;
	} else {
		image_index = 1;
	}
} else {
	image_index = 0;	
}

//Handle gamepad
if obj_res_manager.gamepad != noone && gamepad_is_connected(obj_res_manager.gamepad) {
	if selected && gamepad_button_check_pressed(obj_res_manager.gamepad, gp_face1) {
		event_user(0);
	}
}