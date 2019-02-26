function plot_leg_data(torque1, speed1, angle1, ...
    angledes1, power1, torque2, speed2, angle2, angledes2, power2, ...
    stance_events, t)

% Color for denoting stance phases
st_c = 'g';

% Hip Torque (Nm) - Speed (rpm)
subplot(3,2,1)
hold all
plot(torque1,speed1,'LineWidth',1)
area([0;300],300*ones(2,1),'FaceColor','k')
area([0;-300],-300*ones(2,1),'FaceColor','k')
axis([-100 100 -100 100])
ylabel('Speed (rpm)') 
xlabel('Torque (Nm)') 
title('Hip Torque - Speed')
grid on
box on
alpha(.07)

% Knee Torque (Nm) - Speed (rpm)
subplot(3,2,2)
hold all
plot(torque2,speed2,'LineWidth',1)
area([0;300],300*ones(2,1),'FaceColor','k')
area([0;-300],-300*ones(2,1),'FaceColor','k')
axis([-100 100 -100 100])
ylabel('Speed (rpm)') 
xlabel('Torque (Nm)') 
title('Knee Torque - Speed')
grid on
box on
alpha(.07)

% Hip and Knee Torque (Nm) - t (s)
subplot(3,2,3)
y_limit_up = max([torque1; torque2]);
y_limit_down = min([torque1; torque2]);
hold all
% Denote the stance areas with gray
area(t,y_limit_up.*stance_events,'FaceColor',st_c,'LineStyle','no')
area(t,y_limit_down.*stance_events,'FaceColor',st_c,'LineStyle','no')
p1 = plot(t,torque1,'LineWidth',1);
p2 = plot(t,torque2,'LineWidth',1);
plot([0 max(t)],[0 0],'k')
hold off
ylabel('Torque (Nm)') 
xlabel('t (s)') 
title('Hip and Knee Torque - Time')
axis([-0.1 max(t)+0.1 y_limit_down y_limit_up])
legend([p1 p2],'Hip','Knee');
grid on
box on
alpha(.1)

% Hip and Knee Speed (rpm) - t (s)
subplot(3,2,4)
y_limit_up = max([speed1; speed2]);
y_limit_down = min([speed1; speed2]);
hold all
% Denote the stance areas with gray
area(t,y_limit_up.*stance_events,'FaceColor',st_c,'LineStyle','no')
area(t,y_limit_down.*stance_events,'FaceColor',st_c,'LineStyle','no')
p1 = plot(t, speed1,'LineWidth',1);
p2 = plot(t, speed2,'LineWidth',1);
hold off
ylabel('Speed (rpm)') 
xlabel('t (s)') 
title('Hip and Knee Speed - Time')
axis([-0.1 max(t)+0.1 y_limit_down y_limit_up])
legend([p1 p2],'Hip','Knee');
grid on
box on
alpha(.1)

% Hip and Knee Joint Angle (degrees) - t (s)
subplot(3,2,5)
y_limit_up = max([angle1; angle2]);
y_limit_down = min([angle1; angle2]);
hold all
% Denote the stance areas with gray
area(t,y_limit_up.*stance_events,'FaceColor',st_c,'LineStyle','no')
area(t,y_limit_down.*stance_events,'FaceColor',st_c,'LineStyle','no')
p1 = plot(t,angle1,'LineWidth',1);
p2 = plot(t,angle2,'LineWidth',1);
plot(t,angledes1,':k','LineWidth',1)
plot(t,angledes2,':k','LineWidth',1)
hold off
ylabel('Joint Angle (degrees)') 
xlabel('t (s)') 
title('Hip and Knee Joint Angle - Time')
axis([-0.1 max(t)+0.1 y_limit_down y_limit_up])
legend([p1 p2], 'Hip','Knee');
grid on
box on
alpha(.1)

% Hip and Knee Power (W) - t (s)
subplot(3,2,6)
y_limit_up = max([power1; power2]);
y_limit_down = min([power1; power2]);
hold all
% Denote the stance areas with gray
area(t,y_limit_up.*stance_events,'FaceColor',st_c,'LineStyle','no')
area(t,y_limit_down.*stance_events,'FaceColor',st_c,'LineStyle','no')
p1 = plot(t,power1,'LineWidth',1);
p2 = plot(t,power2,'LineWidth',1);
hold off
ylabel('Power (W)')
xlabel('t (s)') 
title('Hip and Knee Power - Time')
axis([-0.1 max(t)+0.1 y_limit_down y_limit_up])
legend([p1 p2], 'Hip','Knee');
grid on
box on
alpha(.1)

end

