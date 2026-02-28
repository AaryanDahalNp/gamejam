// delete block when player is within 32px
if (abs(obj_player.x - x) < 32) {
    with (obj_hidden_block) {
        visible = true;
    }
    instance_destroy();
}