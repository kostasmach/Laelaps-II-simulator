function [knee_cntrl_torque, hip_cntrl_torque] = ...
    PIV_controller(th_knee_rad, th_knee_des_rad, lk_knee, th_hip_rad, ...
    th_hip_des_rad, lk_hip)
%PIV_controller function for simulations
%   This functions implements the PIV controller used in
%Laelaps experiments

global d2_knee d3_knee i10_knee i14_knee
global d2_hip d3_hip i10_hip i14_hip
global c1 c2
global Umax_knee Umin_knee Umax_hip Umin_hip
global hip_control_torque_sat knee_control_torque_sat

% Knee Control Gains
Kr_knee = 1;
Kp_knee = 40;
Kd_knee = 0.01;
Ki_knee = 0;

% Hip Control Gains
Kr_hip = 1;
Kp_hip = 40;
Kd_hip = 0.01;
Ki_hip = 0;

% Normalized Values to match with real Controller
th_knee_des = th_knee_des_rad/(2*pi);
th_knee = th_knee_rad/(2*pi);
th_hip_des = th_hip_des_rad/(2*pi);
th_hip = th_hip_rad/(2*pi);

% PIV Controller for Knee
v5_knee = Kr_knee * th_knee_des - th_knee;
v8_knee = Ki_knee * Kp_knee * i14_knee * (th_knee_des - th_knee) + i10_knee;
i10_knee = v8_knee;
v1_knee = Kd_knee * c1 * th_knee;
v4_knee = v1_knee - d2_knee - d3_knee;
d2_knee = v1_knee;
d3_knee = v4_knee * c2;
v9_knee = Kp_knee * (v5_knee - v4_knee) + v8_knee;
if (v9_knee > Umax_knee)
    v10_knee = Umax_knee;
elseif (v9_knee < Umin_knee)
    v10_knee = Umin_knee;
else
    v10_knee = v9_knee;
end
if (v10_knee == v9_knee)
    v12_knee = 1;
else
    v12_knee = 0;
end
i14_knee = v12_knee * lk_knee;
knee_cntrl_torque = v10_knee * knee_control_torque_sat;

% PIV Controller for Hip
v5_hip = Kr_hip * th_hip_des - th_hip;
v8_hip = Ki_hip * Kp_hip * i14_hip * (th_hip_des - th_hip) + i10_hip;
i10_hip = v8_hip;
v1_hip = Kd_hip * c1 * th_hip;
v4_hip = v1_hip - d2_hip - d3_hip;
d2_hip = v1_hip;
d3_hip = v4_hip * c2;
v9_hip = Kp_hip * (v5_hip - v4_hip) + v8_hip;
if (v9_hip > Umax_hip)
    v10_hip = Umax_hip;
elseif (v9_hip < Umin_hip)
    v10_hip = Umin_hip;
else
    v10_hip = v9_hip;
end
if (v10_hip == v9_hip)
    v12_hip = 1;
else
    v12_hip = 0;
end
i14_hip = v12_hip * lk_hip;
hip_cntrl_torque = v10_hip * hip_control_torque_sat;
end

