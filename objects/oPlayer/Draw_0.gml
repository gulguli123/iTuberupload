/// @description Draw player and game state
// Draw player sprite
draw_self();

// Draw game status
if (!game_active) {
    draw_set_halign(fa_center);
    
    if (game_won) {
        draw_set_color(c_lime);
        draw_text(room_width/2, room_height/2 - 20, "YOU WIN!");
        draw_set_color(c_white);
        draw_text(room_width/2, room_height/2, "Caught the Evil!");
    }
    
    if (game_lost) {
        draw_set_color(c_red);
        draw_text(room_width/2, room_height/2 - 20, "GAME OVER!");
        draw_set_color(c_white);
        draw_text(room_width/2, room_height/2, lose_reason);
    }
    
    draw_set_halign(fa_left);
}

// Draw instructions (only if game is active)
if (game_active) {
    draw_set_color(c_white);
    draw_text(5, room_height - 45, "Arrows: Move");
    draw_text(5, room_height - 30, "S: Catch Evil");
    draw_text(5, room_height - 15, "(Spacebar for easter egg)");
    
    // Show what player is touching
    if (touching_evil) {
        draw_set_color(c_lime);
        draw_text(5, 5, "🔥 ON EVIL! Press S to catch!");
    }
    else if (touching_regular) {
        draw_set_color(c_yellow);
        draw_text(5, 5, "⚠️ On regular NPC - Don't press S!");
    }
}
