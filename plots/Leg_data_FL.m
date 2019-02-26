%-------------------------------------------------------------------------%
% Fore Left Leg Plots
%-------------------------------------------------------------------------%

% Hip torque
torqueFL1 = Torques(:,5);
% Hip speed
speedFL1 = (x(:,20)-x(:,6))*9.5493;
% Hip angle
angleFL1 = rad2deg(x(:,19)-x(:,5));
% Hip Desired angle
angledesFL1 = rad2deg(Angles_des(:,5));
% Hip power
powerFL1 = Torques(:,5).*(x(:,20)-x(:,6));

% Knee torque
torqueFL2 = Torques(:,6);
% Knee speed
speedFL2 = (x(:,22)-x(:,6))*9.5493;
% Knee angle
angleFL2 = rad2deg(x(:,21)-x(:,5));
% Knee Desired angle
angledesFL2 = rad2deg(Angles_des(:,6));
% Knee power
powerFL2 = Torques(:,6).*(x(:,22)-x(:,6));

% Stance events
Stance_events_FL = Stance_events(:,3);

% Figure position/size
figure('units','normalized','outerposition',...
    [0.1 0.1 0.8 0.8],'Name','FL Leg')
set(gcf,'color','white')
clf;

plot_leg_data(torqueFL1, speedFL1, angleFL1, ...
    angledesFL1, powerFL1, torqueFL2, speedFL2, angleFL2, angledesFL2, ... 
    powerFL2, Stance_events_FL, t)
