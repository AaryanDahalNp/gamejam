// Step Event

// move left and right
x += move_speed * direction_x;

// flip direction at limits
if (x <= left_limit) {
    x = left_limit;
    direction_x = 1; // switch to right
}
if (x >= right_limit) {
    x = right_limit;
    direction_x = -1; // switch to left
}

// carry player when standing on platform
if (place_meeting(x, y - 1, obj_player)) {
    obj_player.x += move_speed * direction_x;
}