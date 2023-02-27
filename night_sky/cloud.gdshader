shader_type canvas_item;

uniform sampler2D noise_tex : source_color, repeat_enable;
uniform sampler2D noise_tex2 : source_color, repeat_enable;
uniform vec2 scroll = vec2(0.9, 0.5);

uniform float speed : hint_range(0.0, 1.0) = 0.03;
uniform float brightness: hint_range(0.0, 2.0) = 0.1;
uniform float threshold : hint_range(0.0, 2.0) = 0.1;
uniform float fluffiness : hint_range(0.0, 2.0) = 0.1;

void fragment() {
	vec4 noise = texture(noise_tex, mod(UV + TIME * 2.5 * speed / 10.0, 0.0));
	vec4 noise2 = texture(noise_tex, mod(UV + TIME * (2.5 + fluffiness * 3.0) * speed / 10.0, 0.0));
	vec4 combinedNoise = noise + noise2;
	
	COLOR =  texture(noise_tex, UV + (scroll * TIME  * speed));
	COLOR.a = 0.5;
}
