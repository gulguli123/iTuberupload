/// @description Train movement with wrap delay
// Check if we're in the waiting period
if (wrap_timer > 0) {
    // Train is waiting to reappear (count down the timer)
    wrap_timer--;
    
    // When timer reaches zero, reset to left side
    if (wrap_timer <= 0) {
        x = -sprite_width;      // Teleport back to left
        speed_current = 0;       // Start stopped
    }
} 
else {
    // Normal movement (not waiting)
    // Space bar control
    if (keyboard_check(vk_space)) {
        speed_current = min(speed_current + acceleration, speed_max);
    } else {
        speed_current = max(speed_current - deceleration, 0);
    }
    
    // Apply movement
    x += speed_current;
    
    // Check if reached right edge
    if (x > room_width) {
        wrap_timer = wrap_delay;  // Start waiting period
        x = room_width;            // Hold at edge while waiting
        speed_current = 0;         // Stop immediately
    }
}