if destroyedSprite == noone {
	if sfxDeath == noone {
		sfxDeath = play_sound(snd_crate);
	}
	instance_destroy();
} else {
	if sprite_index != destroyedSprite {
		if sfxDeath == noone {
			sfxDeath = play_sound(snd_crate);
		}
		sprite_index = destroyedSprite;
	}
}