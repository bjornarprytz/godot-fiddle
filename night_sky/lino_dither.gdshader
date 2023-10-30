shader_type canvas_item;

uniform sampler2D bayer_matrix : source_color;

void fragment() {
    vec4 albedo = texture(TEXTURE, UV);

    // Posterize to two levels (0.0 and 1.0)
    float levels = 1.0; 
    vec3 posterizedColor = floor(albedo.rgb * (levels + 0.5));

    // Apply dithering
    float ditherValue = texture(bayer_matrix, mod(FRAGCOORD.xy, vec2(2.0))).r; // 2.0 here to use the 2x2 Bayer matrix
    vec3 ditheredColor = clamp(posterizedColor + ditherValue - 0.5, 0.0, 1.0); // Subtract 0.5 to offset the Bayer matrix

    COLOR = vec4(ditheredColor, albedo.a);
}
