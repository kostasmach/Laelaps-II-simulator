function [x_hip, y_hip, x_m1, y_m1, x_knee, y_knee, x_m2, y_m2, ...
    x_ankle, y_ankle, x_m3, y_m3, x_foot, y_foot, x_F, y_F, x_G, y_G, ...
    x_H, y_H, x_E, y_E, x_D, y_D] = ...
    state_to_leg_coords(th1, th2, th3, xb, yb, thb, leg_id)

global d1 d2 d3 l1 l2 l3
global BF FG IH BE 
global HIC_angle EBI_angle
global db lb

%-------------------------------------------------------------------------%
% Leg coordinates
%-------------------------------------------------------------------------%
% Hip - check if it is a fore (leg_id=1) or a hind leg (leg_id=2)
if leg_id == 1
    x_hip = xb + db.*cos(thb);
    y_hip = yb + db.*sin(thb);
elseif leg_id == 2
    x_hip = xb - (lb-db).*cos(thb);
    y_hip = yb - (lb-db).*sin(thb);
end
% m1 CoM
x_m1 = x_hip + d1.*sin(th1);
y_m1 = y_hip - d1.*cos(th1);
% Knee 
x_knee = x_hip + l1.*sin(th1);
y_knee = y_hip - l1.*cos(th1);
% m2 CoM
x_m2 = x_hip + l1.*sin(th1) + d2.*sin(th2);
y_m2 = y_hip - l1*cos(th1) - d2.*cos(th2);
% Ankle
x_ankle = x_hip + l1.*sin(th1) + l2.*sin(th2);
y_ankle = y_hip - l1*cos(th1) - l2.*cos(th2);
% m3 CoM
x_m3 = x_hip + l1.*sin(th1) + l2.*sin(th2) + d3.*sin(th3);
y_m3 = y_hip - l1*cos(th1) - l2.*cos(th2) - d3.*cos(th3);
% Foot
x_foot = x_hip + l1.*sin(th1)+l2.*sin(th2)+l3.*sin(th3);
y_foot = y_hip + (-1).*l1.*cos(th1)+(-1).*l2.*cos(th2)+(-1).*l3.*cos(th3);
% F point
x_F = x_knee + BF*sin(th2);
y_F = y_knee - BF*cos(th2);
% G point
x_G = x_F + FG*sin(th2-pi/2);
y_G = y_F - FG*cos(th2-pi/2);
% H point
x_H = x_ankle + IH*sin(th3+HIC_angle);
y_H = y_ankle - IH*cos(th3+HIC_angle);
% E point
x_E = x_knee + BE*sin(th2+EBI_angle);
y_E = y_knee - BE*cos(th2+EBI_angle);
% D point
x_D = x_hip + BE*sin(th2+EBI_angle);
y_D = y_hip - BE*cos(th2+EBI_angle);