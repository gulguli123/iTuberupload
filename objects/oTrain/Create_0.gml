/// @description Initialize train
// Your EXISTING positioning code
x = -sprite_width;

// Your EXISTING movement variables
speed_current = 0;
speed_max = 6;
acceleration = 0.3;
deceleration = 0.2;

// 👆 KEEP ALL YOUR CODE ABOVE

// 👇 ADD THESE NEW LINES for the wrap timer
wrap_timer = 0;           // Timer for waiting period
wrap_delay = 30;          // Frames to wait (30 = half second at 60fps)