var move_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var move_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var jump = keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"));
// Gravity flip timer countdown
if (gravity_timer > 0) {
    gravity_timer--;
    if (gravity_timer <= 0) {
        gravity_flipped = false;
        grv = 0.8;
        jumpforce = -14;
    }
}
// Gravity orb collision
if (place_meeting(x, y, obj_gravity_orb)) {
    with (obj_gravity_orb) {
        instance_destroy();
    }
    gravity_flipped = !gravity_flipped;
    if (gravity_flipped) {
        grv = -0.8;
        jumpforce = 14;
        gravity_timer = 10 * 60;
    } else {
        grv = 0.8;
        jumpforce = -14;
        gravity_timer = 0;
    }
}
// Horizontal movement
hsp = (move_right - move_left) * walkspeed;
// Gravity
vsp += grv;
// Terminal velocity — works both directions
if (vsp > 20) vsp = 20;
if (vsp < -20) vsp = -20;

// Check ground depending on gravity direction
if (gravity_flipped) {
    on_ground = place_meeting(x, y - 1, obj_block);
} else {
    on_ground = place_meeting(x, y + 1, obj_block);
}

// Check ground depending on gravity direction
if (gravity_flipped) {
    on_ground = place_meeting(x, y - 1, obj_undg_block);
} else {
    on_ground = place_meeting(x, y + 1, obj_undg_block);
}

// Jump
if (on_ground && jump) {
    vsp = jumpforce;
}

// Horizontal collision
if (place_meeting(x + hsp, y, obj_block)) {
    while (!place_meeting(x + sign(hsp), y, obj_block)) {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;
// Vertical collision
if (place_meeting(x, y + vsp, obj_block)) {
    while (!place_meeting(x, y + sign(vsp), obj_block)) {
        y += sign(vsp);
    }
    vsp = 0;
}
// Horizontal collision
if (place_meeting(x + hsp, y, obj_undg_block)) {
    while (!place_meeting(x + sign(hsp), y, obj_undg_block)) {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;
// Vertical collision
if (place_meeting(x, y + vsp, obj_undg_block)) {
    while (!place_meeting(x, y + sign(vsp), obj_undg_block)) {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;




// Horizontal collision
if (place_meeting(x + hsp, y, obj_moving_trap)) {
    while (!place_meeting(x + sign(hsp), y, obj_moving_trap)) {
        x += sign(hsp);
    }
    hsp = 0;
}

// Vertical collision
if (place_meeting(x, y + vsp, obj_moving_trap)) {
    while (!place_meeting(x, y + sign(vsp), obj_moving_trap)) {
        y += sign(vsp);
    }
    vsp = 0;
}


// Spike death
if (place_meeting(x, y, obj_spike)) {
    global.death_count++;
    room_restart();
}
// Fell off bottom
if (y > room_height + 100) {
    global.death_count++;
    gravity_flipped = false;
    grv = 0.8;
    jumpforce = -14;
    gravity_timer = 0;
    room_restart();
}
// Fell off top (flipped gravity)
if (y < -100) {
    global.death_count++;
    gravity_flipped = false;
    grv = 0.8;
    jumpforce = -14;
    gravity_timer = 0;
    room_restart();
}

