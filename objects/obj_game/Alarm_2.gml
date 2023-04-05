/// @description Start the music
//Start playing, if not playing already
if !audio_is_playing(obj_res_manager.music_file) {
	musicID = audio_play_sound(obj_res_manager.music_file, 10, 1, obj_res_manager.gain, obj_res_manager.music_offset);
}