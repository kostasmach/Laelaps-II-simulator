%-------------------------------------------------------------------------%
% Hind Left Leg Plots
%-------------------------------------------------------------------------%

f2 = figure(2);
set(f2, 'Position', [100, 100, 1049, 895]);
clf(f2);

suptitle('Hind Left Leg')

% Hip Torque (Nm) - Speed (rpm)
subplot(3,2,1)
plot(TorquesE(:,10),(xoutE(:,26)-xoutE(:,6))*9.5493)
ylabel('Speed (rpm)') 
xlabel('Torque (Nm)') 
title('Hip Torque - Speed')
grid on

% Knee Torque (Nm) - Speed (rpm)
subplot(3,2,2)
plot(TorquesE(:,11),(xoutE(:,28)-xoutE(:,26))*9.5493)
ylabel('Speed (rpm)') 
xlabel('Torque (Nm)') 
title('Knee Torque - Speed')
grid on

% Hip and Knee Torque (Nm) - t (s)
subplot(3,2,3)
hold all
plot(toutE,TorquesE(:,10))
plot(toutE,TorquesE(:,11))
hold off
ylabel('Torque (Nm)') 
xlabel('t (s)') 
title('Hip and Knee Torque - Time')
axis([0 max(toutE) -300 300])
grid on

% Hip and Knee Speed (rpm) - t (s)
subplot(3,2,4)
hold all
plot(toutE,(xoutE(:,26)-xoutE(:,6))*9.5493)
plot(toutE,(xoutE(:,28)-xoutE(:,26))*9.5493)
hold off
ylabel('Speed (rpm)') 
xlabel('t (s)') 
title('Hip and Knee Speed - Time')
grid on

% Hip and Knee Joint Angle (degrees) - t (s)
subplot(3,2,5)
hold all
plot(toutE,rad2deg(xoutE(:,25)-xoutE(:,5)))
plot(toutE,rad2deg(xoutE(:,27)-xoutE(:,25)))
hold off
ylabel('Joint Angle (degrees)') 
xlabel('t (s)') 
title('Hip and Knee Joint Angle - Time')
grid on

% Hip and Knee Power (W) - t (s)
subplot(3,2,6)
power1 = TorquesE(:,10) .* (xoutE(:,26)-xoutE(:,6));
hold all
plot(toutE,power1)
power2 = TorquesE(:,11) .* (xoutE(:,28)-xoutE(:,26));
plot(toutE,power2)
hold off
ylabel('Power (W)') 
xlabel('t (s)') 
title('Hip and knee Power - Time')
axis([0 max(toutE) -300 300])
grid on








