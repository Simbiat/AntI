//Example of usage
//shader_set(sha_outline);
//var texture = sprite_get_texture(sprite_index, image_index);
//var t_width = texture_get_texel_width(texture);
//var t_height = texture_get_texel_height(texture);
//var outlineColor = [0.53, 0.03137, 0.03137];
//shader_set_uniform_f(shader_get_uniform(sha_outline, "u_Texel"), t_width, t_height);
//shader_set_uniform_f(shader_get_uniform(sha_outline, "u_Width"), 2.0);
//shader_set_uniform_f_array(shader_get_uniform(sha_outline, "u_Outline"), outlineColor);
//draw_self();
//shader_reset();

//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
