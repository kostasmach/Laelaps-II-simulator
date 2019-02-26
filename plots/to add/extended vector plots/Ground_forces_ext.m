%-------------------------------------------------------------------------%
% Ground Forces (extended vectors)
%-------------------------------------------------------------------------%

f3 = figure(3);
set(f3, 'Position', [100, 100, 1049, 895]);
clf(f3);


% Normal Force (N) - t (s)
subplot(2,2,1)
plot(toutE,NForcesE(:,1),'LineWidth',1)
hold all
plot(toutE,NForcesE(:,2),'LineWidth',1)
plot(toutE,NForcesE(:,3),'LineWidth',1)
plot(toutE,NForcesE(:,4),'LineWidth',1)
hold off
ylabel('Normal Force (N)') 
xlabel('t (s)') 
title('Normal Force (N) - t (s)')
%axis([0 max(toutE) -300 300])
grid on
legend('FR','HR','FL','HL')

% Normal Forces Sum
subplot(2,2,2)
plot(toutE,NForcesE(:,1) + NForcesE(:,2) + NForcesE(:,3) ...
    + NForcesE(:,4),'LineWidth',1)
ylabel('Normal Forces Sum (N)') 
xlabel('t (s)') 
title('Normal Forces Sum (N) - t (s)')
%axis([0 max(toutE) -300 300])
grid on


% Frictional Force (N) - t (s)
subplot(2,2,3)
plot(toutE,FForcesE(:,1),'LineWidth',1)
hold all
plot(toutE,FForcesE(:,2),'LineWidth',1)
plot(toutE,FForcesE(:,3),'LineWidth',1)
plot(toutE,FForcesE(:,4),'LineWidth',1)
hold off
ylabel('Frictional Force (N)') 
xlabel('t (s)') 
title('Frictional Force (N) - t (s)')
%axis([0 max(toutE) -300 300])
grid on
legend('FR','HR','FL','HL')

% Frictional Forces Sum
subplot(2,2,4)
plot(toutE,FForcesE(:,1) + FForcesE(:,2) + FForcesE(:,3) ...
    + FForcesE(:,4),'LineWidth',1)
ylabel('Frictional Forces Sum (N)') 
xlabel('t (s)') 
title('Frictional Forces Sum (N) - t (s)')
%axis([0 max(toutE) -300 300])
grid on

 
