x_speed = 0; // reset horizontal speed 

y_speed += grav; // add gravity to y_speed

if keyboard_check(vk_right) { // if the right arrow key is pressed

    x_speed = movement_speed; // set the horizontal speed to heidi's movement_speed

} else if keyboard_check(vk_left) { // otherwise, if the left arrow key is pressed

    x_speed = -movement_speed; // set the horizontal speed to negative heidi's movement_speed, making her move left

}

move_and_collide(x_speed, y_speed, oSolid);

if (place_meeting(x, y + 1, oSolid)) { // if heidi is on the ground

    if (keyboard_check_pressed(vk_up)) { // and the up arrow key is pressed

        y_speed = -5; // make heidi jump by setting her y_speed to a negative value

    } else { // otherwise, if heidi is on the ground but not jumping

        y_speed = 0; // set her y_speed to 0 so she doesn't fall through the ground

    }

}

if keyboard_check(vk_right) {

    x_speed = movement_speed; 

    image_xscale = 1; // flip heidi's sprite so she faces right

} else if keyboard_check(vk_left) {

    x_speed = -movement_speed; 

    image_xscale = -1; // reset her sprite so she faces left

}


/// @description Check for 'S' key interaction
if (!game_active) exit;  // Stop if game over
// --- CHECK WHAT PLAYER IS TOUCHING ---
touching_evil = false;
touching_regular = false;

// Check collision with all NPCs
with (oNPCs) {
    if (place_meeting(x, y, oPlayer)) {
        if (is_evil) {
            other.touching_evil = true;
        } else {
            other.touching_regular = true;
        }
    }
}
// --- INTERACTION (Press S) ---
if (keyboard_check_pressed(ord("S"))) {
    if (touching_regular) {
        // LOSE! Pressed S on regular NPC
        game_active = false;
        game_lost = true;
        lose_reason = "You caught the wrong guy!";
        show_debug_message("💀 YOU LOSE! Wrong NPC!");
    }
	else if (touching_evil) {
        // WIN! Pressed S on Evil
        game_active = false;
        game_won = true;
        show_debug_message("🎉 YOU WIN! Caught the Evil!");
    } 
    // If not touching any NPC, nothing happens (safe to press S anywhere else)
}