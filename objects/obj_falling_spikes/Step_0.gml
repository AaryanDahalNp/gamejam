// Step Event

// check if player is below this spike
if (!activated) {
    // activate when player walks within 100px horizontally below spike
    if (abs(x - obj_player.x) < 100 && obj_player.y > y) {
        activated = true;
    }
}

// once activated start falling
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