/// @description Enemy spawning
if obj_player.is_grounded || spawn() == false {
	//If nothing was spawned run again on next step to as soon as there is a free enemy slot
	alarm[1] = 1;
}