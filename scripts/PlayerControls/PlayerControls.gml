//Check if jumping
function tryingToJump()
{
	if pressedJump() or pressedUp() or pressedDown() or pressedRight() or pressedLeft() {
		return true;
	} else {
		return false;
	}
}

function tryingToMusic()
{
	if pressedUp() or pressedDown() or pressedRight() or pressedLeft() {
		return true;
	} else {
		return false;
	}
}

function pressedJump()
{
	if obj_res_manager.gamepad != noone && gamepad_is_connected(obj_res_manager.gamepad) {
		if gamepad_button_check_pressed(obj_res_manager.gamepad, gp_padu) || gamepad_axis_value(obj_res_manager.gamepad, gp_axislv) < -0.5 {
			return true;
		}
	}
	if keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_numpad5) {
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

function processActions()
{
	if tryingToJump() {
		if obj_player.canJump {
			daveShoot();
			daveJump();
		}
		return;
	}
}

function daveJump(down = false, ceiling = false)
{
	//audio_play_sound(snd_jump, 1, false);
	isJumping = true;
	if down {
		obj_player.vspeed = obj_player.jump_height/1.5;
		//move_and_collide(0, obj_player.jump_height, obj_invis_floor);
		obj_player.canJump = false;
		if obj_player.alarm[1] < 0 {
			if ceiling {
				obj_player.alarm[1] = room_speed/4;
			} else {
				obj_player.alarm[1] = room_speed/6;
			}
		}
	} else {
		//obj_player.vspeed = -obj_player.jump_height;
		if is_grounded {
			move_towards_point(x, room_height/2, obj_player.jump_height*1.5)
		} else {
			//move_and_collide(0, -obj_player.jump_height, obj_invis_ceil);
			move_towards_point(x, y-obj_player.jump_height, obj_player.jump_height)
		}
	}
}

function daveShoot()
{
	//Also check that we are not shooting already or waiting for bullet to be created
	//This is required to prevent rapid fire from being "too fast"
	if obj_player.isShooting == false and obj_player.alarm[0] < 0 {
		obj_player.isShooting = true;
		var delay = 0.3;
		obj_player.alarm[0] = delay * room_speed;
	}
}

function shoot(_target = noone)
{
	var bulletX = 0;
	var bulletY = 0;
	//Calculate coordinates
	bulletX = bbox_right;
	bulletY = y - sprite_height/5;
	obj_game.alarm[2] = 1;
	//Create bullet
	if _target == noone {
		instance_create_layer(bulletX, bulletY, "Projectiles", obj_bullet);
	} else {
		instance_create_layer(bulletX, bulletY, "Projectiles", obj_bullet_instakill, {target: _target});
	}
	obj_player.isShooting = false;	
}

function punish(ceiling = false)
{
	screenshake(1, 2, 0.25, false, true, true, false, 0.5);
	daveJump(true, ceiling);	
}