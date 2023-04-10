if instance_exists(obj_player) {
	move_towards_point(-sprite_width, obj_player.y + diffY*random_range(10,15), stride)	
}