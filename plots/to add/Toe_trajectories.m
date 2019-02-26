f3 = figure(3);
set(f3, 'Position', [100, 100, 1049, 895]);
clf(f3);


%-------------------------------------------------------------------------%
% Fore Right Toe Trajectory
%-------------------------------------------------------------------------%
subplot(2,2,2)
hold all
st_elements = find(Stance_events(:,1)==1); 
fl_elements = find(Stance_events(:,1)==0); 
plot(Toe_coords_hip(st_elements,1), Toe_coords_hip(st_elements,2),'.','MarkerSize',1);
plot(Toe_coords_hip(fl_elements,1), Toe_coords_hip(fl_elements,2),'.','MarkerSize',1);
plot(Toe_coords_des(:,1), Toe_coords_des(:,2),'.','MarkerSize',1);
hold off
ylabel('y (m)') 
xlabel('x (m)') 
title('FR Toe-Trajectory')
grid on

%-------------------------------------------------------------------------%
% Hind Right Toe Trajectory
%-------------------------------------------------------------------------%
subplot(2,2,4)
hold all
st_elements = find(Stance_events(:,2)==1); 
fl_elements = find(Stance_events(:,2)==0); 
plot(Toe_coords_hip(st_elements,3), Toe_coords_hip(st_elements,4),'.','MarkerSize',1);
plot(Toe_coords_hip(fl_elements,3), Toe_coords_hip(fl_elements,4),'.','MarkerSize',1);
plot(Toe_coords_des(:,3), Toe_coords_des(:,4),'.','MarkerSize',1);
hold off
ylabel('y (m)') 
xlabel('x (m)') 
title('HR Toe-Trajectory')
grid on

%-------------------------------------------------------------------------%
% Fore Left Toe Trajectory
%-------------------------------------------------------------------------%
subplot(2,2,1)
hold all
st_elements = find(Stance_events(:,3)==1); 
fl_elements = find(Stance_events(:,3)==0); 
plot(Toe_coords_hip(st_elements,5), Toe_coords_hip(st_elements,6),'.','MarkerSize',1);
plot(Toe_coords_hip(fl_elements,5), Toe_coords_hip(fl_elements,6),'.','MarkerSize',1);
plot(Toe_coords_des(:,5), Toe_coords_des(:,6),'.','MarkerSize',1);
hold off
ylabel('y (m)') 
xlabel('x (m)') 
title('FL Toe-Trajectory')
grid on

%-------------------------------------------------------------------------%
% Hind Left Toe Trajectory
%-------------------------------------------------------------------------%
subplot(2,2,3)
hold all
st_elements = find(Stance_events(:,4)==1); 
fl_elements = find(Stance_events(:,4)==0); 
plot(Toe_coords_hip(st_elements,7), Toe_coords_hip(st_elements,8),'.','MarkerSize',1);
plot(Toe_coords_hip(fl_elements,7), Toe_coords_hip(fl_elements,8),'.','MarkerSize',1);
plot(Toe_coords_des(:,7), Toe_coords_des(:,8),'.','MarkerSize',1);
hold off
ylabel('y (m)') 
xlabel('x (m)') 
title('HL Toe-Trajectory')
grid on