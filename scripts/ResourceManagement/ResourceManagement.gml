function charSelect(charid)
{
	with (obj_selectable_char) {
		selected = false;
	}
	obj_res_manager.charid = charid;
	var charObj = asset_get_index("obj_character_"+string(charid));
	with (charObj) {
		selected = true;
	}
}

//Play sound only if music is not being played
function play_sound(sound_asset, loop = false)
{
	if obj_res_manager.music_file == noone || audio_is_playing(obj_res_manager.music_file) == false {
		audio_play_sound(sound_asset, 1, loop,  obj_res_manager.gain);
	}
}