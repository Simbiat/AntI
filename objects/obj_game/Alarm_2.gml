/// @description Start the music
//Start playing, if not playing already
if !audio_is_playing(obj_res_manager.music_file) {
	audio_play_sound(obj_res_manager.music_file,10,0,1,obj_res_manager.music_offset);
}