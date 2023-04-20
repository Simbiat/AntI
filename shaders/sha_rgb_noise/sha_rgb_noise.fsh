//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
uniform float time;
uniform float intensity;

void main()
{
    vec3 color = vec3(0.0);
    float noise = fract(sin(dot(v_vTexcoord + vec2(time, time), vec2(12.9898, 78.233))) * 43758.5453);
    color.r = noise;
    noise = fract(sin(dot(v_vTexcoord + vec2(time * 1.5, time * 2.0), vec2(12.9898, 78.233))) * 43758.5453);
    color.g = noise;
    noise = fract(sin(dot(v_vTexcoord + vec2(time * 0.5, time * 1.0), vec2(12.9898, 78.233))) * 43758.5453);
    color.b = noise;
    
    vec4 original_color = texture2D(gm_BaseTexture, v_vTexcoord);
    vec3 final_color = mix(original_color.rgb, color, intensity);
    gl_FragColor = vec4(final_color, original_color.a);
}
