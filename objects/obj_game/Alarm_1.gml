///@description Delay respawn
if obj_game.daves > -1 {
	spawn(obj_dave);
} else {
	game_restart();	
}