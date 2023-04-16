if sfxID != noone {
	audio_stop_sound(sfxID);	
}
if sfxDeath != noone && outsideBoundaries == false {
	play_sound(sfxDeath);
}
if !touched && !killed {
	if instance_exists(obj_game) && obj_game.hp >= 0 {
		obj_game.enemies_dodged++;
	}
}