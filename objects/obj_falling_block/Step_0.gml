// Step Event

// activate when player is within 32px
if (!activated) {
    if (abs(obj_player.x - x) < 32) {
        activated = true;
    }
}

// fall down when activated
if (activated) {
    vsp += grv;
    if (vsp > 20) vsp = 20;
    y += vsp;
}

// destroy when off screen — no respawn
if (y > room_height + 100) {
    instance_destroy();
}