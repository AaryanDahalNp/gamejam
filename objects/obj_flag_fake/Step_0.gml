// Check collision with player
if (place_meeting(x, y, obj_player)) {
    show_fake_text = true;
}

if (place_meeting(obj_player.x, obj_player.y, obj_flag)) {
        show_fake_text = false;
}
