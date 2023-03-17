function flashOnBullet()
{
	shader_set(sha_tone);
	shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_lum"), [1.0, 1.0, 1.0, 1.0]);
	shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_tone"), [1.0, 1.0, 1.0, 1.0]);
	draw_self();
	shader_reset();
}

function blinkShader(shader, times, duration, tone = [], lum = [])
{
	flash_shader = shader;
	if array_length(tone) > 0 {
		flash_tone = tone;
	} else {
		flash_tone = [1.0, 1.0, 1.0, 1.0];
	}
	if array_length(lum) > 0 {
		flash_lum = lum;
	} else {
		flash_lum = [1.0, 1.0, 1.0, 1.0];
	}
	flash_times = times;
	flash_counter = 0;
	flash_duration = duration;
	if alarm[10] < 0 {
		alarm[10] = 1;
	}
}