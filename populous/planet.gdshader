shader_type spatial;
 
uniform sampler2D height_map;
uniform float height_multiplier : hint_range(0.0, 5.0);
 
void vertex() {
    vec4 height_map_value = texture(height_map, UV);
    float height = height_map_value.r * height_multiplier;
    float radius = length(VERTEX);
    VERTEX = normalize(VERTEX) * (radius + height);
	COLOR = vec4(0.2);
}

void fragment() {
}