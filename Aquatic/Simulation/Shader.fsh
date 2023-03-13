
void main() {
    float current_alpha = texture2D(u_texture, v_tex_coord).a;
    gl_FragColor = current_alpha > 0.07
        ? aqua_color
        : vec4(0.0);
}

