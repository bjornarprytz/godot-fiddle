shader_type canvas_item;

uniform sampler2D noise_tex : source_color;

void fragment()
{
	float dissolveState = sin(TIME);
	
	vec4 textureColor = texture(TEXTURE, UV);
	float brightness = texture(noise_tex, UV).r;
	
	COLOR = textureColor;
	COLOR.a *= step(dissolveState, brightness);
	
	float dissolveDif = abs(brightness - dissolveState);
	COLOR.rgb += vec3(1,1,0) * step(dissolveDif, 0.05);

}