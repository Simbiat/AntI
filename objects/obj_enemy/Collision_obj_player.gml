if damagePlayerOnCollision {
	//Ignore hits if player is on the ground or invincible
	if !other.is_grounded && !other.invincible {
		damagePlayer();
	}
	if !touched {
		touched = true;
	}
}
if damageSelfOnCollision {
	damageEnemy(false);	
}