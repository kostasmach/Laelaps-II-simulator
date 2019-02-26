%-------------------------------------------------------------------------%
% Ground Forces
%-------------------------------------------------------------------------%

figure('units','normalized','outerposition',...
    [0.1 0.1 0.8 0.8],'Name','Ground Forces')
set(gcf,'color','white')
clf;

% Normal Forces (N) - t (s)
subplot(2,2,1)
hold all
plot(t,NForces(:,1),'LineWidth',1)
plot(t,NForces(:,2),'LineWidth',1)
plot(t,NForces(:,3),'LineWidth',1)
plot(t,NForces(:,4),'LineWidth',1)
hold off
ylabel('Normal Forces (N)') 
xlabel('t (s)') 
title('Normal Force (N) - t (s)')
legend('FR','HR','FL','HL')
grid on
box on

% Normal Forces Sum
subplot(2,2,2)
plot(t,NForces(:,1) + NForces(:,2) + NForces(:,3) ...
    + NForces(:,4),'LineWidth',1)
ylabel('Normal Forces Sum (N)') 
xlabel('t (s)') 
title('Normal Forces Sum (N) - t (s)')
grid on
box on

% Frictional Forces (N) - t (s)
subplot(2,2,3)
hold all
plot(t,FForces(:,1),'LineWidth',1)
plot(t,FForces(:,2),'LineWidth',1)
plot(t,FForces(:,3),'LineWidth',1)
plot(t,FForces(:,4),'LineWidth',1)
hold off
ylabel('Frictional Forces (N)') 
xlabel('t (s)') 
title('Frictional Force (N) - t (s)')
legend('FR','HR','FL','HL')
grid on
box on

% Frictional Forces Sum
subplot(2,2,4)
plot(t,FForces(:,1) + FForces(:,2) + FForces(:,3) ...
    + FForces(:,4),'LineWidth',1)
ylabel('Frictional Forces Sum (N)') 
xlabel('t (s)') 
title('Frictional Forces Sum (N) - t (s)')
grid on
box on
 
