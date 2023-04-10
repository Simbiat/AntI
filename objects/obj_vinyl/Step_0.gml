//Slowly remove object
if destroyedSprite != noone && sprite_index == destroyedSprite {
	image_alpha -= 0.01;
}
//Fully remove it
if image_alpha <= 0 {
	instance_destroy();	
}

if dropped && sprite_index != destroyedSprite {
	move_and_collide(-stride, gravityForce, room_floor)
}
if is_grounded {
	sprite_index = destroyedSprite;
}

if sprite_index != destroyedSprite {
	image_angle++;
}