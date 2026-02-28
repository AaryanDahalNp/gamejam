// Step Event

// activate when player jumps near left cliff
if (!activated) {
    if (obj_player.x < start_x && abs(obj_player.x - start_x) < 64) {
        if (obj_player.vsp < 0) { // player is jumping
            activated = true;
        }
    }
}

// slide left when activated
if (activated) {
    if (x > target_x) {
        x -= move_speed;
    }
}
