if sfxID != noone {
	audio_stop_sound(sfxID);	
}
if sfxDeath != noone && outsideBoundaries == false {
	play_sound(sfxDeath);
}