var move_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var move_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var jump = keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"));

// Horizontal movement
hsp = (move_right - move_left) * walkspeed;

// Gravity
vsp += grv;
if (vsp > 20) vsp = 20; // terminal velocity

// Check ground
on_ground = place_meeting(x, y + 1, obj_block);

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
y += vsp;

// Spike death
if (place_meeting(x, y, obj_player)) {
    global.death_count++;
    room_restart();
}

// Fell off screen
if (y > room_height + 100) {
    global.death_count++;
    room_restart();
}

if (place_meeting(x, y, obj_spike)) {
	global.death_count++;
    room_restart();
}