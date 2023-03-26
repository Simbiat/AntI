//Handle gamepad
switch(async_load[? "event_type"])             // Parse the async_load map to see which event has been triggered
{
case "gamepad discovered":                     // A game pad has been discovered
	gamepad = async_load[? "pad_index"];       // Get the pad index value from the async_load map
    break;
case "gamepad lost":                           // Gamepad has been removed or otherwise disabled
    gamepad = async_load[? "pad_index"];       // Get the pad index
    break;
}