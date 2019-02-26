% Simulation animation

figure('units','normalized','outerposition',...
    [0.1 0.1 0.8 0.8],'Name','Leg Animation')
set(gcf,'color','white')
clf;

%-------------------------------------------------------------------------%
% Animation Step
%-------------------------------------------------------------------------%
step = 150;

%-------------------------------------------------------------------------%
% Load sim results
%-------------------------------------------------------------------------%
n = size(x,1);

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
% FR Leg coordinates wrt a frame parallel to the body and fixed at the hip
%-------------------------------------------------------------------------%
[x_hip_FR_h, y_hip_FR_h, x_m1_FR_h, y_m1_FR_h, x_knee_FR_h, ...
    y_knee_FR_h, x_m2_FR_h, y_m2_FR_h, x_ankle_FR_h, y_ankle_FR_h, ...
    x_m3_FR_h, y_m3_FR_h, x_foot_FR_h, y_foot_FR_h, x_F_FR_h, y_F_FR_h, ...
    x_G_FR_h, y_G_FR_h, x_H_FR_h, y_H_FR_h, x_E_FR_h, y_E_FR_h, ...
    x_D_FR_h, y_D_FR_h] = ...
    state_to_leg_coords_wrt_hip(thFR1-thb, thFR2-thb, thFR3-thb);

%-------------------------------------------------------------------------%
% HR Leg coordinates wrt a frame parallel to the body and fixed at the hip
%-------------------------------------------------------------------------%
[x_hip_HR_h, y_hip_HR_h, x_m1_HR_h, y_m1_HR_h, x_knee_HR_h, ...
    y_knee_HR_h, x_m2_HR_h, y_m2_HR_h, x_ankle_HR_h, y_ankle_HR_h, ...
    x_m3_HR_h, y_m3_HR_h, x_foot_HR_h, y_foot_HR_h, x_F_HR_h, y_F_HR_h, ...
    x_G_HR_h, y_G_HR_h, x_H_HR_h, y_H_HR_h, x_E_HR_h, y_E_HR_h, ...
    x_D_HR_h, y_D_HR_h] = ...
    state_to_leg_coords_wrt_hip(thHR1-thb, thHR2-thb, thHR3-thb);

%-------------------------------------------------------------------------%
% FL Leg coordinates wrt a frame parallel to the body and fixed at the hip
%-------------------------------------------------------------------------%
[x_hip_FL_h, y_hip_FL_h, x_m1_FL_h, y_m1_FL_h, x_knee_FL_h, ...
    y_knee_FL_h, x_m2_FL_h, y_m2_FL_h, x_ankle_FL_h, y_ankle_FL_h, ...
    x_m3_FL_h, y_m3_FL_h, x_foot_FL_h, y_foot_FL_h, x_F_FL_h, y_F_FL_h, ...
    x_G_FL_h, y_G_FL_h, x_H_FL_h, y_H_FL_h, x_E_FL_h, y_E_FL_h, ...
    x_D_FL_h, y_D_FL_h] = ...
    state_to_leg_coords_wrt_hip(thFL1-thb, thFL2-thb, thFL3-thb);

%-------------------------------------------------------------------------%
% HL Leg coordinates wrt a frame parallel to the body and fixed at the hip
%-------------------------------------------------------------------------%
[x_hip_HL_h, y_hip_HL_h, x_m1_HL_h, y_m1_HL_h, x_knee_HL_h, ...
    y_knee_HL_h, x_m2_HL_h, y_m2_HL_h, x_ankle_HL_h, y_ankle_HL_h, ...
    x_m3_HL_h, y_m3_HL_h, x_foot_HL_h, y_foot_HL_h, x_F_HL_h, y_F_HL_h, ...
    x_G_HL_h, y_G_HL_h, x_H_HL_h, y_H_HL_h, x_E_HL_h, y_E_HL_h, ...
    x_D_HL_h, y_D_HL_h] = ...
    state_to_leg_coords_wrt_hip(thHL1-thb, thHL2-thb, thHL3-thb);

%-------------------------------------------------------------------------%
% Animation
%-------------------------------------------------------------------------%
for i = 1:step:n-1
    
    % HL leg
    subplot(2,2,1)
    
    % Plot base
    plot_base();
    
    % Plot workspace
    plot_workspace(l1, BC);
  
    % Plot desired wspace position
    plot(Toe_coords_des(i,7), Toe_coords_des(i,8),'go', ...
        'MarkerFaceColor','w','MarkerSize',8)
    plot(Toe_coords_des(:,7), Toe_coords_des(:,8),'color',[0.6 0.6 0.6])
    
    % Plot foot trace
    plot(x_foot_HL_h(1:i), y_foot_HL_h(1:i),'r');
    
    % Plot HL Leg
    leg_plot(0, 0, x_m1_HL_h(i), y_m1_HL_h(i), ...
        x_knee_HL_h(i),y_knee_HL_h(i), x_m2_HL_h(i), y_m2_HL_h(i), ...
        x_ankle_HL_h(i), y_ankle_HL_h(i), x_m3_HL_h(i), y_m3_HL_h(i), ...
        x_foot_HL_h(i), y_foot_HL_h(i), x_F_HL_h(i), y_F_HL_h(i), x_G_HL_h(i), ...
        y_G_HL_h(i), x_H_HL_h(i), y_H_HL_h(i), x_E_HL_h(i), y_E_HL_h(i), ...
        x_D_HL_h(i), y_D_HL_h(i), 2);
   
    % Show actuators mode (motoring-braking)
    if powerHL1(i) < 0
        plot(0, 0,'ro','MarkerSize',5, ...
            'MarkerFaceColor','r')
    end
    if powerHL2(i) < 0
        plot(x_knee_HL_h(i), y_knee_HL_h(i),'ro','MarkerSize',5, ...
            'MarkerFaceColor','r')
    end
    
    % Plot Force Vector
    force_scale = 600;
    quiver(x_foot_HL_h(i),y_foot_HL_h(i), FForces(i,4)/force_scale, ...
        NForces(i,4)/force_scale,'r')     
       
    % Print Time
    x_time = -0.6;
    y_time = 0.05;
    label = num2str(t(i));
    text(x_time, y_time, 'Time (s):', 'Color', 'k', 'FontSize', 11,...
        'fontWeight', 'normal');
    text(x_time, y_time - 0.08, label, 'Color', 'k', 'FontSize', 11);
    
    % Plot properties
    axis equal
    axis([-0.65 +0.65 -0.65 0.1])
    title('HL leg')
    drawnow
    hold off    
    
    % FL leg
    subplot(2,2,2)
    
    % Plot base
    plot_base();
    
    % Plot workspace
    plot_workspace(l1, BC);
  
    % Plot desired wspace position
    plot(Toe_coords_des(i,5), Toe_coords_des(i,6),'go', ...
        'MarkerFaceColor','w','MarkerSize',8)
    plot(Toe_coords_des(:,5), Toe_coords_des(:,6),'color',[0.6 0.6 0.6])
    
    % Plot foot trace
    plot(x_foot_FL_h(1:i), y_foot_FL_h(1:i),'r');
    
    % Plot FL Leg
    leg_plot(0, 0, x_m1_FL_h(i), y_m1_FL_h(i), ...
        x_knee_FL_h(i),y_knee_FL_h(i), x_m2_FL_h(i), y_m2_FL_h(i), ...
        x_ankle_FL_h(i), y_ankle_FL_h(i), x_m3_FL_h(i), y_m3_FL_h(i), ...
        x_foot_FL_h(i), y_foot_FL_h(i), x_F_FL_h(i), y_F_FL_h(i), x_G_FL_h(i), ...
        y_G_FL_h(i), x_H_FL_h(i), y_H_FL_h(i), x_E_FL_h(i), y_E_FL_h(i), ...
        x_D_FL_h(i), y_D_FL_h(i), 2);
   
    % Show actuators mode (motoring-braking)
    if powerFL1(i) < 0
        plot(0, 0,'ro','MarkerSize',5, ...
            'MarkerFaceColor','r')
    end
    if powerFL2(i) < 0
        plot(x_knee_FL_h(i), y_knee_FL_h(i),'ro','MarkerSize',5, ...
            'MarkerFaceColor','r')
    end
    
    % Plot Force Vector
    force_scale = 600;
    quiver(x_foot_FL_h(i),y_foot_FL_h(i), FForces(i,3)/force_scale, ...
        NForces(i,3)/force_scale,'r')     
       
    % Plot properties
    axis equal
    axis([-0.65 +0.65 -0.65 0.1])
    title('FL leg')
    drawnow
    hold off    
       
    % HR leg
    subplot(2,2,3)
    
    % Plot base
    plot_base();
    
    % Plot workspace
    plot_workspace(l1, BC);
  
    % Plot desired wspace position
    plot(Toe_coords_des(i,3), Toe_coords_des(i,4),'go', ...
        'MarkerFaceColor','w','MarkerSize',8)
    plot(Toe_coords_des(:,3), Toe_coords_des(:,4),'color',[0.6 0.6 0.6])

    % Plot foot trace
    plot(x_foot_HR_h(1:i), y_foot_HR_h(1:i),'r');
    
    % Plot HR Leg
    leg_plot(0, 0, x_m1_HR_h(i), y_m1_HR_h(i), ...
        x_knee_HR_h(i),y_knee_HR_h(i), x_m2_HR_h(i), y_m2_HR_h(i), ...
        x_ankle_HR_h(i), y_ankle_HR_h(i), x_m3_HR_h(i), y_m3_HR_h(i), ...
        x_foot_HR_h(i), y_foot_HR_h(i), x_F_HR_h(i), y_F_HR_h(i), x_G_HR_h(i), ...
        y_G_HR_h(i), x_H_HR_h(i), y_H_HR_h(i), x_E_HR_h(i), y_E_HR_h(i), ...
        x_D_HR_h(i), y_D_HR_h(i), 2);
   
    % Show actuators mode (motoring-braking)
    if powerHR1(i) < 0
        plot(0, 0,'ro','MarkerSize',5, ...
            'MarkerFaceColor','r')
    end
    if powerHR2(i) < 0
        plot(x_knee_HR_h(i), y_knee_HR_h(i),'ro','MarkerSize',5, ...
            'MarkerFaceColor','r')
    end
    
    % Plot Force Vector
    force_scale = 600;
    quiver(x_foot_HR_h(i),y_foot_HR_h(i), FForces(i,2)/force_scale, ...
        NForces(i,2)/force_scale,'r')     
        
    % Plot properties
    axis equal
    axis([-0.65 +0.65 -0.65 0.1])
    title('HR leg')
    drawnow
    hold off    
        
    % FR leg
    subplot(2,2,4)
    
    % Plot base
    plot_base();
    
    % Plot workspace
    plot_workspace(l1, BC);
  
    % Plot desired wspace position
    plot(Toe_coords_des(i,1), Toe_coords_des(i,2),'go', ...
        'MarkerFaceColor','w','MarkerSize',8)
    plot(Toe_coords_des(:,1), Toe_coords_des(:,2),'color',[0.6 0.6 0.6])

    % Plot foot trace
    plot(x_foot_FR_h(1:i), y_foot_FR_h(1:i),'r');
    
    % Plot FR Leg
    leg_plot(0, 0, x_m1_FR_h(i), y_m1_FR_h(i), ...
        x_knee_FR_h(i),y_knee_FR_h(i), x_m2_FR_h(i), y_m2_FR_h(i), ...
        x_ankle_FR_h(i), y_ankle_FR_h(i), x_m3_FR_h(i), y_m3_FR_h(i), ...
        x_foot_FR_h(i), y_foot_FR_h(i), x_F_FR_h(i), y_F_FR_h(i), x_G_FR_h(i), ...
        y_G_FR_h(i), x_H_FR_h(i), y_H_FR_h(i), x_E_FR_h(i), y_E_FR_h(i), ...
        x_D_FR_h(i), y_D_FR_h(i), 2);
   
    % Show actuators mode (motoring-braking)
    if powerFR1(i) < 0
        plot(0, 0,'ro','MarkerSize',5, ...
            'MarkerFaceColor','r')
    end
    if powerFR2(i) < 0
        plot(x_knee_FR_h(i), y_knee_FR_h(i),'ro','MarkerSize',5, ...
            'MarkerFaceColor','r')
    end
    
    % Plot Force Vector
    force_scale = 600;
    quiver(x_foot_FR_h(i),y_foot_FR_h(i), FForces(i,1)/force_scale, ...
        NForces(i,1)/force_scale,'r')     
        
    % Plot properties
    axis equal
    axis([-0.65 +0.65 -0.65 0.1])
    title('FR leg')
    drawnow
    hold off    
    
end

close