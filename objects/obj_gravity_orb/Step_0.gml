// Step Event - pulse animation
pulse++;
if (pulse > 360) pulse = 0;
image_yscale = 1 + sin(degtorad(pulse * 4)) * 0.1;
image_xscale = 1 + sin(degtorad(pulse * 4)) * 0.1;