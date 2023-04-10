/// @description Drop vinyl
if vinyl != noone {
	with vinyl {
		dropped = true;
	}
	vinyl = noone;
} else {
	vinyl = instance_create_layer(x-stride, y, "EnemyProjectiles", obj_vinyl);
}