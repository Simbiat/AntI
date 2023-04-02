if selected {
	shader_set(sha_outline);
	var texture = sprite_get_texture(sprite_index, image_index);
	var t_width = texture_get_texel_width(texture);
	var t_height = texture_get_texel_height(texture);
	var outlineColor = [1.0, 1.0, 1.0, 1.0];
	shader_set_uniform_f(shader_get_uniform(sha_outline, "u_Texel"), t_width, t_height);
	shader_set_uniform_f(shader_get_uniform(sha_outline, "u_Width"), 5.0);
	shader_set_uniform_f_array(shader_get_uniform(sha_outline, "u_Outline"), outlineColor);
	draw_self();
	shader_reset();
} else {
	draw_self();
}