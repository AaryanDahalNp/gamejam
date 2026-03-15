// Draw GUI Event
if (show_win) {

	draw_clear_alpha(c_black, 0);
    // dark overlay
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, 960, 540, false);
    draw_set_alpha(1);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // big title text
    draw_set_font(Font1);
    draw_set_color(c_yellow);
    draw_text(480, 180, "Well done on completing");
    draw_text(480, 240, "the tutorial!");

    // small text messages
    draw_set_font(Font2);

    if (global.death_count == 0) {
        draw_set_color(c_lime);
        draw_text(480, 300, "0 deaths?! Your aura gonna increase for sure.");
    }
    else if (global.death_count <= 5) {
        draw_set_color(c_aqua);
        draw_text(480, 300, "You did it in less than 5 deaths!");
    }
    else {
        draw_set_color(c_red);
        draw_text(480, 300, "noob! you have died " + string(global.death_count) + " times");
    }

    // play again button
    draw_set_color(c_green);
    draw_rectangle(round(button_x - button_w/2), round(button_y - button_h/2),
                   round(button_x + button_w/2), round(button_y + button_h/2), false);

    draw_set_color(c_black);
    draw_text(round(button_x), round(button_y), "PLAY AGAIN, if u can!!");
}