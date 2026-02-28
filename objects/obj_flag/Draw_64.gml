// Draw GUI Event
if (show_win) {
    // dark overlay
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, 960, 540, false);
    draw_set_alpha(1);
    
    // well done text
    draw_set_font(Font1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    draw_set_color(c_yellow);
    draw_set_font(Font2);
    draw_text_transformed(480, 180, "Well done on completing", 3, 3, 0);
    draw_text_transformed(480, 240, "the tutorial!", 3, 3, 0);
    
    // death counter text
    draw_set_color(c_red);
    draw_text_transformed(480, 310, "noob! you have died " + string(global.death_count) + " times", 1.5, 1.5, 0);
    
    // play again button
    draw_set_color(c_green);
    draw_rectangle(button_x - button_w/2, button_y - button_h/2,
                   button_x + button_w/2, button_y + button_h/2, false);
    draw_set_color(c_black);
    draw_text_transformed(button_x, button_y, "PLAY AGAIN!", 1.5, 1.5, 0);
}