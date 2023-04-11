if dropped && sprite_index != destroyedSprite {
	damagePlayer();
	if destroyedSprite != noone {
		sprite_index = destroyedSprite;
	} else {
		instance_destroy();
	}
}