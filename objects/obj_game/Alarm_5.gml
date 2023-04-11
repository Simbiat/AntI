/// @description Increase saturation
if instance_exists(obj_player) && !obj_player.is_grounded && obj_res_manager.desaturation > 0 {
	obj_res_manager.desaturation -= 0.01538461538461538;
}