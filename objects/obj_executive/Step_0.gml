// Inherit the parent event
event_inherited();

if alarm[1] < 0 && alarm[2] < 0 {
	alarm[1] = attackSpeed*room_speed;	
}