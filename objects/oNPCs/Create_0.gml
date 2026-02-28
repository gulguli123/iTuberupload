/// @description Initialize NPC
// Movement variables (set by spawner, but have defaults)
walk_speed = 1;
walk_direction = 1;
image_xscale = walk_direction;
direction_change_timer = 0;
direction_change_delay = 30 + random(90);
bounce_at_edges = true;

// NEW: Identify if this is Evil or regular
is_evil = false;  // Default to regular NPC