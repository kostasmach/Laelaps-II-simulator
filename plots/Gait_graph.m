%-------------------------------------------------------------------------%
% Gait Graphs
%-------------------------------------------------------------------------%

figure('units','normalized','outerposition',[0.25 0.3 0.5 0.4], 'Name', ...
    'Gait Graph')
set(gcf,'color','white')
clf;

% FR
subplot(4,1,1)
hold all
area(t,[Stance_events(:,1)],'FaceColor',[0.3 0.3 0.3],'LineStyle','no')
hold off
ylabel('FR') 
set(gca, 'xtick', [], 'ytick', []) ;
axis([0 t(end) 0 1]);
box on

% HR
subplot(4,1,2)
area(t,[Stance_events(:,2)],'FaceColor',[0.3 0.3 0.3],'LineStyle','no')
ylabel('HR') 
set(gca, 'xtick', [], 'ytick', []) ;
axis([0 t(end) 0 1]);

% FL
subplot(4,1,3)
area(t,[Stance_events(:,3)],'FaceColor',[0.3 0.3 0.3],'LineStyle','no')
ylabel('FL') 
set(gca, 'xtick', [], 'ytick', []) ;
axis([0 t(end) 0 1]);

% HL
subplot(4,1,4)
area(t,[Stance_events(:,4)],'FaceColor',[0.3 0.3 0.3],'LineStyle','no')
ylabel('HL')
% set(gca, 'xtick', [], 'ytick', []) ;
set(gca, 'ytick', []) ;

xlabel('t (s)') 
axis([0 t(end) 0 1]);


%-------------------------------------------------------------------------%
% Alternative
%-------------------------------------------------------------------------%
% f5 = figure(5);
% set(f5, 'Position', [100, 100, 1100, 150]);
% clf(f5);
% 
% plot(t,4*Stance_events(:,1),'ks','markers',1)
% hold all
% plot(t,3*Stance_events(:,2),'ks','markers',1)
% plot(t,2*Stance_events(:,3),'ks','markers',1)
% plot(t,Stance_events(:,4),'ks','markers',1)
% hold off
% set(gca,'YTickLabel',[]);
% ylabel('HL  FL  HR  FR') 
% xlabel('t (s)') 
% %title('FR')
% % grid on
% axis([0 t(end) 0.5 4.5]);
