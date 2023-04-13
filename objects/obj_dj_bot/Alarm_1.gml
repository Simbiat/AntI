/// @description Drop vinyl
if vinyl != noone {
	with vinyl {
		dropped = true;
		sfxID = play_sound(snd_bomb_drop);
	}
	vinyl = noone;
} else {
	vinyl = instance_create_layer(x-stride, y, "EnemyProjectiles", obj_vinyl);
}