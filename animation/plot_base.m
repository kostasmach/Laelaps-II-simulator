function plot_base()

dd1 = 0.2;
dd2 = 0.07;
v1 = [-dd1 , dd2];  % up left corner
v2 = [dd1 , dd2];   % up right corner
v3 = [dd1 , 0];  % down right corner
v4 = [-dd1 , 0]; % down left corner
abcissas = [v1(1) v2(1) v3(1) v4(1)];
ordinates = [v1(2) v2(2) v3(2) v4(2)];
fill(abcissas, ordinates, [0.9 0.9 0.9],'EdgeColor','none');
hold on
plot([-0.2 0.2],[0 0],'color', [0.8 0.8 0.8])