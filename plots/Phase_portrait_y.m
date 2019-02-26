%-------------------------------------------------------------------------%
% Phase portrait y-ydot
%-------------------------------------------------------------------------%

figure('units','normalized','outerposition',...
    [0.1 0.1 0.8 0.8], 'Name','Phase Portraits')
set(gcf,'color','white')
clf;

% Phase Portrait through Time
subplot(1,3,1)
plot3(x(:,3),x(:,4),t,'LineWidth',1)
ylabel('ydot (m/s)') 
xlabel('y (m)') 
zlabel('t(s)')
title('Phase Portraits through Time')
grid on
axis square

% Phase Portrait 
subplot(1,3,2)
hold all
plot(x(:,3),x(:,4),'LineWidth',1)
% plot arrows
% xout3_grad = gradient(x(:,3));
% xout4_grad = gradient(x(:,4));
% arrows_dist = 100;
% quiver(x(1:arrows_dist:end,3),x(1:arrows_dist:end,4),...
%     xout3_grad(1:arrows_dist:end),xout4_grad(1:arrows_dist:end))
ylabel('ydot (m/s)') 
xlabel('y (m)') 
title('Phase Portrait')
grid on
axis square
box on

% Poincare Map
subplot(1,3,3)
%findpeaks(x(:,3))
[pks_y,locs_y] = findpeaks(x(:,3));
plot(x(locs_y,3),x(locs_y,4),'.','LineWidth',1)

%plot(x(:,3),x(:,4))
ylabel('ydot (m/s)') 
xlabel('y (m)') 
title('Poincare Map')
grid minor
axis([0.45 0.6 -0.5 0.5])
axis square
box on

% % Cobweb Construction 
% subplot(2,2,4)
% %plot(x(:,3),x(:,4))
% ylabel('ydot (m/s)') 
% xlabel('y (m)') 
% title('Cobweb Construction')
% grid on
% %axis square

