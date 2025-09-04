shader_type spatial;

render_mode specular_disabled,diffuse_lambert_wrap;

uniform vec3 BGCOLOR : source_color;
uniform vec3 DATACOLOR : source_color;
uniform float WAVE_STRENGTH;
uniform float WAVE_FREQ;
uniform float EMISSION_STRENGTH;
uniform sampler2D WAVE_TEX;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv = UV;
	
	float modTime = TIME * WAVE_FREQ;
	float mod_y = UV.y - modTime;
	uv.y += mod_y;
	vec4 data_tex = texture(WAVE_TEX,uv);
	vec3 base = BGCOLOR;
	vec3 mixed = mix(base, DATACOLOR,data_tex.r * WAVE_STRENGTH);
	vec3 emission_mix = mix(base,DATACOLOR,data_tex.r * EMISSION_STRENGTH);
	
	ALBEDO = mixed;
	EMISSION = emission_mix;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
