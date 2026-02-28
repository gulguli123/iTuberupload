x_speed = 0; 

y_speed = 0; 

movement_speed = 1; 

grav = 0.5; // don't call this gravity! that's a built-in gamemaker variable used for something else


// Game state
game_active = true;
game_won = false;
game_lost = false;
lose_reason = "";

// Track what player is touching
touching_evil = false;
touching_regular = false;