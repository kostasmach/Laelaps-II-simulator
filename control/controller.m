function [hip_cntrl_torque, knee_cntrl_torque, xdes, ydes, phi1des, ...
    phi2des] = controller(phi1, phi1dot, phi2, phi2dot, t)

global hip_control_torque_sat knee_control_torque_sat

%-------------------------------------------------------------------------%
% Position Control
%-------------------------------------------------------------------------%
if t < 2

    % Desired position
    xdes = 0.0;
    ydes = -0.58;
    
    % Controller
    kp = 300;
    kd = 120;
    
    [hip_cntrl_torque, knee_cntrl_torque, xdes, ydes, phi1des, phi2des] ...
        = position_controller(phi1, phi1dot, phi2, phi2dot, ...
        xdes, ydes, kp, kd);

%-------------------------------------------------------------------------%
% Position Control 2
%-------------------------------------------------------------------------%
elseif t < 4
    
    % Desired position
    xdes = 0.0;
    ydes = -0.55;
    
    % Controller
    kp = 700;
    kd = 20;
    
    [hip_cntrl_torque, knee_cntrl_torque, xdes, ydes, phi1des, phi2des] ...
        = position_controller(phi1, phi1dot, phi2, phi2dot, ...
        xdes, ydes, kp, kd);
    
else
    
    % Trajectory parameters
    x_ell_cntr = 0;
    y_ell_cntr = -0.5;
    a_ell = 0.00;
    b_ell = 0.05;
    traj_vel = 3;

    % Gains
    kp = 1330;
    kd = 120;
    
    [hip_cntrl_torque, knee_cntrl_torque, xdes, ydes, phi1des, ...
    phi2des] = traj_controller(phi1, phi1dot, phi2, phi2dot, t ,...
    x_ell_cntr, y_ell_cntr, a_ell, b_ell, traj_vel, kp, kd);
    
end

%% Enable actuator saturation limits

% Hip torque (bounded)
if hip_cntrl_torque > hip_control_torque_sat
    hip_cntrl_torque = hip_control_torque_sat;
elseif hip_cntrl_torque < - hip_control_torque_sat
    hip_cntrl_torque = -hip_control_torque_sat;
end

% Knee torque (bounded)
if knee_cntrl_torque > knee_control_torque_sat
    knee_cntrl_torque = knee_control_torque_sat;
elseif knee_cntrl_torque < - knee_control_torque_sat
    knee_cntrl_torque = - knee_control_torque_sat;
end

