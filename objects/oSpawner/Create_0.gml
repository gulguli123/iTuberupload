/// @description Spawn NPCs including one Evil
// First, spawn the Evil character (always 1)
var evil_x = random(320 - 40) + 20;
var evil_y = 110;
var evil_npc = instance_create_layer(evil_x, evil_y, "Instances", oNPCs);

with (evil_npc) {
    sprite_index = sEvil;  // Use Evil sprite
    is_evil = true;        // Mark as Evil
    
    // Movement for Evil
    walk_direction = choose(-1, 1);
    image_xscale = walk_direction;
    walk_speed = 1 + random(2);
}

// Now spawn regular NPCs (8-15)
var num_npcs = irandom_range(8, 15);

for (var i = 0; i < num_npcs; i++) {
    var spawn_x = random(320 - 40) + 20;
    var spawn_y = 100;
    
    var new_npc = instance_create_layer(spawn_x, spawn_y, "Instances", oNPCs);
    
    with (new_npc) {
        // Regular NPCs use Player1 or Player2 sprites
        if (random(100) < 50) {
            sprite_index = sPlayer1;
        } else {
            sprite_index = sPlayer2;
        }
        
        // Mark as not evil
        is_evil = false;
        
        // Random movement
        walk_direction = choose(-1, 1);
        image_xscale = walk_direction;
        walk_speed = 1 + random(2);
    }
}

// Show spawn info
show_debug_message("--- SPAWN COMPLETE ---");
show_debug_message("Evil: 1");
show_debug_message("Regular NPCs: " + string(num_npcs));
show_debug_message("----------------------");