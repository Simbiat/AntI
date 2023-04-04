if obj_res_manager.gamepad != noone && gamepad_is_connected(obj_res_manager.gamepad) {
	if obj_res_manager.gamepadType == "ps" {
		image_index = 2;
	} else {
		image_index = 1;
	}
} else {
	image_index = 0;
}