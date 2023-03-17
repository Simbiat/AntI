event_inherited();
if obj_game.deaths > 0 {
	//Set invincibility to prevent excessive deaths
	invincible = true;
	//Gold tone and black&white luminence (close to sepia effect)
	blinkShader(sha_tone, 7, 0.25*room_speed, [1.0, 0.843, 0.0], [0.299, 0.587, 0.114]);
	alarm[3] = 3*room_speed;
}