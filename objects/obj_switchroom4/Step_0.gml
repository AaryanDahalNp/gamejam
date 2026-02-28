if (place_meeting(x, y, obj_player)) {
    // reset player first
    obj_player.hsp = 0;
    obj_player.vsp = 0;
    obj_player.gravity_flipped = false;
    obj_player.grv = 0.8;
    obj_player.jumpforce = -14;
    obj_player.gravity_timer = 0;
    
    // then switch room
    room_goto(Room4);
}