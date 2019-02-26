%-------------------------------------------------------------------------%
% Global variables
%-------------------------------------------------------------------------%
clear global; clear all; clc;
global d2_knee d3_knee i10_knee i14_knee
global d2_hip d3_hip i10_hip i14_hip
global c1 c2
global hip_control_torque_sat knee_control_torque_sat
global Umax_knee Umin_knee Umax_hip Umin_hip

d2_knee = 0;
d3_knee = 0;
i10_knee = 0;
i14_knee = 0;
d2_hip = 0;
d3_hip = 0;
i10_hip = 0;
i14_hip = 0;
T=1/10000;
FilterBandwidth = 20;
ftc = 1/(2*pi*FilterBandwidth);
c1 = 2/(T+2*ftc);
c2 = (T-2*ftc)/(T+2*ftc);
hip_control_torque_sat = 83.077;
knee_control_torque_sat = 51.692;
Umax_knee=0.3825;
Umin_knee=-0.3825;
Umax_hip=0.4117;
Umin_hip=-0.4117;

[ knee_cntrl_torque, hip_cntrl_torque ] = PIV_controller( 0,pi/65,1,0,-pi/65,1 );
