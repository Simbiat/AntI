//Handle gamepad
switch(async_load[? "event_type"])             // Parse the async_load map to see which event has been triggered
{
case "gamepad discovered":                     // A game pad has been discovered
	if gamepad_get_description(async_load[? "pad_index"]) != "Xbox Series Controller" {
		gamepad = async_load[? "pad_index"];       // Get the pad index value from the async_load map
		if string_pos("playstation", string_lower(gamepad_get_description(gamepad))) {
			gamepadType = "ps";
		} else {
			gamepadType = "xinput";
		}
	}
    break;
case "gamepad lost":                           // Gamepad has been removed or otherwise disabled
    gamepad = async_load[? "pad_index"];       // Get the pad index
	if string_pos("playstation", string_lower(gamepad_get_description(gamepad))) {
		gamepadType = "ps";
	} else {
		gamepadType = "xinput";
	}
    break;
}