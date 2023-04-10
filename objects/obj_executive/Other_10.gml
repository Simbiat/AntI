/// @description Attack
if facing == "left" {
	instance_create_layer(x-55, y-130, "EnemyProjectiles", projectile);
} else {
	instance_create_layer(x+55, y-130, "EnemyProjectiles", projectile);
}