shader_type canvas_item;

uniform float speed;

void fragment() {
	vec2 x = UV;
	x.x += speed * TIME;
	vec4 col = texture(TEXTURE, x);
	COLOR = col;
}