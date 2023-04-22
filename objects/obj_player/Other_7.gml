var jumpSprite = asset_get_index("char_"+string(obj_res_manager.charid)+"_jump");
var fallSprite = asset_get_index("char_"+string(obj_res_manager.charid)+"_falling");
if sprite_index == jumpSprite {
	sprite_index = fallSprite;
}