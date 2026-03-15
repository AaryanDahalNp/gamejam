// Step Event

// activate when player x is within 30px
if (!activated) {
    if (abs(x - obj_player.x) < 40) {
        activated = true;
    }
}

// shoot up when activated
if (activated) {
    if (y > start_y - (32*5)) {
        // still moving up
        y -= up_speed;
	}
}

// kill player on collision
if (place_meeting(x, y, obj_player)) {
	with (obj_controller) {
        audio_play_sound(fah, 1, false);
    }

    global.death_count++;
    room_restart();
}