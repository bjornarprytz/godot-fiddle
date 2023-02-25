shader_type canvas_item;

uniform sampler2D noise_tex : source_color;
uniform float dissolveState: hint_range(0.0, 1.0) = -0.05;

void fragment()
{	
	vec4 textureColor = texture(TEXTURE, UV);
	float brightness = texture(noise_tex, UV).r;
	
	COLOR = textureColor;
	COLOR.a *= step(dissolveState, brightness); // step(..) returns 1 if dissolveState is higher than brightness
	
	float dissolveDif = abs(brightness - dissolveState);
	COLOR.rgb += vec3(1,1,0) * step(dissolveDif, 0.05);

}