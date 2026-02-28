if (place_meeting(x, y, obj_player)) {
    // delete all fake floor blocks in one go
    with (obj_fake_floor) {
        instance_destroy();
    }
}
