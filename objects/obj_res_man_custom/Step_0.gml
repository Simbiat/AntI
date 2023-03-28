// Inherit the parent event
event_inherited();

//Menu on gamepad Start button
if obj_res_manager.gamepad != noone && gamepad_is_connected(obj_res_manager.gamepad) && gamepad_button_check_pressed(obj_res_manager.gamepad, gp_start) {
	audio_stop_all();
	room_goto(title_menu);
}

//Parallax effect
if instance_exists(obj_player) && obj_player.is_grounded == false {
	layer_x("city_front", -lerp(0, bg_offset, 0.8));
	layer_x("city_back", -lerp(0, bg_offset, 0.5));
	layer_x("sky", -lerp(0, bg_offset, 0.65));
	bg_offset += obj_player.stride;
}