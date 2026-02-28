// Step Event
if (place_meeting(x, y, obj_player)) {
    show_win = true;
    obj_player.hsp = 0;
    obj_player.vsp = 0;
    obj_player.grv = 0; // freeze player
}

// move button away when hovered
if (show_win) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
    if (mx > button_x - button_w/2 && mx < button_x + button_w/2 &&
        my > button_y - button_h/2 && my < button_y + button_h/2) {
        // mouse is hovering — teleport button to random position
        button_x = irandom_range(100, 860);
        button_y = irandom_range(100, 480);
    }
    
    // click button
    if (mouse_check_button_pressed(mb_left)) {
        if (mx > button_x - button_w/2 && mx < button_x + button_w/2 &&
            my > button_y - button_h/2 && my < button_y + button_h/2) {
            // restart game
            global.death_count = 0;
            room_goto(Room1);
        }
    }
}