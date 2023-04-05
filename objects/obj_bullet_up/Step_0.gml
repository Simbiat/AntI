if target != noone && !instance_exists(target) {
	target = noone;
}
if target != noone && instance_exists(target) {
	if instance_exists(target) {
		move_towards_point(target.x, target.y, max_speed*2);
	}
} else {
	//move_towards_point(random_range(x-10, x+10), y-1, max_speed);
	t = (t + random_range(1,5)) mod 360;
	shift = amplitude * dsin(t);
 
	//clone the movement from the object's speed and direction
	xx += hspeed;
	yy += vspeed;
 
	//apply the shift
	x = xx + lengthdir_x(shift, direction + 90);
	y = yy + lengthdir_y(shift, direction + 90);
}