function [tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, tauFL2, tauHL1, ...
    tauHL2, tauT, xdesFR, ydesFR, xdesFL, ydesFL, xdesHR, ydesHR, ...
    xdesHL, ydesHL] = controller_toe_traj_2(t, ...
    x_ellipse_cntr_F, y_ellipse_cntr_F, a_ellipse_F, b_ellipse_F, ...
    traj_vel_F, x_ellipse_cntr_H, y_ellipse_cntr_H, a_ellipse_H, ...
    b_ellipse_H, traj_vel_H, phaseFR, phaseFL, phaseHR, phaseHL, kp, kv,...
    xb, xbdot, yb, ybdot, thb, thbdot, thFR1, thFR1dot, thFR2, thFR2dot,...
    thFR3, thFR3dot, thHR1, thHR1dot, thHR2, thHR2dot, thHR3, thHR3dot,...
    thFL1, thFL1dot, thFL2, thFL2dot, thFL3, thFL3dot, thHL1, thHL1dot,...
    thHL2, thHL2dot, thHL3, thHL3dot, thT, thTdot, T_flight_F, ...
    T_stance_F, T_flight_H, T_stance_H)


% global xb xbdot yb ybdot thb thbdot thFR1 thFR1dot thFR2 thFR2dot thFR3 ... 
%     thFR3dot thHR1 thHR1dot thHR2 thHR2dot thHR3 thHR3dot thFL1 ...
%     thFL1dot thFL2 thFL2dot thFL3 thFL3dot thHL1 thHL1dot thHL2 ...
%     thHL2dot thHL3 thHL3dot thT thTdot
% global psiFR1_0 psiFR2_0 psiFR3_0 psiHR1_0 psiHR2_0 psiHR3_0 psiT_0
% global psiFL1_0 psiFL2_0 psiFL3_0 psiHL1_0 psiHL2_0 psiHL3_0
% global Ankle_coords_des_E
% global forward_vel_des
global lF23 lH23 PSI_F PSI_H
global xdes_FR ydes_FR xdes_HR ydes_HR xdes_FL ydes_FL xdes_HL ydes_HL
global dF1 dF2 dF3 dH1 dH2 dH3


% Total duration for fore legs
T_F = T_flight_F + T_stance_F;
% Total duration for hind legs
T_H = T_flight_H + T_stance_H;

% Delta t for leg trajectories
dtFR = 1*T_H/4;
dtHR = 4*T_H/4;
dtFL = 3*T_H/4;
dtHL = 2*T_H/4;

t_FR = mod(t+dtFR,T_F);
t_HR = mod(t+dtHR,T_H);
t_FL = mod(t+dtFL,T_F);
t_HL = mod(t+dtHL,T_H);

if t_FR < T_flight_F     
    xdesFR = x_ellipse_cntr_F + a_ellipse_F * cos(-pi * t_FR / T_flight_F + pi);
    ydesFR = y_ellipse_cntr_F + b_ellipse_F * sin(-pi * t_FR / T_flight_F + pi);
else    
    v_FR = (2 * a_ellipse_F / T_stance_F);
    xdesFR = x_ellipse_cntr_F + a_ellipse_F - (t_FR - T_flight_F) * v_FR;
    ydesFR = y_ellipse_cntr_F;    
end


if t_HR < T_flight_H      
    xdesHR = x_ellipse_cntr_H + a_ellipse_H * cos(-pi * t_HR / T_flight_H + pi);
    ydesHR = y_ellipse_cntr_H + b_ellipse_H * sin(-pi * t_HR / T_flight_H + pi);
else    
    v_HR = (2 * a_ellipse_H / T_stance_H);
    xdesHR = x_ellipse_cntr_H + a_ellipse_H - (t_HR - T_flight_H) * v_HR;
    ydesHR = y_ellipse_cntr_H;    
end


if t_FL < T_flight_F     
    xdesFL = x_ellipse_cntr_F + a_ellipse_F * cos(-pi * t_FL / T_flight_F + pi);
    ydesFL = y_ellipse_cntr_F + b_ellipse_F * sin(-pi * t_FL / T_flight_F + pi);
else    
    v_FL = (2 * a_ellipse_F / T_stance_F);
    xdesFL = x_ellipse_cntr_F + a_ellipse_F - (t_FL - T_flight_F) * v_FL;
    ydesFL = y_ellipse_cntr_F;    
end


if t_HL < T_flight_H      
    xdesHL = x_ellipse_cntr_H + a_ellipse_H * cos(-pi * t_HL / T_flight_H + pi);
    ydesHL = y_ellipse_cntr_H + b_ellipse_H * sin(-pi * t_HL / T_flight_H + pi);
else    
    v_HL = (2 * a_ellipse_H / T_stance_H);
    xdesHL = x_ellipse_cntr_H + a_ellipse_H - (t_HL - T_flight_H) * v_HL;
    ydesHL = y_ellipse_cntr_H;    
end


%-------------------------------------------------------------------------%
% Desired robot motion
%
% Move each ankle to a point or along a trajectory
% w.r.t. a frame fixed to the fore or the hind hip 
% but parallel to the ground 
%-------------------------------------------------------------------------%
% Move toes along elliptical trajectories
%-------------------------------------------------------------------------%
% % Fore Right Leg
% xdesFR = x_ellipse_cntr_F + a_ellipse_F * cos(traj_vel_F * t + phaseFR);
% ydesFR = y_ellipse_cntr_F + b_ellipse_F * sin(traj_vel_F * t + phaseFR);
% xdes_FR = [xdes_FR; xdesFR];
% ydes_FR = [ydes_FR; ydesFR];
% 
% % Fore Left Leg
% xdesFL = x_ellipse_cntr_F + a_ellipse_F * cos(traj_vel_F * t + phaseFL);
% ydesFL = y_ellipse_cntr_F + b_ellipse_F * sin(traj_vel_F * t + phaseFL);
% xdes_FL = [xdes_FL; xdesFL];
% ydes_FL = [ydes_FL; ydesFL];
% 
% % Hind Right Leg
% xdesHR = x_ellipse_cntr_H + a_ellipse_H * cos(traj_vel_H * t + phaseHR);
% ydesHR = y_ellipse_cntr_H + b_ellipse_H * sin(traj_vel_H * t + phaseHR);
% xdes_HR = [xdes_HR; xdesHR];
% ydes_HR = [ydes_HR; ydesHR];
% 
% % Hind Left Leg
% xdesHL = x_ellipse_cntr_H + a_ellipse_H * cos(traj_vel_H * t + phaseHL);
% ydesHL = y_ellipse_cntr_H + b_ellipse_H * sin(traj_vel_H * t + phaseHL);
% xdes_HL = [xdes_HL; xdesHL];
% ydes_HL = [ydes_HL; ydesHL];



%-------------------------------------------------------------------------%
% Inverse Kinematics 
% (connecting leg angles to leg's edge coords relative to Body Frame)
% Here, leg's edge is considered to be its ankle
%-------------------------------------------------------------------------%
% Fore Right Leg
l1_temp = 2 * dF1;
l2_temp = lF23;
c_invk = (ydesFR^2 + xdesFR^2 - l1_temp^2 - l2_temp^2)/(2*l1_temp*l2_temp);
s_invk =  - sqrt(1 - c_invk^2);
theta2_temp = atan2(s_invk, c_invk);
k1_invk = l1_temp + l2_temp * c_invk;
k2_invk = l2_temp * s_invk;
theta1_temp = atan2(ydesFR, xdesFR) - atan2(k2_invk, k1_invk);
psiFR1_des = pi/2 + theta1_temp - thb;
psiFR2_des = theta2_temp - PSI_F;

% Fore Left Leg
l1_temp = 2 * dF1;
l2_temp = lF23;
c_invk = (ydesFL^2 + xdesFL^2 - l1_temp^2 - l2_temp^2)/(2*l1_temp*l2_temp);
s_invk =  - sqrt(1 - c_invk^2);
theta2_temp = atan2(s_invk, c_invk);
k1_invk = l1_temp + l2_temp * c_invk;
k2_invk = l2_temp * s_invk;
theta1_temp = atan2(ydesFL, xdesFL) - atan2(k2_invk, k1_invk);
psiFL1_des = pi/2 + theta1_temp - thb;
psiFL2_des = theta2_temp - PSI_F;

% Hind Right Leg
l1_temp = 2 * dH1;
l2_temp = lH23;
c_invk = (ydesHR^2 + xdesHR^2 - l1_temp^2 - l2_temp^2)/(2*l1_temp*l2_temp);
s_invk =  - sqrt(1 - c_invk^2);
theta2_temp = atan2(s_invk, c_invk);
k1_invk = l1_temp + l2_temp * c_invk;
k2_invk = l2_temp * s_invk;
theta1_temp = atan2(ydesHR, xdesHR) - atan2(k2_invk, k1_invk);
psiHR1_des = pi/2 + theta1_temp - thb;
psiHR2_des = theta2_temp - PSI_H;

% Hind Left Leg
l1_temp = 2 * dH1;
l2_temp = lH23;
c_invk = (ydesHL^2 + xdesHL^2 - l1_temp^2 - l2_temp^2)/(2*l1_temp*l2_temp);
s_invk =  - sqrt(1 - c_invk^2);
theta2_temp = atan2(s_invk, c_invk);
k1_invk = l1_temp + l2_temp * c_invk;
k2_invk = l2_temp * s_invk;
theta1_temp = atan2(ydesHL, xdesHL) - atan2(k2_invk, k1_invk);
psiHL1_des = pi/2 + theta1_temp - thb;
psiHL2_des = theta2_temp - PSI_H;


%-------------------------------------------------------------------------%
% Torques at Joints
%-------------------------------------------------------------------------%
% Fore Right Leg
tauFR1 = -kp * (thFR1-thb - psiFR1_des) - kv * (thFR1dot-thbdot);
tauFR2 = -kp * (thFR2-thFR1 - psiFR2_des) - kv * (thFR2dot-thFR1dot);
%tauFR3 = -k_ankle_spring*(thFR3-thFR2-psiFR3_0);

% Hind Right Leg
tauHR1 = -kp * (thHR1-thb - psiHR1_des) - kv * (thHR1dot-thbdot);
tauHR2 = -kp * (thHR2-thHR1 - psiHR2_des) - kv * (thHR2dot-thHR1dot);
%tauHR3 = -k_ankle_spring*(thHR3-thHR2-psiHR3_0);

% Fore Left Leg
tauFL1 = -kp * (thFL1-thb - psiFL1_des) - kv * (thFL1dot-thbdot);
tauFL2 = -kp * (thFL2-thFL1 - psiFL2_des) - kv * (thFL2dot-thFL1dot);
%tauFL3 = -k_ankle_spring*(thFL3-thFL2-psiFL3_0);

% Hind Left Leg
tauHL1 = -kp * (thHL1-thb - psiHL1_des) - kv * (thHL1dot-thbdot);
tauHL2 = -kp * (thHL2-thHL1 - psiHL2_des) - kv * (thHL2dot-thHL1dot);
%tauHL3 = -k_ankle_spring*(thHL3-thHL2-psiHL3_0);


%-------------------------------------------------------------------------%
% Tail torque
%-------------------------------------------------------------------------%
% tauT = -1000*(thT-thb-psiT_0);
tauT = -1000*(thT-thb-deg2rad(-75));


%-------------------------------------------------------------------------%
% Gathering Data
%-------------------------------------------------------------------------%
% Ankle desired trajectory relative to hip  
% Ankle_coords_des = [xdesFR, ydesFR, xdesHR, ydesHR, xdesFL, ...
%     ydesFL, xdesHL, ydesHL];
% Ankle_coords_des_E = [Ankle_coords_des_E; Ankle_coords_des];


end