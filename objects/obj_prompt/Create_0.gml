function buttonSpriteSelect()
{
	switch (button) {
	    case "up":
	        if obj_res_manager.gamepad != noone && gamepad_is_connected(obj_res_manager.gamepad) {
				if obj_res_manager.gamepadType == "ps" {
					image_index = 8;
				} else {
					image_index = 4;
				}
			} else {
				image_index = 0;
			}
	        break;
	    case "right":
	        if obj_res_manager.gamepad != noone && gamepad_is_connected(obj_res_manager.gamepad) {
				if obj_res_manager.gamepadType == "ps" {
					image_index = 9;
				} else {
					image_index = 5;
				}
			} else {
				image_index = 1;
			}
	        break;
	    case "down":
	        if obj_res_manager.gamepad != noone && gamepad_is_connected(obj_res_manager.gamepad) {
				if obj_res_manager.gamepadType == "ps" {
					image_index = 10;
				} else {
					image_index = 6;
				}
			} else {
				image_index = 2;
			}
	        break;
	    case "left":
	        if obj_res_manager.gamepad != noone && gamepad_is_connected(obj_res_manager.gamepad) {
				if obj_res_manager.gamepadType == "ps" {
					image_index = 11;
				} else {
					image_index = 7;
				}
			} else {
				image_index = 3;
			}
	        break;
	    default:
	        //Do nothing
	        break;
	}
}

//Both TTL and timer are FRAMES not seconds!!!

//Do not let TTL be less than third of a second (otherwise it becomes too difficult
ttl = max(ttl, room_speed/3);
//Do not let TTL be more than 5 seconds (otherwise it becomes too easy)
ttl = min(ttl, 5*room_speed);
//Set timer to TTL plus a small buffer of third of a second, to allow slight 
timer = ttl + input_buffer + room_speed/10;

if !initial {
	sprite_index = spr_button_prompts;
	image_xscale = 0;
	image_yscale = 0;
} else {
	sprite_index = spr_space;
	warning = 0;
	selected = true;
	image_xscale = 2;
	image_yscale = 2;
	if obj_res_manager.gamepad != noone && gamepad_is_connected(obj_res_manager.gamepad) {
		if obj_res_manager.gamepadType == "ps" {
			image_index = 2;
		} else {
			image_index = 1;
		}
	} else {
		image_index = 0;
	}
}