var shaderTone = [];
var lum = [1.0, 1.0, 1.0, 1.0];
var shaderTone = [0.53, 0.03137, 0.03137];
shader_set(sha_tone);
shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_lum"), lum);
shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_tone"), shaderTone);
draw_self();
shader_reset();