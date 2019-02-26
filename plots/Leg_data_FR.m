%-------------------------------------------------------------------------%
% Fore Right Leg Plots
%-------------------------------------------------------------------------%

% Hip torque
torqueFR1 = Torques(:,1);
% Hip speed
speedFR1 = (x(:,8)-x(:,6))*9.5493;
% Hip angle
angleFR1 = rad2deg(x(:,7)-x(:,5));
% Hip Desired angle
angledesFR1 = rad2deg(Angles_des(:,1));
% Hip power
powerFR1 = Torques(:,1).*(x(:,8)-x(:,6));

% Knee torque
torqueFR2 = Torques(:,2);
% Knee speed
speedFR2 = (x(:,10)-x(:,6))*9.5493;
% Knee angle
angleFR2 = rad2deg(x(:,9)-x(:,5));
% Knee Desired angle
angledesFR2 = rad2deg(Angles_des(:,2));
% Knee power
powerFR2 = Torques(:,2).*(x(:,10)-x(:,6));

% Stance events
Stance_events_FR = Stance_events(:,1);

% Figure position/size
figure('units','normalized','outerposition', ...
    [0.1 0.1 0.8 0.8],'Name','FR Leg')
set(gcf,'color','white')
clf;

plot_leg_data(torqueFR1, speedFR1, angleFR1, ...
    angledesFR1, powerFR1, torqueFR2, speedFR2, angleFR2, angledesFR2, ... 
    powerFR2, Stance_events_FR, t)
