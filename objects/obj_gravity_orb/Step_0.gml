// pulse animation
pulse++;
image_xscale = 1 + sin(degtorad(pulse * 4)) * 0.15;
image_yscale = 1 + sin(degtorad(pulse * 4)) * 0.15;

// when player touches orb
if (place_meeting(x, y, obj_player)) {
    obj_player.gravity_flipped = !obj_player.gravity_flipped;
    
    if (obj_player.gravity_flipped) {
        obj_player.grv = -0.8;
        obj_player.jumpforce = 14;
    } else {
        obj_player.grv = 0.8;
        obj_player.jumpforce = -14;
    }
    
    instance_destroy();
}