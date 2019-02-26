%-------------------------------------------------------------------------%
% Phase portrait y-ydot
%-------------------------------------------------------------------------%

figure('units','normalized','outerposition',...
    [0.1 0.1 0.8 0.8],'Name','Phase Portraits')
set(gcf,'color','white')
clf;

% Phase Portrait through Time
subplot(1,3,1)
plot3(x(:,5),x(:,6),t,'LineWidth',1)
ylabel('thdot (rad/s)') 
xlabel('th (rad)')  
zlabel('t(s)')
title('Phase Portraits through Time')
grid on
axis square

% Phase Portrait 
subplot(1,3,2)
hold all
plot(x(:,5),x(:,6),'LineWidth',1)
ylabel('thdot (rad/s)') 
xlabel('th (rad)')
title('Phase Portrait')
grid on
axis square
box on

% Poincare Map
subplot(1,3,3)
%findpeaks(x(:,3))
[pks_y,locs_y] = findpeaks(x(:,3));
plot(x(locs_y,5),x(locs_y,6),'.','LineWidth',1)

ylabel('thdot (rad/s)') 
xlabel('th (rad)') 
title('Poincare Map')
grid minor
%axis([0.45 0.6 -0.5 0.5])
axis square
box on



