// Inherit the parent event
event_inherited();

//Move the vynil together with the bot
if vinyl != noone {
	with vinyl {
		x = other.x-other.stride;
		y = other.y;
	}
}
if alarm[1] < 0 {
	alarm[1] = attackSpeed*room_speed;
}