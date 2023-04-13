if dropped && sprite_index != destroyedSprite {
	damagePlayer();
	if destroyedSprite != noone {
		if sfxDeath == noone {
			sfxDeath = play_sound(snd_crate);
		}
		sprite_index = destroyedSprite;
	} else {
		instance_destroy();
	}
}