function leg_plot(x_hip, y_hip, x_m1, y_m1, x_knee, y_knee, x_m2, y_m2, ...
        x_ankle, y_ankle, x_m3, y_m3, x_foot, y_foot, ...
        x_F, y_F, x_G, y_G, x_H, y_H, x_E, y_E, x_D, y_D, leg_id)
    
    % Choose color depending on the leg
    % Right leg: leg_id = 1
    % Left leg:  leg_id = 2
    if (leg_id == 1) 
        col = [0.8,0.8,0.8];
    elseif (leg_id == 2)
        col = [0.1, 0.1, 0.1];
    end
    
    % Plot segments   
    plot([x_hip x_knee],[y_hip y_knee],'Color',col,'LineWidth',5)
    plot([x_knee x_ankle],[y_knee y_ankle],'Color',col,'LineWidth',5)
    plot([x_ankle x_foot],[y_ankle y_foot],'Color',col,'LineWidth',5)
    plot([x_F x_G],[y_F y_G],'Color',col,'LineWidth',5)
    plot([x_H x_ankle],[y_H y_ankle],'Color',col,'LineWidth',5)
    plot([x_H x_G],[y_H y_G],'Color',col,'LineWidth',2)
    plot([x_knee x_E],[y_knee y_E],'Color',col,'LineWidth',5)
    plot([x_hip x_D],[y_hip y_D],'Color',col,'LineWidth',5)
    plot([x_D x_E],[y_D y_E],'Color',col,'LineWidth',2)
    
    % Plot joints
    plot(x_hip, y_hip,'o','Color',col,'MarkerFaceColor','w',...
        'MarkerSize',8)
    plot(x_knee,y_knee,'o','Color',col,'MarkerFaceColor','w',...
        'MarkerSize',8)    
    plot(x_foot,y_foot,'o','Color',col,'MarkerFaceColor',col,...
        'MarkerSize',6)  
    plot(x_ankle,y_ankle,'o','Color',col,'MarkerFaceColor','w',...
        'MarkerSize',8)
    plot(x_H,y_H,'o','Color',col,'MarkerFaceColor','w','MarkerSize',8)
    plot(x_G,y_G,'o','Color',col,'MarkerFaceColor','w','MarkerSize',8)
    plot(x_E,y_E,'o','Color',col,'MarkerFaceColor','w','MarkerSize',8)
    plot(x_D,y_D,'o','Color',col,'MarkerFaceColor','w','MarkerSize',8)
    
    % Plot CoMs
    plot_com(x_m1,y_m1,0.01);
    plot_com(x_m2,y_m2,0.01);
    plot_com(x_m3,y_m3,0.01);
%     plot(x_m1,y_m1,'o','Color', col,'MarkerFaceColor','w')
%     plot(x_m1,y_m1,'+','Color', col)
%     plot(x_m2,y_m2,'o','Color', col,'MarkerFaceColor','w')
%     plot(x_m2,y_m2,'+','Color', col)
%     plot(x_m3,y_m3,'o','Color', col,'MarkerFaceColor','w')
%     plot(x_m3,y_m3,'+','Color', col)
    