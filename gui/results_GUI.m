
%-------------------------------------------------------------------------%
% Figure size
%-------------------------------------------------------------------------%
% figure('Position',[0.1 0.1 0.8 0.8]);
figure('units','normalized','outerposition', ...
    [0.3 0.2 0.3 0.6],'Name','Results GUI')
set(gcf,'color','white')

%-------------------------------------------------------------------------%
% First column button positions
%-------------------------------------------------------------------------%
col1.button_x = 80;
col1.button_y = 400;
col1.height_step = 35;
col1.button_size_x = 150;
col1.button_size_y = 30;

%-------------------------------------------------------------------------%
% Second column button positions
%-------------------------------------------------------------------------%
col2.button_x = 320;
col2.button_y = 400;
col2.height_step = 35;
col2.button_size_x = 150;
col2.button_size_y = 30;

%-------------------------------------------------------------------------%
% First column text
%-------------------------------------------------------------------------%
col1.text_pos_x = col1.button_x + 25;
col1.text_pos_y = col1.button_y - 20;

A = uicontrol('Style','Text','String', 'Animations',...
    'Position',[col1.text_pos_x col1.text_pos_y 100 100],...
    'FontSize',12);
set(A,'backgroundcolor',get(gcf,'color'))

%-------------------------------------------------------------------------%
% Second column text
%-------------------------------------------------------------------------%
col2.text_pos_x = col2.button_x + 25;
col2.text_pos_y = col2.button_y - 20;

B = uicontrol('Style','Text','String','Plots',...
    'Position',[col2.text_pos_x col2.text_pos_y 100 100],...
    'FontSize',12);
set(B,'backgroundcolor',get(gcf,'color'))

%-------------------------------------------------------------------------%
% First column buttons
%-------------------------------------------------------------------------%
uicontrol('Style', 'pushbutton', 'String', 'Single leg animation',...
    'Position', [col1.button_x col1.button_y col1.button_size_x ...
    col1.button_size_y], 'Callback', 'animation_single_leg');
col1.button_y = col1.button_y - col1.height_step;

uicontrol('Style', 'pushbutton', 'String', 'Single leg animation regen',...
    'Position', [col1.button_x col1.button_y col1.button_size_x ...
    col1.button_size_y], 'Callback', 'animation_single_leg_regen');
col1.button_y = col1.button_y - col1.height_step;

uicontrol('Style', 'pushbutton', 'String', 'Quadruped animation',...
    'Position', [col1.button_x col1.button_y col1.button_size_x ...
    col1.button_size_y], 'Callback', 'animation');
col1.button_y = col1.button_y - col1.height_step;

uicontrol('Style', 'pushbutton', 'String', 'Quadruped animation regen',...
    'Position', [col1.button_x col1.button_y col1.button_size_x ...
    col1.button_size_y], 'Callback', 'animation_regen');
col1.button_y = col1.button_y - col1.height_step;

uicontrol('Style', 'pushbutton', 'String', 'Quadruped fixed world',...
    'Position', [col1.button_x col1.button_y col1.button_size_x ...
    col1.button_size_y], 'Callback', 'animation_regen_fixed_world');
col1.button_y = col1.button_y - col1.height_step;


%-------------------------------------------------------------------------%
% Second column buttons
%-------------------------------------------------------------------------%
uicontrol('Style', 'pushbutton', 'String', 'Body Data',...
    'Position', [col2.button_x col2.button_y col2.button_size_x, ...
    col2.button_size_y], 'Callback', 'Body_data');
col2.button_y = col2.button_y - col2.height_step;

uicontrol('Style', 'pushbutton', 'String', 'Gait graph',...
    'Position', [col2.button_x col2.button_y col2.button_size_x, ...
    col2.button_size_y], 'Callback', 'Gait_graph');
col2.button_y = col2.button_y - col2.height_step;

uicontrol('Style', 'pushbutton', 'String', 'Ground forces',...
    'Position', [col2.button_x col2.button_y col2.button_size_x, ...
    col2.button_size_y], 'Callback', 'Ground_forces');
col2.button_y = col2.button_y - col2.height_step;

uicontrol('Style', 'pushbutton', 'String', 'Leg data FL',...
    'Position', [col2.button_x col2.button_y col2.button_size_x, ...
    col2.button_size_y], 'Callback', 'Leg_data_FL');
col2.button_y = col2.button_y - col2.height_step;

uicontrol('Style', 'pushbutton', 'String', 'Leg data FR',...
    'Position', [col2.button_x col2.button_y col2.button_size_x, ...
    col2.button_size_y], 'Callback', 'Leg_data_FR');
col2.button_y = col2.button_y - col2.height_step;

uicontrol('Style', 'pushbutton', 'String', 'Leg data HL',...
    'Position', [col2.button_x col2.button_y col2.button_size_x, ...
    col2.button_size_y], 'Callback', 'Leg_data_HL');
col2.button_y = col2.button_y - col2.height_step;

uicontrol('Style', 'pushbutton', 'String', 'Leg data HR',...
    'Position', [col2.button_x col2.button_y col2.button_size_x, ...
    col2.button_size_y], 'Callback', 'Leg_data_HR');
col2.button_y = col2.button_y - col2.height_step;

uicontrol('Style', 'pushbutton', 'String', 'Phase portrait thb',...
    'Position', [col2.button_x col2.button_y col2.button_size_x, ...
    col2.button_size_y], 'Callback', 'Phase_portrait_thb');
col2.button_y = col2.button_y - col2.height_step;

uicontrol('Style', 'pushbutton', 'String', 'Phase portrait y',...
    'Position', [col2.button_x col2.button_y col2.button_size_x, ...
    col2.button_size_y], 'Callback', 'Phase_portrait_y');
col2.button_y = col2.button_y - col2.height_step;

uicontrol('Style', 'pushbutton', 'String', 'Slip Events',...
    'Position', [col2.button_x col2.button_y col2.button_size_x, ...
    col2.button_size_y], 'Callback', 'Slip_Events');
col2.button_y = col2.button_y - col2.height_step;
