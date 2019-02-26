%-------------------------------------------------------------------------%
% Simulation and animation of Laelaps II quadruped 
% Four 3-segment legs and tail
%
% Created by Konstantinos Machairas - 5/2018
%
% Dynamics derived with Mathematica 
% Mathematica file: "quadruped with four 3-link legs and a tail.nb" 
%
% Solve the Equations of Motion  
% Matrix form: M(x,x') * x' = F(x,x')
%
% x(1) = xb         % x(17) = thHR3         
% x(2) = xb'        % x(18) = thHR3'
% x(3) = yb         % x(19) = thFL1
% x(4) = yb'        % x(20) = thFL1'
% x(5) = thb        % x(21) = thFL2
% x(6) = thb'       % x(22) = thFL2'
% x(7) = thFR1      % x(23) = thFL3
% x(8) = thFR1'     % x(24) = thFL3'
% x(9) = thFR2      % x(25) = thHL1
% x(10) = thFR2'    % x(26) = thHL1'
% x(11) = thFR3     % x(27) = thHL2
% x(12) = thFR3'    % x(28) = thHL2'
% x(13) = thHR1     % x(29) = thHL3
% x(14) = thHR1'    % x(30) = thHL3'
% x(15) = thHR2     % x(31) = thT
% x(16) = thHR2'    % x(32) = thT'
%-------------------------------------------------------------------------%

clear global; clear all; clc; close all;

%-------------------------------------------------------------------------%
% Add the required folders to search path
%-------------------------------------------------------------------------%
addpath(genpath('dynamics'))
addpath(genpath('control'))
addpath(genpath('post_processing'))
addpath(genpath('animation'))
addpath(genpath('plots'))
addpath(genpath('gui'))

%-------------------------------------------------------------------------%
% Global variables
%-------------------------------------------------------------------------%
global mb Ib mF1 IF1 mF2 IF2 mF3 IF3 mH1 IH1 mH2 IH2 mH3 IH3 mT mTR ITR
global d1 d2 d3 l1 l2 l3
global db lb dbT dF1 dF2 dF3 dH1 dH2 dH3 dT dTR
global lF1 lF2 lF3 lH1 lH2 lH3
global BI BC IC BF FG IH BE 
global HIC_angle EBI_angle IBC_angle ICB_angle EBC_angle BIC_angle 
global hip_control_torque_sat knee_control_torque_sat
global k_ground b_ground g
global mu_d mu_s slip_error friction_velocity
global x_loc gr_height
global i2 tfinal
global ankle_stop_angle_1 ankle_stop_angle_2 k_ankle tau_preload phi3eq 
global k_stop b_stop
global progress_bar

%-------------------------------------------------------------------------%
% Simulation duration
%-------------------------------------------------------------------------%
tstart = 0;
tfinal = 80.0;

%-------------------------------------------------------------------------%
% Visualisation: Create simulation progress bar     
%-------------------------------------------------------------------------%
progress_bar = waitbar(0,'Starting Simulation');

%-------------------------------------------------------------------------%
% Gravity constant     
%-------------------------------------------------------------------------%
g = 9.81; 
% g = 0;

%-------------------------------------------------------------------------%
% Body parameters
%-------------------------------------------------------------------------%
mb = 40;    % Body mass
Ib = 1.3;   % Body inertia
db = 0.2;   % Distance from a fore hip joint to body's COM
lb = 0.6;   % Hip to hip distance

%-------------------------------------------------------------------------%
% Leg parameters
%-------------------------------------------------------------------------%
m1 = 0.3217;                        % Segment 1 mass
m2 = 0.5831;                        % Segment 2 mass
m3 = 0.1853;                        % Segment 3 mass
Iseg1 = 0.003;                      % MoI of segment 1
Irotor1 = 0.0000209;                % MoI of motor 1 rotor
tr1 = 43 * (48/26);                 % Transmission ratio of actuator 1
I1 = Iseg1 + Irotor1 * tr1 ^ 2;     % Total MoI for actuator 1
Iseg2 = 0.008;                      % MoI of segment 2
Irotor2 = 0.0000542;                % MoI of motor 2 rotor
tr2 = 53 * (48/26);                 % Transmission ratio of actuator 2
I2 = Iseg2 + Irotor2 * tr2 ^ 2;     % Total MoI for actuator 2
I3 = 0.001;                         % MoI of segment 2
d1 = 0.109;                         % Distance of CoM 1 from joint 1   
d2 = 100e-3;                        % Distance of CoM 2 from joint 2
d3 = 30e-3;                         % Distance of CoM 3 from joint 3                           
l1 = 250e-3;                        % Segment 1 length
l2 = 72.58e-3 + 247.42e-3;          % Segment 2 length
l3 = 102.74e-3;                     % Segment 3 length

%-------------------------------------------------------------------------%
% Real leg dimensions
%-------------------------------------------------------------------------%
BI = 72.58e-3 + 247.42e-3;
BC = 350e-3;
IC = 102.74e-3;
BF = 72.58e-3;
FG = 36.26e-3;
IH = 106e-3;
BE = 54.41e-3;
% Angles at ankle stop (uncompressed tendon spring)
HIC_angle = deg2rad(170.94);
EBI_angle = deg2rad(148.72);
IBC_angle = acos((BI^2+BC^2-IC^2)/(2*BI*BC));
ICB_angle = acos((IC^2+BC^2-BI^2)/(2*IC*BC));
EBC_angle = EBI_angle-IBC_angle;
BIC_angle = IBC_angle + ICB_angle;

%-------------------------------------------------------------------------%
% Actuator limits
%-------------------------------------------------------------------------%
hip_control_torque_sat = 83.077;
knee_control_torque_sat = 51.692;
hip_vel_sat = 55.5 * 0.104719755;
knee_vel_sat = 75.83 * 0.104719755;

%-------------------------------------------------------------------------%
% Fore leg (right and left)
%-------------------------------------------------------------------------%
mF1 = m1;   % link 1 mass
IF1 = I1;   % total MoI that motor 1 has to drive
dF1 = d1;   % distance from link's COM to link's joint 
mF2 = m2;   % link 2 mass
IF2 = I2;   % total MoI that motor 2 has to drive
dF2 = d2;   % distance from link's COM to link's joint
mF3 = m3;   % link 3 mass
IF3 = I3;   % link 3 moment of inertia
dF3 = d3;   % distance from link's COM to link's joint
lF1 = l1;   % Segment 1 length
lF2 = l2;   % Segment 2 length
lF3 = l3;   % Segment 3 length

%-------------------------------------------------------------------------%
% Hind leg (right and left)
%-------------------------------------------------------------------------%
mH1 = m1;   % link 1 mass
IH1 = I1;   % total MoI that motor 1 has to drive
dH1 = d1;   % distance from link's COM to link's joint 
mH2 = m2;   % link 2 mass
IH2 = I2;   % total MoI that motor 2 has to drive
dH2 = d2;   % distance from link's COM to link's joint
mH3 = m3;   % link 3 mass
IH3 = I3;   % link 3 moment of inertia
dH3 = d3;   % distance from link's COM to link's joint
lH1 = l1;   % Segment 1 length
lH2 = l2;   % Segment 2 length
lH3 = l3;   % Segment 3 length

%-------------------------------------------------------------------------%
% Tail
%-------------------------------------------------------------------------%
dbT = 0.1;  % distance from tail joint to body's COM
mT = 0.5;   % tail mass
dT = 0.2;   % tail length
mTR = 0.1;  % tail rod mass
ITR = 0.1;  % tail rod inertia
dTR = 0.1;  % distance from tail's joint to rod's COM

%-------------------------------------------------------------------------%
% Hunt - Crossley model for ground contact
%-------------------------------------------------------------------------%
k_ground = 400000;
% b_ground = 0.05*k_ground;
b_ground = 0.3*k_ground;

%-------------------------------------------------------------------------%
% Friction Model
%-------------------------------------------------------------------------%
mu_s = 0.9;
mu_d = 0.8;
slip_error = 0.001;            % velocity transition to stick
friction_velocity = 0.01;      % Stiction velocity

%-------------------------------------------------------------------------%
% Terain geometry
%-------------------------------------------------------------------------%
x_loc =     [0.3 0.4 0.5 1.3 1.4 1.5 1.6];
gr_height = [0.1 0.15 0.2 0.25 0.22 0.20 0.15];

%-------------------------------------------------------------------------%
% Compliance at ankles
%-------------------------------------------------------------------------%
k1 = 7.45*10^3;
Fpre1 = 123.6;
dlk_max1 = 0.0412;
%-------------------------------------------------------------------------%
k2 = 8.92*10^3;
Fpre2 = 123.6;
dlk_max2 = 0.0344;
%-------------------------------------------------------------------------%
k3 = 10.79*10^3;
Fpre3 = 123.6;
dlk_max3 = 0.0285;
%-------------------------------------------------------------------------%
k4 = 13.63*10^3;
Fpre4 = 123.6;
dlk_max4 = 0.0225;
%-------------------------------------------------------------------------%
k5 = 18.63*10^3;
Fpre5 = 123.6;
dlk_max5 = 0.0166;
%-------------------------------------------------------------------------%
k6 = 22.46*10^3;
Fpre6 = 123.6;
dlk_max6 = 0.0137;
%-------------------------------------------------------------------------%
k7 = 26.48*10^3;
Fpre7 = 123.6;
dlk_max7 = 0.0117;
%-------------------------------------------------------------------------%

% k_spring = k6;
% Fpre = Fpre6;
% 
% b_spring = 0.1;
% k_ankle_2 = k_spring * b_spring^2;
% tau_preload = b_spring * Fpre;
% 
% k_ankle_1 = 1500;
% % k_ankle_2 = 250;
% % tau_preload = 31;
% ankle_stop_angle = deg2rad(25);   

%-------------------------------------------------------------------------%
% Angles (relative) for the two mechanical stops at ankle joint
%-------------------------------------------------------------------------%
ankle_stop_angle_1 = BIC_angle;
ankle_stop_angle_2 = BIC_angle + deg2rad(25);

%-------------------------------------------------------------------------%
% Hunt Crossley parameters for mechanical stops (knee and ankle)
%-------------------------------------------------------------------------%
k_stop = 100000;
b_stop = 100000;

%-------------------------------------------------------------------------%
% Ankle spring parameters
%-------------------------------------------------------------------------%
% Spring characteristics (Misumi catalogue)
k_spring = 26.48*10^3;
Fpre = 123.6;
% k_spring = 7.45*10^2;
% Fpre = 23.6;

dlk_max1 = 0.0117;
% Conversion to virtual torsional spring parameters (ankle joint)
% See notes for this conversion (linearization)
k_ankle = k_spring * IH^2;
tau_preload = Fpre * IH;
% Equilibrium angle of the virtual torsional spring
phi3eq = ankle_stop_angle_1;

%-------------------------------------------------------------------------%
% Set initial conditions in terms of relative angles
%-------------------------------------------------------------------------%
xb_0 = 0;                                   % body
xbdot_0 = 0; 
yb_0 = 0.7;
ybdot_0 = 0;
thb_0 = deg2rad(0);
thbdot_0 = 0;
phiFR1_0 = deg2rad(10);                      % FR leg
phiFR1dot_0 = 0;
phiFR2_0 = deg2rad(-20);
phiFR2dot_0 = 0;
phiFR3_0 = deg2rad(80);
phiFR3dot_0 = 0;
phiHR1_0 = deg2rad(10);                      % HR leg
phiHR1dot_0 = 0;
phiHR2_0 = deg2rad(-20);
phiHR2dot_0 = 0;
phiHR3_0 = deg2rad(80);
phiHR3dot_0 = 0;
phiFL1_0 = deg2rad(10);                      % FL leg
phiFL1dot_0 = 0;
phiFL2_0 = deg2rad(-20);
phiFL2dot_0 = 0;
phiFL3_0 = deg2rad(80);
phiFL3dot_0 = 0;
phiHL1_0 = deg2rad(10);                      % HL leg
phiHL1dot_0 = 0;
phiHL2_0 = deg2rad(-20);
phiHL2dot_0 = 0;
phiHL3_0 = deg2rad(80);
phiHL3dot_0 = 0;
phiT_0 = deg2rad(-75);                      % Tail
phiTdot_0 = 0;

%-------------------------------------------------------------------------%
% Set initial conditions in terms of absolute angles
%-------------------------------------------------------------------------%
thFR1_0 = phiFR1_0 + thb_0;                 % FR leg
thFR1dot_0 = phiFR1dot_0 + thbdot_0;
thFR2_0 = phiFR2_0 + thb_0;
thFR2dot_0 = phiFR2dot_0 + thbdot_0;
thFR3_0 = phiFR3_0 + thFR2_0;
thFR3dot_0 = phiFR3dot_0 + thFR2dot_0;
thHR1_0 = phiHR1_0 + thb_0;                 % HR leg
thHR1dot_0 = phiHR1dot_0 + thbdot_0;
thHR2_0 = phiHR2_0 + thb_0;
thHR2dot_0 = phiHR2dot_0 + thbdot_0;
thHR3_0 = phiHR3_0 + thHR2_0;
thHR3dot_0 = phiHR3dot_0 + thHR2dot_0;
thFL1_0 = phiFL1_0 + thb_0;                 % FL leg
thFL1dot_0 = phiFL1dot_0 + thbdot_0;
thFL2_0 = phiFL2_0 + thb_0;
thFL2dot_0 = phiFL2dot_0 + thbdot_0;
thFL3_0 = phiFL3_0 + thFL2_0;
thFL3dot_0 = phiFL3dot_0 + thFL2dot_0;
thHL1_0 = phiHL1_0 + thb_0;                 % HL leg
thHL1dot_0 = phiHL1dot_0 + thbdot_0;
thHL2_0 = phiHL2_0 + thb_0;
thHL2dot_0 = phiHL2dot_0 + thbdot_0;
thHL3_0 = phiHL3_0 + thHL2_0;
thHL3dot_0 = phiHL3dot_0 + thHL2dot_0;
thT_0 = phiT_0 + thb_0;                     % Tail
thTdot_0 = phiTdot_0 + thbdot_0;

%-------------------------------------------------------------------------%
% Initializations
%-------------------------------------------------------------------------%
i2 = 0; % counter used in dynamics function

%-------------------------------------------------------------------------%
% Vector of initial conditions
%-------------------------------------------------------------------------%
x0 = [xb_0, xbdot_0, yb_0, ybdot_0, thb_0, thbdot_0, thFR1_0, ... 
    thFR1dot_0, thFR2_0, thFR2dot_0, thFR3_0, thFR3dot_0, thHR1_0, ...
    thHR1dot_0, thHR2_0, thHR2dot_0, thHR3_0, thHR3dot_0, thFL1_0, ...
    thFL1dot_0, thFL2_0, thFL2dot_0, thFL3_0, thFL3dot_0, thHL1_0, ...
    thHL1dot_0, thHL2_0, thHL2dot_0, thHL3_0, thHL3dot_0, thT_0, thTdot_0];

%-------------------------------------------------------------------------%
% Options for ODE
%-------------------------------------------------------------------------%
%options = odeset('MaxStep',1e-3,'AbsTol',1e-4,'RelTol',1e-4,'Mass',@mass);
% options = odeset('AbsTol',1e-5,'RelTol',1e-5,'Mass',@mass);
options = odeset('AbsTol',1e-3,'RelTol',1e-3,'Mass',@mass);

%-------------------------------------------------------------------------%
% Set the time interval
%-------------------------------------------------------------------------%
tspan = [tstart tfinal]; % Set the time interval

%-------------------------------------------------------------------------%
% Solve the Equations of Motion  
% Matrix form: M(x,x') * x' = F(x,x')
%-------------------------------------------------------------------------%
[t,x] = ode15s(@dynamics,tspan,x0,options); % Solve ODE
%[t,x] = ode23t(@dynamics,tspan,x0,options); % Solve ODE

%-------------------------------------------------------------------------%
% Visualization: Close progress bar window
%-------------------------------------------------------------------------%
close(progress_bar)

%-------------------------------------------------------------------------%
% Visualisation: Create Post Processing progress bar     
%-------------------------------------------------------------------------%
progress_bar = waitbar(0,'Starting Post-Processing...');

%-------------------------------------------------------------------------%
% Post processing
%-------------------------------------------------------------------------%
disp('Simulation finished')
disp('Starting Post-Processing...')
pause(2)
post_processing

%-------------------------------------------------------------------------%
% Visualization: Close Post-Processing progress bar window
%-------------------------------------------------------------------------%
close(progress_bar)

%-------------------------------------------------------------------------%
% Animation
%-------------------------------------------------------------------------%
results_GUI
 
