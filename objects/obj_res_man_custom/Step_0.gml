// Inherit the parent event
event_inherited();

if obj_res_manager.gamepad != noone && gamepad_is_connected(obj_res_manager.gamepad) && gamepad_button_check_pressed(obj_res_manager.gamepad, gp_start) {
	audio_stop_all();
	room_goto(title_menu);
}