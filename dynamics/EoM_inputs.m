function [tauFR1, tauFR2, tauFR3, tauHR1, tauHR2, tauHR3,...
    tauFL1, tauFL2, tauFL3, tauHL1, tauHL2, tauHL3, tauT, ...
    tau_cntrl_FR1, tau_cntrl_FR2, tau_cntrl_HR1, tau_cntrl_HR2, ...
    tau_cntrl_FL1, tau_cntrl_FL2, tau_cntrl_HL1, tau_cntrl_HL2, ...
    xdesFR, ydesFR, xdesHR, ydesHR, xdesFL, ydesFL, xdesHL, ydesHL, ...   
    thFR1des, thFR2des, thHR1des, thHR2des, ...
    thFL1des, thFL2des, thHL1des, thHL2des, ...
    NFR, FFR, NHR, FHR, NFL, FFL, NHL, FHL, ...
    slipFR, slipHR, slipFL, slipHL] = ...
    EoM_inputs(...
    xb, xbdot, yb, ybdot, thb, thbdot, ...
    thFR1, thFR1dot, thFR2, thFR2dot, thFR3, thFR3dot, ...
    thHR1, thHR1dot, thHR2, thHR2dot, thHR3, thHR3dot, ...
    thFL1, thFL1dot, thFL2, thFL2dot, thFL3, thFL3dot, ...
    thHL1, thHL1dot, thHL2, thHL2dot, thHL3, thHL3dot, ...
    thT, thTdot, t)


%-------------------------------------------------------------------------%
% Angles as measured by the encoders and the respective angle rates
%-------------------------------------------------------------------------%
phiFR1 = thFR1 - thb;
phiFR1dot = thFR1dot - thbdot;
phiFR2 = thFR2 - thb;
phiFR2dot = thFR2dot - thbdot;
phiFR3 = thFR3 - thFR2;
phiFR3dot = thFR3dot - thFR2dot;
phiHR1 = thHR1 - thb;
phiHR1dot = thHR1dot - thbdot;
phiHR2 = thHR2 - thb;
phiHR2dot = thHR2dot - thbdot;
phiHR3 = thHR3 - thHR2;
phiHR3dot = thHR3dot - thHR2dot;

phiFL1 = thFL1 - thb;
phiFL1dot = thFL1dot - thbdot;
phiFL2 = thFL2 - thb;
phiFL2dot = thFL2dot - thbdot;
phiFL3 = thFL3 - thFL2;
phiFL3dot = thFL3dot - thFL2dot;
phiHL1 = thHL1 - thb;
phiHL1dot = thHL1dot - thbdot;
phiHL2 = thHL2 - thb;
phiHL2dot = thHL2dot - thbdot;
phiHL3 = thHL3 - thHL2;
phiHL3dot = thHL3dot - thHL2dot;

% phiT = thT - thb;
% phiTdot = thTdot - thbdot;

%-------------------------------------------------------------------------%
% Call the controller
%-------------------------------------------------------------------------%
% [tau_cntrl_FR1, tau_cntrl_FR2, xdesFR, ydesFR, thFR1des, ...
%     thFR2des] = controller(phiFR1,phiFR1dot,phiFR2,phiFR2dot,t);
% 
% [tau_cntrl_HR1, tau_cntrl_HR2, xdesHR, ydesHR, thHR1des, ...
%     thHR2des] = controller(phiHR1,phiHR1dot,phiHR2,phiHR2dot,t);
% 
% [tau_cntrl_FL1, tau_cntrl_FL2, xdesFL, ydesFL, thFL1des, ...
%     thFL2des] = controller(phiFL1,phiFL1dot,phiFL2,phiFL2dot,t);
% 
% [] = controller(phiHL1,phiHL1dot,phiHL2,phiHL2dot,t);


[tau_cntrl_FR1, tau_cntrl_FR2, xdesFR, ydesFR, thFR1des, thFR2des, ...
 tau_cntrl_HR1, tau_cntrl_HR2, xdesHR, ydesHR, thHR1des, thHR2des, ...
 tau_cntrl_FL1, tau_cntrl_FL2, xdesFL, ydesFL, thFL1des, thFL2des, ...
 tau_cntrl_HL1, tau_cntrl_HL2, xdesHL, ydesHL, thHL1des, thHL2des] = ...
 main_controller(...
 phiFR1, phiFR1dot, phiFR2, phiFR2dot, ...
 phiHR1, phiHR1dot, phiHR2, phiHR2dot,...
 phiFL1, phiFL1dot, phiFL2, phiFL2dot,...
 phiHL1, phiHL1dot, phiHL2, phiHL2dot, t);
    


%-------------------------------------------------------------------------%
% FR leg torques
%-------------------------------------------------------------------------%
% Total hip torque
tauFR1 = tau_cntrl_FR1;
% Total knee torque
tauFR2 = tau_cntrl_FR2;

%-------------------------------------------------------------------------%
% HR leg torques
%-------------------------------------------------------------------------%
% Total hip torque
tauHR1 = tau_cntrl_HR1;
% Total knee torque
tauHR2 = tau_cntrl_HR2;

%-------------------------------------------------------------------------%
% FL leg torques
%-------------------------------------------------------------------------%
% Total hip torque
tauFL1 = tau_cntrl_FL1;
% Total knee torque
tauFL2 = tau_cntrl_FL2;

%-------------------------------------------------------------------------%
% HL leg torques
%-------------------------------------------------------------------------%
% Total hip torque
tauHL1 = tau_cntrl_HL1;
% Total knee torque
tauHL2 = tau_cntrl_HL2;

%-------------------------------------------------------------------------%
% Torques from springs at ankles
%-------------------------------------------------------------------------%
tauFR3 = ankle_torque(phiFR3, phiFR3dot);
tauHR3 = ankle_torque(phiHR3, phiHR3dot);
tauFL3 = ankle_torque(phiFL3, phiFL3dot);
tauHL3 = ankle_torque(phiHL3, phiHL3dot);

%-------------------------------------------------------------------------%
% Tail torque
%-------------------------------------------------------------------------%
tauT = 0;

%-------------------------------------------------------------------------%
% Feet coordinates and velocities
%-------------------------------------------------------------------------%
[xFRf, xHRf, xFLf, xHLf, yFRf, yHRf, yFLf, yHLf, ...
    xFRfdot, yFRfdot, xHRfdot, yHRfdot, ...
    xFLfdot, yFLfdot, xHLfdot, yHLfdot] = ...
    state_to_feet_coords(...
    xb, xbdot, yb, ybdot, thb, thbdot, ...
    thFR1, thFR1dot, thFR2, thFR2dot, thFR3, thFR3dot, ...
    thHR1, thHR1dot, thHR2, thHR2dot, thHR3, thHR3dot, ...
    thFL1, thFL1dot, thFL2, thFL2dot, thFL3, thFL3dot, ...
    thHL1, thHL1dot, thHL2, thHL2dot, thHL3, thHL3dot);

%-------------------------------------------------------------------------%
% Ground Forces
%-------------------------------------------------------------------------%
[NFR, FFR, NHR, FHR, NFL, FFL, NHL, FHL, slipFR, slipHR, slipFL, slipHL]...
    = ground_forces(yFRf, yHRf, yFLf, yHLf, xFRf, xHRf, xFLf, xHLf, ...
    xFRfdot, yFRfdot, xHRfdot, yHRfdot, ...
    xFLfdot, yFLfdot, xHLfdot, yHLfdot);   

    