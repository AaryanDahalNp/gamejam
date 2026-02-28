hsp = 0;
vsp = 0;
grv = 0.8;
walkspeed = 5;
jumpforce = -14;
on_ground = false;

gravity_flipped = false;


if (!variable_global_exists("death_count")) {
    global.death_count = 0;
}
if (!variable_global_exists("floor_num")) {
    global.floor_num = 1;
}
