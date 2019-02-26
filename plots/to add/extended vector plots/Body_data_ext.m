%-------------------------------------------------------------------------%
% Body Data Plots
%-------------------------------------------------------------------------%

f3 = figure(3);
set(f3, 'Position', [100, 100, 1100, 400]);
clf(f3);

% Body CoM Trajectory 
subplot(1,3,1)
plot(xout(:,1),xout(:,3))
ylabel('y (m)') 
xlabel('x (m)') 
title('Body CoM Trajectory ')
grid on
axis square

% Body Horizontal Velocity (m/s) - t
subplot(1,3,2)
plot(tout,xout(:,2))
%hold on
%plot(toutE,forward_vel_des,'r')
%hold off
ylabel('Body Horizontal Velocity (m/s)') 
xlabel('Time (s)') 
title('Body Horizontal Velocity (m/s) - t(s)')
grid on
axis square

% Body Pitch Angle (rad) - t
subplot(1,3,3)
plot(tout,xout(:,5))
ylabel('Body Pitch Angle (rad)') 
xlabel('Time (s)') 
title('Body Pitch Angle (rad) - t(s)')
grid on
axis square
