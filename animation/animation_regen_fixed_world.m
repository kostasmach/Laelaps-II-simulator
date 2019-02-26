% Animation

%-------------------------------------------------------------------------%
% Animation Speed
%-------------------------------------------------------------------------%
delta_t_anim = max(diff(t)) + 0.01;
t_new = 0 : delta_t_anim : max(t);
index_anim = [];

for i = 1:length(t_new) 
    [M index_anim(i)] = min(abs(t-t_new(i)));  
end
step = 1;

%-------------------------------------------------------------------------%
% Figure
%-------------------------------------------------------------------------%
figure('units','normalized','outerposition',[0.2 0.2 0.6 0.6])
set(gcf,'color','white')
clf;

%-------------------------------------------------------------------------%
% Size of data
%-------------------------------------------------------------------------%
n = size(x,1);

%-------------------------------------------------------------------------%
% Tail for feet traces
%-------------------------------------------------------------------------%
trace_tail = round(n/4);

%-------------------------------------------------------------------------%
% Put data in vectors
%-------------------------------------------------------------------------%
% xb = x(:,1);
% yb = x(:,3);
% thb = x(:,5);
% thFR1 = x(:,7);
% thFR2 = x(:,9);
% thFR3 = x(:,11);
% thHR1 = x(:,13);
% thHR2 = x(:,15);
% thHR3 = x(:,17);
% thFL1 = x(:,19);
% thFL2 = x(:,21);
% thFL3 = x(:,23);
% thHL1 = x(:,25);
% thHL2 = x(:,27);
% thHL3 = x(:,29);
% thT = x(:,31);
%-------------------------------------------------------------------------%
xb = x(:,1);
yb = x(:,3);
thb = x(:,5);
thFR1 = x(:,7);
thFR2 = x(:,9);
thFR3 = x(:,11);
thHR1 = x(:,13);
thHR2 = x(:,15);
thHR3 = x(:,17);
thFL1 = x(:,19);
thFL2 = x(:,21);
thFL3 = x(:,23);
thHL1 = x(:,25);
thHL2 = x(:,27);
thHL3 = x(:,29);
thT = x(:,31);

%-------------------------------------------------------------------------%
% FR joints torques and speeds
%-------------------------------------------------------------------------%
torqueFR1 = Torques(:,1);
speedFR1 = (x(:,8)-x(:,6))*9.5493;
powerFR1 = Torques(:,1).*(x(:,8)-x(:,6));
torqueFR2 = Torques(:,2);
speedFR2 = (x(:,10)-x(:,6))*9.5493;
powerFR2 = Torques(:,2).*(x(:,10)-x(:,6));

%-------------------------------------------------------------------------%
% HR joints torques and speeds
%-------------------------------------------------------------------------%
torqueHR1 = Torques(:,3);
speedHR1 = (x(:,14)-x(:,6))*9.5493;
powerHR1 = Torques(:,3).*(x(:,14)-x(:,6));
torqueHR2 = Torques(:,4);
speedHR2 = (x(:,16)-x(:,6))*9.5493;
powerHR2 = Torques(:,4).*(x(:,16)-x(:,6));

%-------------------------------------------------------------------------%
% FL joints torques and speeds
%-------------------------------------------------------------------------%
torqueFL1 = Torques(:,5);
speedFL1 = (x(:,20)-x(:,6))*9.5493;
powerFL1 = Torques(:,5).*(x(:,20)-x(:,6));
torqueFL2 = Torques(:,6);
speedFL2 = (x(:,22)-x(:,6))*9.5493;
powerFL2 = Torques(:,6).*(x(:,22)-x(:,6));

%-------------------------------------------------------------------------%
% HL joints torques and speeds
%-------------------------------------------------------------------------%
torqueHL1 = Torques(:,7);
speedHL1 = (x(:,26)-x(:,6))*9.5493;
powerHL1 = Torques(:,7).*(x(:,26)-x(:,6));
torqueHL2 = Torques(:,8);
speedHL2 = (x(:,28)-x(:,6))*9.5493;
powerHL2 = Torques(:,8).*(x(:,28)-x(:,6));

%-------------------------------------------------------------------------%
% Fore Right leg coordinates
% Convert state vectors to leg geometry coordinates
%-------------------------------------------------------------------------%
[x_hip_FR, y_hip_FR, x_m1_FR, y_m1_FR, x_knee_FR, y_knee_FR, x_m2_FR, ...
    y_m2_FR, x_ankle_FR, y_ankle_FR, x_m3_FR, y_m3_FR, x_foot_FR, ...
    y_foot_FR, x_F_FR, y_F_FR, x_G_FR, y_G_FR, x_H_FR, y_H_FR, x_E_FR, ...
    y_E_FR, x_D_FR, y_D_FR] = ...
    state_to_leg_coords(thFR1, thFR2, thFR3, xb, yb, thb, 1);

%-------------------------------------------------------------------------%
% Hind Right leg coordinates
% Convert state vectors to leg geometry coordinates
%-------------------------------------------------------------------------%
[x_hip_HR, y_hip_HR, x_m1_HR, y_m1_HR, x_knee_HR, y_knee_HR, x_m2_HR, ...
    y_m2_HR, x_ankle_HR, y_ankle_HR, x_m3_HR, y_m3_HR, x_foot_HR, ...
    y_foot_HR, x_F_HR, y_F_HR, x_G_HR, y_G_HR, x_H_HR, y_H_HR, x_E_HR, ...
    y_E_HR, x_D_HR, y_D_HR] = ...
    state_to_leg_coords(thHR1, thHR2, thHR3, xb, yb, thb, 2);

%-------------------------------------------------------------------------%
% Fore Left leg coordinates
% Convert state vectors to leg geometry coordinates
%-------------------------------------------------------------------------%
[x_hip_FL, y_hip_FL, x_m1_FL, y_m1_FL, x_knee_FL, y_knee_FL, x_m2_FL, ...
    y_m2_FL, x_ankle_FL, y_ankle_FL, x_m3_FL, y_m3_FL, x_foot_FL, ...
    y_foot_FL, x_F_FL, y_F_FL, x_G_FL, y_G_FL, x_H_FL, y_H_FL, x_E_FL, ...
    y_E_FL, x_D_FL, y_D_FL] = ...
    state_to_leg_coords(thFL1, thFL2, thFL3, xb, yb, thb, 1);

%-------------------------------------------------------------------------%
% Hind Left leg coordinates
%-------------------------------------------------------------------------%
[x_hip_HL, y_hip_HL, x_m1_HL, y_m1_HL, x_knee_HL, y_knee_HL, x_m2_HL, ...
    y_m2_HL, x_ankle_HL, y_ankle_HL, x_m3_HL, y_m3_HL, x_foot_HL, ...
    y_foot_HL, x_F_HL, y_F_HL, x_G_HL, y_G_HL, x_H_HL, y_H_HL, x_E_HL, ...
    y_E_HL, x_D_HL, y_D_HL] = ...
    state_to_leg_coords(thHL1, thHL2, thHL3, xb, yb, thb, 2);

%-------------------------------------------------------------------------%
% Tail coordinates
%-------------------------------------------------------------------------%
xTailJoint=xb+(-1).*dbT.*cos(thb);
yTailJoint=yb+(-1).*dbT.*sin(thb);
xTailMass=xb+(-1).*dbT.*cos(thb)+dT.*sin(thT);
yTailMass=yb+(-1).*dT.*cos(thT)+(-1).*dbT.*sin(thb);

%-------------------------------------------------------------------------%
% Ground geometry
%-------------------------------------------------------------------------%
x_gnd = -2:0.001:10;
for i = 1:length(x_gnd)
    y_gnd(i) = ground_height(x_gnd(i));
end


%-------------------------------------------------------------------------%
% Animation Loop
%-------------------------------------------------------------------------%
for j = 1:5:length(index_anim)
       
    i = index_anim(j);
    
    % Plot ground
%     v1 = [-1.1 , -0.05];  % up left corner
%     v2 = [10.9 , -0.05];  % up right corner
%     v3 = [10.9 , 0];  % down right corner
%     v4 = [-1.1 , 0]; % down left corner
%     abcissas = [v1(1) v2(1) v3(1) v4(1)]; 
%     ordinates = [v1(2) v2(2) v3(2) v4(2)];
%     fill(abcissas, ordinates,'k');
%     hold on;
%     plot([-2.5 12.5],[0 0],'color', [0.6 0.6 0.6])    
    plot(x_gnd,y_gnd,'color', [0.5 0.5 0.5])
    area(x_gnd,y_gnd,'FaceColor',[0.6 0.6 0.6])
    %area([y_gnd;-ones(1,length(y_gnd))])
    hold on;
    alpha(0.1)
    
    % Plot friction cone
    r_fr_cone = 0.05;
    % Fore right leg
    if y_foot_FR(i) <= 0
        p_right_x = x_foot_FR(i) + r_fr_cone * sin(atan(mu_d));
        p_right_y = r_fr_cone * cos(atan(mu_d));
        p_left_x = x_foot_FR(i) - r_fr_cone * sin(atan(mu_d));
        p_left_y = r_fr_cone * cos(atan(mu_d));
        fill([x_foot_FR(i) p_right_x p_left_x x_foot_FR(i)], ...
            [0 p_right_y p_left_y 0], [0.95 0.9 0.9],'EdgeColor','none')
    end
    % Hind right leg
    if y_foot_HR(i) <= 0
        p_right_x = x_foot_HR(i) + r_fr_cone * sin(atan(mu_d));
        p_right_y = r_fr_cone * cos(atan(mu_d));
        p_left_x = x_foot_HR(i) - r_fr_cone * sin(atan(mu_d));
        p_left_y = r_fr_cone * cos(atan(mu_d));
        fill([x_foot_HR(i) p_right_x p_left_x x_foot_HR(i)], ...
            [0 p_right_y p_left_y 0], [0.95 0.9 0.9],'EdgeColor','none')
    end
    % Fore left leg
    if y_foot_FL(i) <= 0
        p_right_x = x_foot_FL(i) + r_fr_cone * sin(atan(mu_d));
        p_right_y = r_fr_cone * cos(atan(mu_d));
        p_left_x = x_foot_FL(i) - r_fr_cone * sin(atan(mu_d));
        p_left_y = r_fr_cone * cos(atan(mu_d));
        fill([x_foot_FL(i) p_right_x p_left_x x_foot_FL(i)], ...
            [0 p_right_y p_left_y 0], [0.95 0.9 0.9],'EdgeColor','none')
    end
    % Hind left leg
    if y_foot_HL(i) <= 0
        p_right_x = x_foot_HL(i) + r_fr_cone * sin(atan(mu_d));
        p_right_y = r_fr_cone * cos(atan(mu_d));
        p_left_x = x_foot_HL(i) - r_fr_cone * sin(atan(mu_d));
        p_left_y = r_fr_cone * cos(atan(mu_d));
        fill([x_foot_HL(i) p_right_x p_left_x x_foot_HL(i)], ...
            [0 p_right_y p_left_y 0], [0.95 0.9 0.9],'EdgeColor','none')
    end
    
    % Plot Fore Left Leg
    leg_plot(x_hip_FL(i), y_hip_FL(i), x_m1_FL(i), y_m1_FL(i), ...
        x_knee_FL(i),y_knee_FL(i), x_m2_FL(i), y_m2_FL(i), ...
        x_ankle_FL(i), y_ankle_FL(i), x_m3_FL(i), y_m3_FL(i), ...
        x_foot_FL(i), y_foot_FL(i), x_F_FL(i), y_F_FL(i), x_G_FL(i), ...
        y_G_FL(i), x_H_FL(i), y_H_FL(i), x_E_FL(i), y_E_FL(i), ...
        x_D_FL(i), y_D_FL(i), 1);
    
    % Plot trace
    if i < trace_tail
        plot(x_foot_FL(1:i), y_foot_FL(1:i),'b')
    else
        plot(x_foot_FL((i-trace_tail):i), y_foot_FL((i-trace_tail):i),'b')
    end
    
    % Plot Hind Left Leg
    leg_plot(x_hip_HL(i), y_hip_HL(i), x_m1_HL(i), y_m1_HL(i), ...
        x_knee_HL(i), y_knee_HL(i), x_m2_HL(i), y_m2_HL(i), ...
        x_ankle_HL(i), y_ankle_HL(i), x_m3_HL(i), y_m3_HL(i), ...
        x_foot_HL(i), y_foot_HL(i), x_F_HL(i), y_F_HL(i), x_G_HL(i), ...
        y_G_HL(i), x_H_HL(i), y_H_HL(i), x_E_HL(i), y_E_HL(i), ...
        x_D_HL(i), y_D_HL(i), 1);
    
    % Plot trace
    if i < trace_tail
        plot(x_foot_HL(1:i), y_foot_HL(1:i),'b')
    else
        plot(x_foot_HL((i-trace_tail):i), y_foot_HL((i-trace_tail):i),'b')
    end
    
    % Plot Body
    plot([x_hip_FR(i) x_hip_HR(i)],[y_hip_FR(i)...
        y_hip_HR(i)],'color',[0.4,0.4,0.4],'LineWidth',35)
    plot([x_hip_FR(i) x_hip_HR(i)],[y_hip_FR(i)...
        y_hip_HR(i)],'o','color',[0.9,0.9,0.9],'MarkerSize',35, ...
        'MarkerFaceColor',[0.5,0.5,0.5])
    
    % Plot as a rectangle
    % Rect2(x_hip_FR(i),y_hip_FR(i),% x_hip_HR(i), y_hip_HR(i), 0.08, 0.08)
    
    % Plot Body CoM
    plot_com(xb(i), yb(i),0.02);
    
    % Plot Body CoM trace
    plot(xb(1:i), yb(1:i),'g');
    
    % Plot Fore Right Leg
    leg_plot(x_hip_FR(i), y_hip_FR(i), x_m1_FR(i), y_m1_FR(i), ...
        x_knee_FR(i), y_knee_FR(i), x_m2_FR(i), y_m2_FR(i), ...
        x_ankle_FR(i), y_ankle_FR(i), x_m3_FR(i), y_m3_FR(i), ...
        x_foot_FR(i), y_foot_FR(i), x_F_FR(i), y_F_FR(i), x_G_FR(i), ...
        y_G_FR(i), x_H_FR(i), y_H_FR(i), x_E_FR(i), y_E_FR(i), ...
        x_D_FR(i), y_D_FR(i), 2);
    
    % Plot trace
    if i < trace_tail
        plot(x_foot_FR(1:i), y_foot_FR(1:i),'g')
    else
        plot(x_foot_FR((i-trace_tail):i), y_foot_FR((i-trace_tail):i),'g')
    end
    
    % Plot Hind Right Leg
    leg_plot(x_hip_HR(i), y_hip_HR(i), x_m1_HR(i), y_m1_HR(i), ...
        x_knee_HR(i), y_knee_HR(i), x_m2_HR(i), y_m2_HR(i), ...
        x_ankle_HR(i), y_ankle_HR(i), x_m3_HR(i), y_m3_HR(i), ...
        x_foot_HR(i), y_foot_HR(i), x_F_HR(i), y_F_HR(i), x_G_HR(i), ...
        y_G_HR(i), x_H_HR(i), y_H_HR(i), x_E_HR(i), y_E_HR(i), ...
        x_D_HR(i), y_D_HR(i), 2);
    
    % Plot trace
    if i < trace_tail
        plot(x_foot_HR(1:i), y_foot_HR(1:i),'g')
    else
        plot(x_foot_HR((i-trace_tail):i), y_foot_HR((i-trace_tail):i),'g')
    end
    
    % Show actuators mode (motoring-braking)
    if powerFR1(i) < 0
        plot(x_hip_FR(i), y_hip_FR(i),'ro','MarkerSize',5, ...
            'MarkerFaceColor','r')
    end
    if powerFR2(i) < 0
        plot(x_knee_FR(i), y_knee_FR(i),'ro','MarkerSize',5, ...
            'MarkerFaceColor','r')
    end
    if powerHR1(i) < 0
        plot(x_hip_HR(i), y_hip_HR(i),'ro','MarkerSize',5, ...
            'MarkerFaceColor','r')
    end
    if powerHR2(i) < 0
        plot(x_knee_HR(i), y_knee_HR(i),'ro','MarkerSize',5, ...
            'MarkerFaceColor','r')
    end
    
%-------------------------------------------------------------------------%    
%   Plot Tail - uncomment if needed
%-------------------------------------------------------------------------%
    % plot([xTailJoint(i) xHindRightHip(i)],[yTailJoint(i)...
    %     yHindRightHip(i)],'k-o','LineWidth',2)
    % plot([xTailJoint(i) xTailMass(i)],[yTailJoint(i) yTailMass(i)]...
    %     ,'k-o','LineWidth',2)
%-------------------------------------------------------------------------% 
        
    % Plot Force Vectors from the Ground
    force_scale = 1500;
    % Fore right leg
    quiver(x_foot_FR(i), y_foot_FR(i), ...
        FForces(i,1)/(force_scale), NForces(i,1)/(force_scale),'r')
    % Hind right leg
    quiver(x_foot_HR(i), y_foot_HR(i), ...
        FForces(i,2)/(force_scale), NForces(i,2)/(force_scale),'r')
    % Fore left leg
    quiver(x_foot_FL(i), y_foot_FL(i), ...
        FForces(i,3)/(force_scale), NForces(i,3)/(force_scale),'r')
    % Hind left leg
    quiver(x_foot_HL(i), y_foot_HL(i), ...
        FForces(i,4)/(force_scale), NForces(i,4)/(force_scale),'r')  
    
    % Plot Axis
    axis equal
	%axis([-1 max(xb)+0.5 -0.05 1.0])
    %axis([xb(i)-1.102 xb(i)+0.902 -0.052 1.0])
    if xb(i)<1.7
        axis([-1 2 0 1.1])
    else
        axis([1 4 0 1.1])
    end
       
    % Print Time
    x_time = -0.8;
    % x_time = xb(i) + 0.4;
    y_time = 0.9;
    label = num2str(t(i));
    text(x_time,...
        y_time,...
        'Time [s]:',...
        'Color', 'k',...
        'FontSize', 10);
    text(x_time + 0.2,...
        y_time ,...
        label,...
        'Color', 'k',...
        'FontSize', 10);
    
%-------------------------------------------------------------------------%    
%     % Plot info - uncomment if needed
%-------------------------------------------------------------------------%
%     x_label = 1.25;
%     y_label = 0.8;
%     
%     if t(i) < 1
%         text(x_label,y_label,'Gait: Standing','Color','k','FontSize',15);
%     elseif t(i) < 3
%         text(x_label,y_label,'Gait: Low Speed Trotting','Color','k',...
%             'FontSize', 15);
%     elseif t(i) < 3.7
%         text(x_label,y_label,'Transition to Walking','Color','k',...
%             'FontSize', 15);
%     elseif t(i) < 8
%         text(x_label,y_label,'Gait: Walking','Color','k','FontSize',15);
%     elseif t(i) < 8.7
%         text(x_label,y_label,'Transition to Trotting','Color','k',...
%             'FontSize', 15);
%     elseif t(i) < 15
%         text(x_label,y_label,'Gait: Trotting','Color','k','FontSize',15);
%     end
%-------------------------------------------------------------------------%  

    drawnow
    hold off
end

%close


