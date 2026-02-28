// Step Event

// activate when player x is within 20px of spike x
if (!activated) {
    if (abs(x - obj_player.x) < 128) {
        activated = true;
    }
}

// once activated fall down
if (activated) {
    vsp += grv;
    if (vsp > 20) vsp = 20;
    y += vsp;
}

// kill player on collision
if (place_meeting(x, y, obj_player)) {
    global.death_count++;
    room_restart();
}

// destroy if falls off screen
if (y > room_height + 100) {
    instance_destroy();
}