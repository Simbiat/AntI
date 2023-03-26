/// @description Functions that check for player's actions
//Essentially, used for the sake of checking what buttons are being pressed,
//since I want to allow using various buttons

//Check if jumping
function tryingToJump()
{
	if  pressedUp() or pressedDown() or pressedRight() or pressedLeft() {
		return true;
	} else {
		return false;
	}
}

function pressedUp()
{
	if obj_res_manager.gamepad != noone && gamepad_is_connected(obj_res_manager.gamepad) {
		if gamepad_button_check_pressed(obj_res_manager.gamepad, gp_face4) {
			return true;
		}
	}
	if keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_numpad8) {
		return true;
	} else {
		return false;
	}
}

function pressedDown()
{
	if obj_res_manager.gamepad != noone && gamepad_is_connected(obj_res_manager.gamepad) {
		if gamepad_button_check_pressed(obj_res_manager.gamepad, gp_face1) {
			return true;
		}
	}
	if keyboard_check_pressed(vk_down) or keyboard_check_pressed(vk_numpad2) {
		return true;
	} else {
		return false;
	}
}

function pressedLeft()
{
	if obj_res_manager.gamepad != noone && gamepad_is_connected(obj_res_manager.gamepad) {
		if gamepad_button_check_pressed(obj_res_manager.gamepad, gp_face3) {
			return true;
		}
	}
	if keyboard_check_pressed(vk_left) or keyboard_check_pressed(vk_numpad4) {
		return true;
	} else {
		return false;
	}
}

function pressedRight()
{
	if obj_res_manager.gamepad != noone && gamepad_is_connected(obj_res_manager.gamepad) {
		if gamepad_button_check_pressed(obj_res_manager.gamepad, gp_face2) {
			return true;
		}
	}
	if keyboard_check_pressed(vk_right) or keyboard_check_pressed(vk_numpad6) {
		return true;
	} else {
		return false;
	}
}