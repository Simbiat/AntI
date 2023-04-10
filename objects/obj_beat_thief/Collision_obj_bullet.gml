if other.target == noone {
	if other.suckedIn {
		instance_destroy(other);
	} else {
		instance_destroy(other);
		damageEnemy(true);
	}
} else {
	if other.target == id {
		instance_destroy(other);
	}
	//Destroy the instance
	instance_destroy();
}