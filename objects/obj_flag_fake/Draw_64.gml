if (show_fake_text) {

    // Align text to bottom-left
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    draw_set_font(Font2);  // use Font1 for all text

    // Position near bottom-left
    var base_x = 32; // distance from left edge
    var base_y = display_get_gui_height() -124; // distance from bottom

    // Draw all text in Font1
    draw_set_color(c_lime);
    draw_text(base_x, base_y, "BRO REALLY WENT FOR THE GREEN FLAG?");

    draw_set_color(c_white);
    draw_text(base_x+320, base_y+96, "THIS ONE IS FAKE. THE REAL FLAG IS RED.");

}