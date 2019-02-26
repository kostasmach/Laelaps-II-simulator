%-------------------------------------------------------------------------%
% Hind Left Leg Plots
%-------------------------------------------------------------------------%

% Hip torque
torqueHL1 = Torques(:,7);
% Hip speed
speedHL1 = (x(:,26)-x(:,6))*9.5493;
% Hip angle
angleHL1 = rad2deg(x(:,25)-x(:,5));
% Hip Desired angle
angledesHL1 = rad2deg(Angles_des(:,7));
% Hip power
powerHL1 = Torques(:,7).*(x(:,26)-x(:,6));

% Knee torque
torqueHL2 = Torques(:,8);
% Knee speed
speedHL2 = (x(:,28)-x(:,6))*9.5493;
% Knee angle
angleHL2 = rad2deg(x(:,27)-x(:,5));
% Knee Desired angle
angledesHL2 = rad2deg(Angles_des(:,8));
% Knee power
powerHL2 = Torques(:,8).*(x(:,28)-x(:,6));

% Stance events
Stance_events_HL = Stance_events(:,4);

% Figure position/size
figure('units','normalized','outerposition', ...
    [0.1 0.1 0.8 0.8],'Name','HL Leg')
set(gcf,'color','white')
clf;

plot_leg_data(torqueHL1, speedHL1, angleHL1, ...
    angledesHL1, powerHL1, torqueHL2, speedHL2, angleHL2, angledesHL2, ... 
    powerHL2, Stance_events_HL, t)
