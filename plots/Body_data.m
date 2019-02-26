%-------------------------------------------------------------------------%
% Body Data Plots
%-------------------------------------------------------------------------%

% FigHandle = figure('Position', [60, 60, 900, 300]);
figure('units','normalized','outerposition',[0.1 0.1 0.8 0.8], 'Name', 'Body Data')
set(gcf,'color','white')
clf;

% Color for filling stance areas
st_c = 'g';
st_c2 = 'k';
% st_c2 = [0.4 0.4 0.4];
% st_c2 = [0.8500 0.3250 0.0980];


% Body CoM Trajectory 
subplot(1,3,1)
hold all
plot(x(:,1),x(:,3),'k', 'LineWidth', 1)
ylabel('y (m)') 
xlabel('x (m)') 
title('Body CoM Trajectory ')
grid on
axis square
box on

% Body Horizontal Velocity (m/s) - t
subplot(1,3,2)
y_limit_up = max(x(:,2));
y_limit_down = min(x(:,2));
hold all
area(t,y_limit_up.*Stance_events(:,1),'FaceColor',st_c,'LineStyle','no')
area(t,y_limit_down.*Stance_events(:,1),'FaceColor',st_c,'LineStyle','no')
area(t,y_limit_up.*Stance_events(:,2),'FaceColor',st_c2,'LineStyle','no')
area(t,y_limit_down.*Stance_events(:,2),'FaceColor',st_c2,'LineStyle','no')
area(t,y_limit_up.*Stance_events(:,3),'FaceColor',st_c2,'LineStyle','no')
area(t,y_limit_down.*Stance_events(:,3),'FaceColor',st_c2,'LineStyle','no')
area(t,y_limit_up.*Stance_events(:,4),'FaceColor',st_c,'LineStyle','no')
area(t,y_limit_down.*Stance_events(:,4),'FaceColor',st_c,'LineStyle','no')
plot(t,x(:,2),'k', 'LineWidth', 1)
ylabel('Horizontal Velocity (m/s)') 
xlabel('Time (s)') 
title('Body Horizontal Velocity')
axis([-0.1 max(t)+0.1 1.0*y_limit_down 1.0*y_limit_up])
grid on
axis square
box on
alpha(.05)

% Body Pitch Angle (rad) - t
subplot(1,3,3)
y_limit_up = max(x(:,5));
y_limit_down = min(x(:,5));
hold all
area(t,y_limit_up.*Stance_events(:,1),'FaceColor',st_c,'LineStyle','no')
area(t,y_limit_down.*Stance_events(:,1),'FaceColor',st_c,'LineStyle','no')
area(t,y_limit_up.*Stance_events(:,2),'FaceColor',st_c2,'LineStyle','no')
area(t,y_limit_down.*Stance_events(:,2),'FaceColor',st_c2,'LineStyle','no')
area(t,y_limit_up.*Stance_events(:,3),'FaceColor',st_c2,'LineStyle','no')
area(t,y_limit_down.*Stance_events(:,3),'FaceColor',st_c2,'LineStyle','no')
area(t,y_limit_up.*Stance_events(:,4),'FaceColor',st_c,'LineStyle','no')
area(t,y_limit_down.*Stance_events(:,4),'FaceColor',st_c,'LineStyle','no')
plot(t,x(:,5),'k', 'LineWidth', 1)
ylabel('Body Pitch Angle (rad)') 
xlabel('Time (s)') 
title('Body Pitch Angle')
axis([-0.1 max(t)+0.1 1.0*y_limit_down 1.0*y_limit_up])
grid on
axis square
box on
alpha(.05)
