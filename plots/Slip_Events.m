%-------------------------------------------------------------------------%
% These figures show when the feet slipped
%-------------------------------------------------------------------------%

figure('units','normalized','outerposition',[0.1 0.1 0.8 0.8])
set(gcf,'color','white')
clf;

% Slip FR
subplot(2,2,1)
plot(t,Slip_events(:,1),'o-')
ylabel('Slip FR') 
xlabel('t (s)') 
title('Slip FR')
grid on

% Slip HR
subplot(2,2,2)
plot(t,Slip_events(:,2),'o-')
ylabel('Slip HR') 
xlabel('t (s)') 
title('Slip HR')
grid on

% Slip FL
subplot(2,2,3)
plot(t,Slip_events(:,3),'o-')
ylabel('Slip FL') 
xlabel('t (s)') 
title('Slip FL')
grid on

% Slip HL
subplot(2,2,4)
plot(t,Slip_events(:,4),'o-')
ylabel('Slip HL') 
xlabel('t (s)') 
title('Slip HL')
grid on
