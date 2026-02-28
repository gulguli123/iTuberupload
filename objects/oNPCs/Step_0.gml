/// @description Random walking behavior
// Count down to next direction change
direction_change_timer--;
if (direction_change_timer <= 0) {
    // 70% chance to change direction
    if (random(100) < 70) {
        walk_direction = choose(-1, 1);
        image_xscale = walk_direction;  // Flip sprite to face direction
        
        // Random speed change
        walk_speed = 0.5 + random(2);
    }
    
    // Reset timer
    direction_change_timer = direction_change_delay;
    direction_change_delay = 30 + random(90);
}

// Apply movement
x += walk_speed * walk_direction;

// Bounce at screen edges (for 320 width)
if (bounce_at_edges) {
    // Left edge
    if (x < 0) {
        x = 0;
        walk_direction = 1;
        image_xscale = 1;
    }
    // Right edge (320 - sprite width)
    if (x > 320 - sprite_width) {
        x = 320 - sprite_width;
        walk_direction = -1;
        image_xscale = -1;
    }
}