if wrong {
	var shaderTone = [];
	var lum = [1.0, 1.0, 1.0, 1.0];
	var shaderTone = [0.53, 0.03137, 0.03137];
	shader_set(sha_tone);
	shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_lum"), lum);
	shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_tone"), shaderTone);
	draw_self();
	shader_reset();
} else if right {
	var shaderTone = [];
	var lum = [1.0, 0.843, 0.0, 1.0];
	var shaderTone = [0.299, 0.587, 0.114];
	shader_set(sha_tone);
	shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_lum"), lum);
	shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_tone"), shaderTone);
	draw_self();
	shader_reset();
} else {
	if image_alpha > 0 && (sprite_index = spr_button_prompts || sprite_index == spr_space) {
		objectOutline(3.0, [1.0, 0.843, 0.0, 1.0]);
	} else {
		draw_self();
	}
}