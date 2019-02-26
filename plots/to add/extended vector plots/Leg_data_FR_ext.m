%-------------------------------------------------------------------------%
% Fore Right Leg Plots
%-------------------------------------------------------------------------%

f2 = figure(2);
set(f2, 'Position', [100, 100, 1049, 895]);
clf(f2);

% suptitle('Fore Right Leg')

% Hip Torque (Nm) - Speed (rpm)
subplot(3,2,1)
plot(TorquesE(:,1),(xoutE(:,8)-xoutE(:,6))*9.5493)
ylabel('Speed (rpm)') 
xlabel('Torque (Nm)') 
title('Hip Torque - Speed')
grid on

% Knee Torque (Nm) - Speed (rpm)
subplot(3,2,2)
plot(TorquesE(:,2),(xoutE(:,10)-xoutE(:,8))*9.5493)
ylabel('Speed (rpm)') 
xlabel('Torque (Nm)') 
title('Knee Torque - Speed')
grid on

% Hip and Knee Torque (Nm) - t (s)
subplot(3,2,3)
hold all
plot(toutE,TorquesE(:,1))
plot(toutE,TorquesE(:,2))
hold off
ylabel('Torque (Nm)') 
xlabel('t (s)') 
title('Hip and Knee Torque - Time')
axis([0 max(toutE) -300 300])
grid on

% Hip and Knee Speed (rpm) - t (s)
subplot(3,2,4)
hold all
plot(toutE,(xoutE(:,8)-xoutE(:,6))*9.5493)
plot(toutE,(xoutE(:,10)-xoutE(:,8))*9.5493)
hold off
ylabel('Speed (rpm)') 
xlabel('t (s)') 
title('Hip and Knee Speed - Time')
grid on

% Hip and Knee Joint Angle (degrees) - t (s)
subplot(3,2,5)
hold all
plot(toutE,rad2deg(xoutE(:,7)-xoutE(:,5)))
plot(toutE,rad2deg(xoutE(:,9)-xoutE(:,7)))
hold off
ylabel('Joint Angle (degrees)') 
xlabel('t (s)') 
title('Hip and Knee Joint Angle - Time')
grid on

% Hip and Knee Power (W) - t (s)
subplot(3,2,6)
power1 = TorquesE(:,1) .* (xoutE(:,8)-xoutE(:,6));
hold all
plot(toutE,power1)
power2 = TorquesE(:,2) .* (xoutE(:,10)-xoutE(:,8));
plot(toutE,power2)
hold off
ylabel('Power (W)') 
xlabel('t (s)') 
title('Hip and knee Power - Time')
axis([0 max(toutE) -300 300])
grid on








