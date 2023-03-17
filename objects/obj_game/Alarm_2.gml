/// @description Start the music
//Check how much time we have left on alarm[3]
if alarm[3] >= 0 && alarm[3] <  music_slice*room_speed/3 {
	//We timed correctly, delay music stop
	alarm[3] = music_slice*room_speed;
} else {
	if alarm[3] >= music_slice*room_speed/3 {
		//Too soon, reset position
		music_position = 0;
		audio_stop_sound(music_file);
	}
	//Start playing, if not playing already
	if !audio_is_playing(music_file) {
		audio_play_sound(music_file,10,0,1,music_offset+music_position);
	}
	//Move the position by chosen number of seconds
	music_position += music_slice;
	//Set alarm to stop the music
	alarm[3] = music_slice*room_speed;
}