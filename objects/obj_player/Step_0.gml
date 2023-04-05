event_inherited();
if !is_grounded {
	sprite_index = asset_get_index("char_"+string(obj_res_manager.charid)+"_jump");
} else {
	//Retrun ability to jump, as soon as we are grounded
	canJump = true;
	sprite_index = asset_get_index("char_"+string(obj_res_manager.charid)+"_stand");
}
if isDead {
	hspeed = 0;
	sprite_index = asset_get_index("char_"+string(obj_res_manager.charid)+"_jump");
} else {
	processActions();
}