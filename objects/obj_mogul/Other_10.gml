/// @description Custom attack
repeat(3) {
	var dollarY = random_range(y-sprite_height/2, y+sprite_height/2);
	instance_create_layer(x-55, random_range(y-sprite_height/2, y+sprite_height/2), "EnemyProjectiles", projectile, {diffY: y - dollarY});
}