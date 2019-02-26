% Post processing

%-------------------------------------------------------------------------%
% Initializations
%-------------------------------------------------------------------------%
n = size(t);    % Data size
i2 = 0;         % Initialization of time printing counter

%-------------------------------------------------------------------------%
% Initialization of new vectors
%-------------------------------------------------------------------------%
NForces = [];
FForces = [];
Slip_events = [];
Torques = [];
Toe_coords_des = [];
Angles_des = [];

%-------------------------------------------------------------------------%
% Use the solution vectors to calculate again the EoM inputs (torques and
% forces), since they are not included in the solver's outputs
%-------------------------------------------------------------------------%
for i_p = 1 : n
  
    % Read the output vector element by element  
    xb = x(i_p,1);
    xbdot = x(i_p,2);
    yb = x(i_p,3);
    ybdot = x(i_p,4);
    thb = x(i_p,5);
    thbdot = x(i_p,6);
    thFR1 = x(i_p,7);
    thFR1dot = x(i_p,8);
    thFR2 = x(i_p,9);
    thFR2dot = x(i_p,10);
    thFR3 = x(i_p,11);
    thFR3dot = x(i_p,12);
    thHR1 = x(i_p,13);
    thHR1dot = x(i_p,14);
    thHR2 = x(i_p,15);
    thHR2dot = x(i_p,16);
    thHR3 = x(i_p,17);
    thHR3dot = x(i_p,18);
    thFL1 = x(i_p,19);
    thFL1dot = x(i_p,20);
    thFL2 = x(i_p,21);
    thFL2dot = x(i_p,22);
    thFL3 = x(i_p,23);
    thFL3dot = x(i_p,24);
    thHL1 = x(i_p,25);
    thHL1dot = x(i_p,26);
    thHL2 = x(i_p,27);
    thHL2dot = x(i_p,28);
    thHL3 = x(i_p,29);
    thHL3dot = x(i_p,30);
    thT = x(i_p,31);
    thTdot = x(i_p,32);
    
    % Read the time vector element by element
    t_i = t(i_p);
        
    % Torque and force inputs to the EoM - same function must be used in
    % 'post_processing.m'
    [tauFR1, tauFR2, tauFR3, tauHR1, tauHR2, tauHR3, ...
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
        thT, thTdot, t_i);    
    
    % Control torques
    Torques_i =[tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, tauFL2, ...
        tauHL1, tauHL2, tauT];
    Torques = [Torques; Torques_i];
    
    % Desired toe coordinates
    Toe_coords_des_i = [xdesFR, ydesFR, xdesHR, ydesHR, xdesFL, ydesFL, ...
        xdesHL, ydesHL];
    Toe_coords_des = [Toe_coords_des; Toe_coords_des_i];
           
    % Desired angles
    Angles_des_i = [thFR1des, thFR2des, thHR1des, thHR2des,...
        thFL1des, thFL2des, thHL1des, thHL2des];
    Angles_des = [Angles_des; Angles_des_i];
        
    % Normal ground forces
    NForces_i = [NFR NHR NFL NHL];
    NForces = [NForces; NForces_i];
    
    % Frictional forces
    FForces_i = [FFR FHR FFL FHL];
    FForces = [FForces; FForces_i];
    
    % Slip/stance events
    Slip_events_i = [slipFR, slipHR, slipFL, slipHL];
    Slip_events = [Slip_events; Slip_events_i];
    Stance_events = Slip_events ~= -1;
    
    % Print time
    i2 = i2 +1; % increase the counter
    if ~mod(i2,500)
        clc
        message2=['Post-Processing Time:   ',num2str(t_i,'%0.4f'),' / ',...
            num2str(tfinal),'s'];
        disp(message2)
        % Update progress bar
        waitbar(t_i/tfinal, progress_bar, message2);
    end
end