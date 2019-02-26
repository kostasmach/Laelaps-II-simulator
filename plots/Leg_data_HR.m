%-------------------------------------------------------------------------%
% Hind Right Leg Plots
%-------------------------------------------------------------------------%

% Hip torque
torqueHR1 = Torques(:,3);
% Hip speed
speedHR1 = (x(:,14)-x(:,6))*9.5493;
% Hip angle
angleHR1 = rad2deg(x(:,13)-x(:,5));
% Hip Desired angle
angledesHR1 = rad2deg(Angles_des(:,3));
% Hip power
powerHR1 = Torques(:,3).*(x(:,14)-x(:,6));

% Knee torque
torqueHR2 = Torques(:,4);
% Knee speed
speedHR2 = (x(:,16)-x(:,6))*9.5493;
% Knee angle
angleHR2 = rad2deg(x(:,15)-x(:,5));
% Knee Desired angle
angledesHR2 = rad2deg(Angles_des(:,4));
% Knee power
powerHR2 = Torques(:,4).*(x(:,16)-x(:,6));

% Stance events
Stance_events_HR = Stance_events(:,2);

% Figure position/size
figure('units','normalized','outerposition', ...
    [0.1 0.1 0.8 0.8],'Name','HR Leg')
set(gcf,'color','white')
clf;

plot_leg_data(torqueHR1, speedHR1, angleHR1, ...
    angledesHR1, powerHR1, torqueHR2, speedHR2, angleHR2, angledesHR2, ... 
    powerHR2, Stance_events_HR, t)
