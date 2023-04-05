//Music notes from player models
if guitars_step <= 0 {
	guitars_step = guitars_step_init;
}
if guitars_step == guitars_step_init {
	with obj_character_0 {
		instance_create_layer(x + sprite_width/2, y - sprite_height/2, "Projectiles", obj_bullet_up, {target: autoTarget(room_width/2)});
	}
}
if guitars_step == guitars_step_init/2 {
	with obj_character_1 {
		instance_create_layer(x + sprite_width/2, y - sprite_height/2, "Projectiles", obj_bullet_up, {target: autoTarget(room_width/2)});
	}
}
guitars_step--;

//Enemy generation
if enemy_step <= 0 {
	enemy_step = enemy_step_init;
}
if enemy_step == enemy_step_init {
	instance_create_layer(room_width + sprite_get_width(spr_pop_star)/2, random_range(900 - sprite_get_height(spr_pop_star)/2, sprite_get_height(spr_pop_star)/2), "Instances", obj_pop_star_title);
}
enemy_step--;

//Music notes from speaker, if music is playing
if obj_vol_ctrl.musicID != noone {
	if speaker_step <= 0 {
		speaker_step = speaker_step_init;
	}
	if speaker_step == speaker_step_init {
		instance_create_layer(random_range(150, 250), random_range(565, 740), "Projectiles", obj_bullet_up);
	}
	speaker_step--;
} else {
	speaker_step = speaker_step_init;
}