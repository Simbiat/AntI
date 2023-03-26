function buttonSelection(fromCode = false)
{
	//Get number of buttons available
	var buttonCount = instance_number(obj_menu_button);
	//If we have 1 button only - ensure it's selected
	if buttonCount == 1 {
		obj_menu_button.selected = true;
	}
	//Do not do anything if there less than 2 button
	if buttonCount < 2 {
		return;	
	}
	//Check if we are trying to move through menu
	if !keyboard_check_pressed(vk_down) &&
		!keyboard_check_pressed(vk_up) &&
		!keyboard_check_pressed(vk_numpad8) &&
		!keyboard_check_pressed(vk_numpad2) &&
		(
			obj_res_manager.gamepad == noone ||
			!gamepad_is_connected(obj_res_manager.gamepad) ||
			(
				!gamepad_button_check_pressed(obj_res_manager.gamepad, gp_padu) &&
				!gamepad_button_check_pressed(obj_res_manager.gamepad, gp_padd)
			)
		) {
			return;
	}
	// create a new ds_grid to store the buttons and their positions
	var button_grid = ds_grid_create(3, buttonCount);

	// add all obj_menu_button instances to the grid
	var row = 0;
	var selectedButton = noone;
	var newButton = noone;
	with (obj_menu_button) {
	    ds_grid_set(button_grid, 0, row, id);
	    ds_grid_set(button_grid, 1, row, y);
	    ds_grid_set(button_grid, 2, row, selected);
		if selected {
			//Identify the selected button number
			selectedButton = row;
		}
	    row++;
	}
	// sort the grid based on the vertical position of the buttons
	ds_grid_sort(button_grid, 1, true);
	if selectedButton = noone {
		//If nothing selected - select the very first button
		newButton = ds_grid_get(button_grid, 0, 0);
	} else {
		//Determine the new button
		if keyboard_check_pressed(vk_down) || keyboard_check_pressed(vk_numpad2) ||
		 (obj_res_manager.gamepad != noone && gamepad_is_connected(obj_res_manager.gamepad) && gamepad_button_check_pressed(obj_res_manager.gamepad, gp_padu)) {
			row = selectedButton + 1;
		} else {
			row = selectedButton - 1;
		}
		//Wrap the selection
		if row < 0 {
			row = buttonCount - 1;
		} else if row > buttonCount - 1 {
			row = 0;
		}
		newButton = ds_grid_get(button_grid, 0, row);
	}
	//Deselect everything
	with (obj_menu_button) {
		selected = false;	
	}
	//Select the new button
	with (newButton) {
		selected = true;
		//Play hover sound, if set
		if !fromCode && sound_hover != noone {
			audio_play_sound(sound_hover, 0, 0);
		}
	}
}