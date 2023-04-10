if instance_exists(obj_player) {
	move_towards_point(-sprite_width, max(obj_player.y, room_height/2), stride)	
}