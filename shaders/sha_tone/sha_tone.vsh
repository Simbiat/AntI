//Example of usage
//var shaderTone = [];
//Set the "intenity" or "brightness" of each color component
//var lum = [1.0, 1.0, 1.0, 1.0];
//Set the color to blend in (the below is "blood" color)
//var shaderTone = [0.53, 0.03137, 0.03137];
//shader_set(sha_tone);
//shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_lum"), lum);
//shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_tone"), shaderTone);
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
