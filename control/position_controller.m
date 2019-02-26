function [hip_cntrl_torque, knee_cntrl_torque, xdes, ydes, phi1des, ...
    phi2des] = position_controller(phi1, phi1dot, phi2, phi2dot, xdes, ...
    ydes, kp, kd)

global BC l1 IBC_angle 

% Inverse Kinematics
c_invk = (ydes^2+xdes^2 - l1^2 - BC^2)/(2*l1*BC);
s_invk = sqrt(1-c_invk^2);
k1_invk = BC + l1 * c_invk;
k2_invk = l1 * s_invk;
phi2des = atan2(ydes,xdes) - atan2(k2_invk,k1_invk) + pi/2;
phi1des = phi2des + atan2(s_invk,c_invk);

% Convert the desired knee angle since the motor 
% must drive the virtual segment BC
phi2des = phi2des - IBC_angle;

% Controller
hip_cntrl_torque = kp*(phi1des - phi1) - kd*(phi1dot);
knee_cntrl_torque = kp*(phi2des - phi2) - kd*(phi2dot);