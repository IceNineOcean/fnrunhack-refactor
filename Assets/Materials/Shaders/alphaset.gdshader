shader_type spatial;
render_mode blend_mix,depth_draw_opaque,cull_disabled,diffuse_burley,specular_schlick_ggx;
uniform vec4 albedo : source_color;
uniform sampler2D texture_albedo : source_color;
uniform float specular;
uniform float metallic;
uniform float roughness : hint_range(0,1);
uniform float point_size : hint_range(0,128);
uniform sampler2D texture_emission : hint_default_black;
uniform vec4 emission : source_color;
uniform float emission_energy;
uniform vec3 uv1_scale;
uniform vec3 uv1_offset;
uniform vec3 uv2_scale;
uniform vec3 uv2_offset;
uniform float alpha_set;


void vertex() {
	UV=UV*uv1_scale.xy+uv1_offset.xy;
}




void fragment() {
	vec2 base_uv = UV;
	vec4 albedo_tex = texture(texture_albedo,base_uv);
	ALBEDO = albedo.rgb * albedo_tex.rgb;
	METALLIC = metallic;
	ROUGHNESS = roughness;
	//SPECULAR = specular;
	//vec3 emission_tex = texture(texture_emission,base_uv).rgb;
	//EMISSION = (emission.rgb+emission_tex)*emission_energy;

	int x = int(FRAGCOORD.x) % 4;
	int y = int(FRAGCOORD.y) % 4;

	int ind = x + y * 4;
	float lim = 0.0;

	if (x < 4) {
		if (ind == 0) lim = 0.0625;
		if (ind == 1) lim = 0.5625;
		if (ind == 2) lim = 0.1825;
		if (ind == 3) lim = 0.6825;
		if (ind == 4) lim = 0.8125;
		if (ind == 5) lim = 0.3125;
		if (ind == 6) lim = 0.9375;
		if (ind == 7) lim = 0.4375;
		if (ind == 8) lim = 0.25;
		if (ind == 9) lim = 0.75;
		if (ind == 10) lim = 0.125;
		if (ind == 11) lim = 0.625;
		if (ind == 12) lim = 1.0;
		if (ind == 13) lim = 0.5;
		if (ind == 14) lim = 0.875;
		if (ind == 15) lim = 0.375;
	}

	if (alpha_set < lim) discard;
}