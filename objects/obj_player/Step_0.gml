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
if (vsp > 20) vsp = 20;
if (vsp < -20) vsp = -20;

// Check ground
if (gravity_flipped) {
    on_ground = place_meeting(x, y - 1, obj_solid);
} else {
    on_ground = place_meeting(x, y + 1, obj_solid);
}

// Jump
if (on_ground && jump) {
    vsp = jumpforce;
}

// Horizontal collision — pixel perfect, no passing through walls
if (hsp != 0) {
    if (place_meeting(x + hsp, y, obj_solid)) {
        var hstep = sign(hsp);
        while (!place_meeting(x + hstep, y, obj_solid)) {
            x += hstep;
        }
        hsp = 0;
    }
}
x += hsp;

// Vertical collision — pixel perfect, no passing through floors
if (vsp != 0) {
    if (place_meeting(x, y + vsp, obj_solid)) {
        var vstep = sign(vsp);
        while (!place_meeting(x, y + vstep, obj_solid)) {
            y += vstep;
        }
        vsp = 0;
    }
}
y += vsp;

// Spike death
if (place_meeting(x, y, obj_spike)) {
    global.death_count++;
    room_restart();
}

// Falling spike death
if (place_meeting(x, y, obj_falling_spikes)) {
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

// Fell off top
if (y < -100) {
    global.death_count++;
    gravity_flipped = false;
    grv = 0.8;
    jumpforce = -14;
    gravity_timer = 0;
    room_restart();
}