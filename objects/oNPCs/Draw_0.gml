/// @description Draw NPC
draw_self();

// Evil gets special effects
if (is_evil) {
    // Pulsing red glow
    var pulse = abs(sin(current_time * 0.005)) * 8 + 4;
    draw_set_color(c_red);
    draw_set_alpha(0.3);
    draw_circle(x, y, sprite_width/2 + pulse, false);
    draw_set_alpha(1);
    
    // "EVIL" tag
    draw_set_color(c_red);
    draw_text(x - 15, y - 30, "EVIL");
    
    // Danger aura
    draw_set_color(c_red);
    draw_set_alpha(0.1);
    draw_circle(x, y, sprite_width, true);
    draw_set_alpha(1);
} else {
    // Regular NPCs have small indicator
    if (sprite_index == sPlayer1) {
        draw_set_color(c_blue);
        draw_circle(x + 5, y - 15, 2, true);
    } else {
        draw_set_color(c_gray);
        draw_circle(x + 5, y - 15, 2, true);
    }
}