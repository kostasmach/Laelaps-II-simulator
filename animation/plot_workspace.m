function plot_workspace(l1, BC)

    hold on
    xCenter = 0;
    yCenter = 0;
    theta_in = 1.05* pi : 0.01 : 1.95*pi;
    theta_out = 1.03* pi : 0.01 : 1.97*pi;
    radius_out = l1+BC;
    radius_in = 430.1163e-3;
    x_out = radius_out * cos(theta_out) + xCenter;
    y_out = radius_out * sin(theta_out) + yCenter;
    x_in = radius_in * cos(theta_in) + xCenter;
    y_in = radius_in * sin(theta_in) + yCenter;
    plot(x_in, y_in, 'color' , [0.9 0.9 0.9]);
    plot(x_out, y_out, 'color' , [0.9 0.9 0.9]);