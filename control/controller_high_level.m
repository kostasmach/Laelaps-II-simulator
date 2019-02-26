
function [tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, tauFL2, tauHL1, ...
    tauHL2, tauT, xdesFR, ydesFR, xdesFL, ydesFL, xdesHR, ydesHR, ...
    xdesHL, ydesHL] = controller_high_level(t,...
    xb, xbdot, yb, ybdot, thb, thbdot, thFR1, thFR1dot, thFR2, thFR2dot,...
    thFR3, thFR3dot, thHR1, thHR1dot, thHR2, thHR2dot, thHR3, thHR3dot,...
    thFL1, thFL1dot, thFL2, thFL2dot, thFL3, thFL3dot, thHL1, thHL1dot,...
    thHL2, thHL2dot, thHL3, thHL3dot, thT, thTdot)


global dF1 dF2 dF3 dH1 dH2 dH3


if t < 1

%-------------------------------------------------------------------------%
% Position Legs at initial positions
%-------------------------------------------------------------------------%
% Fore Right Leg
xdesFR = 0.0;
ydesFR = -0.55;
% Fore Left Leg
xdesFL = 0.0;
ydesFL = -0.55;
% Hind Right Leg
xdesHR = -0.0;
ydesHR = -0.55;
% Hind Left Leg
xdesHL = -0.0;
ydesHL = -0.55;


[tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, tauFL2, tauHL1, tauHL2, tauT,...
    xdesFR, ydesFR, xdesFL, ydesFL, xdesHR, ydesHR, xdesHL, ydesHL] = ...
    controller_toe_pos(...
    xdesFR, ydesFR, xdesFL, ydesFL, xdesHR, ydesHR, xdesHL, ydesHL, ...
    xb, xbdot, yb, ybdot, thb, thbdot, thFR1, thFR1dot, thFR2, thFR2dot,...
    thFR3, thFR3dot, thHR1, thHR1dot, thHR2, thHR2dot, thHR3, thHR3dot,...
    thFL1, thFL1dot, thFL2, thFL2dot, thFL3, thFL3dot, thHL1, thHL1dot,...
    thHL2, thHL2dot, thHL3, thHL3dot, thT, thTdot);


elseif t < 3.4
 % Give ellipse parameters
 % Trajectory parameters for fore legs
 y_ellipse_cntr_F = - 0.8* (2*dF1 + 2* dF2 + 2* dF3);
 x_ellipse_cntr_F = 0;
 % Ellipse geometry
 a_ellipse_F = 0.00;
 b_ellipse_F = 0.15;
 % frequency
 traj_vel_F = -3;
 
% Flight duration for fore legs
T_flight_F = 0.3;
% Stance duration for fore legs
T_stance_F = 0.4;
 
 % Trajectory parameters for hind legs
 y_ellipse_cntr_H = - 0.8* (2*dH1 + 2* dH2 + 2* dH3);
 x_ellipse_cntr_H = 0;
 % Ellipse geometry
 a_ellipse_H = 0.00;
 b_ellipse_H = 0.15;
 % frequency
 traj_vel_H = -3;
 
% Flight duration for hind legs
T_flight_H = 0.3;
% Stance duration for hind legs
T_stance_H = 0.4;
 
 % Control Gains
 kp = 250;
 kv = 50;
 
 % Legs' phase
 phaseFR = 2*pi/2;
 phaseFL = 0;
 phaseHR = 0;
 phaseHL = 2*pi/2;
 
 [tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, tauFL2, tauHL1, ...
     tauHL2, tauT, xdesFR, ydesFR, xdesFL, ydesFL, xdesHR, ydesHR, ...
     xdesHL, ydesHL] = controller_toe_traj_3(t, ...
     x_ellipse_cntr_F, y_ellipse_cntr_F, a_ellipse_F, b_ellipse_F, ...
     traj_vel_F, x_ellipse_cntr_H, y_ellipse_cntr_H, a_ellipse_H, ...
     b_ellipse_H, traj_vel_H, phaseFR, phaseFL, phaseHR, phaseHL, kp, kv,...
     xb, xbdot, yb, ybdot, thb, thbdot, thFR1, thFR1dot, thFR2, thFR2dot,...
     thFR3, thFR3dot, thHR1, thHR1dot, thHR2, thHR2dot, thHR3, thHR3dot,...
     thFL1, thFL1dot, thFL2, thFL2dot, thFL3, thFL3dot, thHL1, thHL1dot,...
     thHL2, thHL2dot, thHL3, thHL3dot, thT, thTdot, T_flight_F, ...
     T_stance_F, T_flight_H, T_stance_H);
 

elseif t < 8.1
 % Give ellipse parameters
 % Trajectory parameters for fore legs
 y_ellipse_cntr_F = - 0.8* (2*dF1 + 2* dF2 + 2* dF3);
 x_ellipse_cntr_F = 0;
 % Ellipse geometry
 a_ellipse_F = 0.10;
 b_ellipse_F = 0.15;
 % frequency
 traj_vel_F = -3;
 
% Flight duration for fore legs
T_flight_F = 0.3;
% Stance duration for fore legs
T_stance_F = 0.4;
 
 % Trajectory parameters for hind legs
 y_ellipse_cntr_H = - 0.8* (2*dH1 + 2* dH2 + 2* dH3);
 x_ellipse_cntr_H = 0;
 % Ellipse geometry
 a_ellipse_H = 0.10;
 b_ellipse_H = 0.15;
 % frequency
 traj_vel_H = -3;
 
% Flight duration for hind legs
T_flight_H = 0.3;
% Stance duration for hind legs
T_stance_H = 0.4;
 
 % Control Gains
 kp = 250;
 kv = 50;
 
 % Legs' phase
 phaseFR = 2*pi/2;
 phaseFL = 0;
 phaseHR = 0;
 phaseHL = 2*pi/2;
 
 [tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, tauFL2, tauHL1, ...
     tauHL2, tauT, xdesFR, ydesFR, xdesFL, ydesFL, xdesHR, ydesHR, ...
     xdesHL, ydesHL] = controller_toe_traj_2(t, ...
     x_ellipse_cntr_F, y_ellipse_cntr_F, a_ellipse_F, b_ellipse_F, ...
     traj_vel_F, x_ellipse_cntr_H, y_ellipse_cntr_H, a_ellipse_H, ...
     b_ellipse_H, traj_vel_H, phaseFR, phaseFL, phaseHR, phaseHL, kp, kv,...
     xb, xbdot, yb, ybdot, thb, thbdot, thFR1, thFR1dot, thFR2, thFR2dot,...
     thFR3, thFR3dot, thHR1, thHR1dot, thHR2, thHR2dot, thHR3, thHR3dot,...
     thFL1, thFL1dot, thFL2, thFL2dot, thFL3, thFL3dot, thHL1, thHL1dot,...
     thHL2, thHL2dot, thHL3, thHL3dot, thT, thTdot, T_flight_F, ...
     T_stance_F, T_flight_H, T_stance_H);


elseif t < 13
 % Give ellipse parameters
 % Trajectory parameters for fore legs
 y_ellipse_cntr_F = - 0.8* (2*dF1 + 2* dF2 + 2* dF3);
 x_ellipse_cntr_F = 0;
 % Ellipse geometry
 a_ellipse_F = 0.10;
 b_ellipse_F = 0.15;
 % frequency
 traj_vel_F = -3;
 
% Flight duration for fore legs
T_flight_F = 0.3;
% Stance duration for fore legs
T_stance_F = 0.4;
 
 % Trajectory parameters for hind legs
 y_ellipse_cntr_H = - 0.8* (2*dH1 + 2* dH2 + 2* dH3);
 x_ellipse_cntr_H = 0;
 % Ellipse geometry
 a_ellipse_H = 0.10;
 b_ellipse_H = 0.15;
 % frequency
 traj_vel_H = -3;
 
% Flight duration for hind legs
T_flight_H = 0.3;
% Stance duration for hind legs
T_stance_H = 0.4;
 
 % Control Gains
 kp = 250;
 kv = 50;
 
 % Legs' phase
 phaseFR = 2*pi/2;
 phaseFL = 0;
 phaseHR = 0;
 phaseHL = 2*pi/2;
 
 [tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, tauFL2, tauHL1, ...
     tauHL2, tauT, xdesFR, ydesFR, xdesFL, ydesFL, xdesHR, ydesHR, ...
     xdesHL, ydesHL] = controller_toe_traj_3(t, ...
     x_ellipse_cntr_F, y_ellipse_cntr_F, a_ellipse_F, b_ellipse_F, ...
     traj_vel_F, x_ellipse_cntr_H, y_ellipse_cntr_H, a_ellipse_H, ...
     b_ellipse_H, traj_vel_H, phaseFR, phaseFL, phaseHR, phaseHL, kp, kv,...
     xb, xbdot, yb, ybdot, thb, thbdot, thFR1, thFR1dot, thFR2, thFR2dot,...
     thFR3, thFR3dot, thHR1, thHR1dot, thHR2, thHR2dot, thHR3, thHR3dot,...
     thFL1, thFL1dot, thFL2, thFL2dot, thFL3, thFL3dot, thHL1, thHL1dot,...
     thHL2, thHL2dot, thHL3, thHL3dot, thT, thTdot, T_flight_F, ...
     T_stance_F, T_flight_H, T_stance_H);


elseif t < 16
% Call various controllers

%% Call the controller for toe ellipses (Trotting)
%-------------------------------------------------------------------------%
% Give ellipse parameters
% Trajectory parameters for fore legs
y_ellipse_cntr_F = - 0.8* (2*dF1 + 2* dF2 + 2* dF3);
x_ellipse_cntr_F = 0;
% Ellipse geometry
a_ellipse_F = 0.10;
b_ellipse_F = 0.05;
% frequency
traj_vel_F = -3;

% Trajectory parameters for hind legs
y_ellipse_cntr_H = - 0.8* (2*dH1 + 2* dH2 + 2* dH3);
x_ellipse_cntr_H = 0;
% Ellipse geometry
a_ellipse_H = 0.10;
b_ellipse_H = 0.05;
% frequency
traj_vel_H = -3; 

% Control Gains
kp = 250;
kv = 50;
    
% Legs' phase
phaseFR = 2*pi/2;
phaseFL = 0;
phaseHR = 0;
phaseHL = 2*pi/2;


[tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, tauFL2, tauHL1, tauHL2, tauT,...
    xdesFR, ydesFR, xdesFL, ydesFL, xdesHR, ydesHR, xdesHL, ydesHL] =...
    controller_toe_traj(t, ...
    x_ellipse_cntr_F, y_ellipse_cntr_F, a_ellipse_F, b_ellipse_F, ...
    traj_vel_F, x_ellipse_cntr_H, y_ellipse_cntr_H, a_ellipse_H, ...
    b_ellipse_H, traj_vel_H, phaseFR, phaseFL, phaseHR, phaseHL, kp, kv,...
    xb, xbdot, yb, ybdot, thb, thbdot, thFR1, thFR1dot, thFR2, thFR2dot,...
    thFR3, thFR3dot, thHR1, thHR1dot, thHR2, thHR2dot, thHR3, thHR3dot,...
    thFL1, thFL1dot, thFL2, thFL2dot, thFL3, thFL3dot, thHL1, thHL1dot,...
    thHL2, thHL2dot, thHL3, thHL3dot, thT, thTdot);


elseif t < 20
% Call various controllers

%% Call the controller for toe ellipses (Trotting 1.5 m/s)
%-------------------------------------------------------------------------%
% Give ellipse parameters
% Trajectory parameters for fore legs
y_ellipse_cntr_F = - 0.7* (2*dF1 + 2* dF2 + 2* dF3);
x_ellipse_cntr_F = -0.1;
% Ellipse geometry
a_ellipse_F = 0.20;
b_ellipse_F = 0.07;
% frequency
traj_vel_F = -22;

% Trajectory parameters for hind legs
y_ellipse_cntr_H = - 0.7* (2*dH1 + 2* dH2 + 2* dH3);
x_ellipse_cntr_H = -0.1;
% Ellipse geometry
a_ellipse_H = 0.20;
b_ellipse_H = 0.07;
% frequency
traj_vel_H = -22; 

% Control Gains
kp = 450;
kv = 50;
    
% Legs' phase
phaseFR = 2*pi/2;
phaseFL = 0;
phaseHR = 0;
phaseHL = 2*pi/2;


[tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, tauFL2, tauHL1, tauHL2, tauT,...
    xdesFR, ydesFR, xdesFL, ydesFL, xdesHR, ydesHR, xdesHL, ydesHL] =...
    controller_toe_traj(t, ...
    x_ellipse_cntr_F, y_ellipse_cntr_F, a_ellipse_F, b_ellipse_F, ...
    traj_vel_F, x_ellipse_cntr_H, y_ellipse_cntr_H, a_ellipse_H, ...
    b_ellipse_H, traj_vel_H, phaseFR, phaseFL, phaseHR, phaseHL, kp, kv,...
    xb, xbdot, yb, ybdot, thb, thbdot, thFR1, thFR1dot, thFR2, thFR2dot,...
    thFR3, thFR3dot, thHR1, thHR1dot, thHR2, thHR2dot, thHR3, thHR3dot,...
    thFL1, thFL1dot, thFL2, thFL2dot, thFL3, thFL3dot, thHL1, thHL1dot,...
    thHL2, thHL2dot, thHL3, thHL3dot, thT, thTdot);



end


%-------------------------------------------------------------------------%
% Enable Actuators Limits - Uncomment to enable
%-------------------------------------------------------------------------%
[tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, ... 
        tauFL2, tauHL1, tauHL2, tauT] = motor_limits_enable...
        (tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, ... 
        tauFL2, tauHL1, tauHL2, tauT);


end