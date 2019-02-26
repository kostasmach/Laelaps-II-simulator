%-------------------------------------------------------------------------%
% Fore Right Toe Trajectory
%-------------------------------------------------------------------------%

% Size of data
n = size(xoutE,1);

%-------------------------------------------------------------------------%
% Put data in vectors
%-------------------------------------------------------------------------%
xb = xoutE(:,1);
yb = xoutE(:,3);
thb = xoutE(:,5);
thFR1 = xoutE(:,7);
thFR2 = xoutE(:,9);
thFR3 = xoutE(:,11);
thHR1 = xoutE(:,13);
thHR2 = xoutE(:,15);
thHR3 = xoutE(:,17);
thFL1 = xoutE(:,19);
thFL2 = xoutE(:,21);
thFL3 = xoutE(:,23);
thHL1 = xoutE(:,25);
thHL2 = xoutE(:,27);
thHL3 = xoutE(:,29);
thT = xoutE(:,31);

%-------------------------------------------------------------------------%
% Fore Right leg coordinates
%-------------------------------------------------------------------------%
xForeRightHip=xb+db.*cos(thb);
yForeRightHip=yb+db.*sin(thb);
xForeRightKnee=xb+db.*cos(thb)+2.*dF1.*sin(thFR1);
yForeRightKnee=yb+(-2).*dF1.*cos(thFR1)+db.*sin(thb);
xForeRightAnkle=xb+db.*cos(thb)+2.*dF1.*sin(thFR1)+2.*dF2.*sin(thFR2);
yForeRightAnkle=yb+(-2).*dF1.*cos(thFR1)+(-2).*dF2.*cos(thFR2)+db.*sin(thb); ...
% xForeRightFoot=xb+db.*cos(thb)+2.*dF1.*sin(thFR1)+2.*dF2.*sin(thFR2)+2.* ...
%   dF3.*sin(thFR3);
% yForeRightFoot=yb+(-2).*dF1.*cos(thFR1)+(-2).*dF2.*cos(thFR2)+(-2).*dF3.* ...
%   cos(thFR3)+db.*sin(thb);
xForeRightFoot=+2.*dF1.*sin(thFR1)+2.*dF2.*sin(thFR2)+2.* ...
  dF3.*sin(thFR3);
yForeRightFoot=(-2).*dF1.*cos(thFR1)+(-2).*dF2.*cos(thFR2)+(-2).*dF3.* ...
  cos(thFR3);

%-------------------------------------------------------------------------%
% Hind Right leg coordinates
%-------------------------------------------------------------------------%
xHindRightHip=xb+(-1).*db.*cos(thb);
yHindRightHip=yb+(-1).*db.*sin(thb);
xHindRightKnee=xb+(-1).*db.*cos(thb)+2.*dH1.*sin(thHR1);
yHindRightKnee=yb+(-2).*dH1.*cos(thHR1)+(-1).*db.*sin(thb);
xHindRightAnkle=xb+(-1).*db.*cos(thb)+2.*dH1.*sin(thHR1)+2.*dH2.*sin(thHR2); ...
yHindRightAnkle=yb+(-2).*dH1.*cos(thHR1)+(-2).*dH2.*cos(thHR2)+(-1).*db.* ...
  sin(thb);
% xHindRightFoot=xb+(-1).*db.*cos(thb)+2.*dH1.*sin(thHR1)+2.*dH2.*sin(thHR2)+ ...
%   2.*dH3.*sin(thHR3);
% yHindRightFoot=yb+(-2).*dH1.*cos(thHR1)+(-2).*dH2.*cos(thHR2)+(-2).*dH3.* ...
%   cos(thHR3)+(-1).*db.*sin(thb);
xHindRightFoot=+2.*dH1.*sin(thHR1)+2.*dH2.*sin(thHR2)+ ...
  2.*dH3.*sin(thHR3);
yHindRightFoot=(-2).*dH1.*cos(thHR1)+(-2).*dH2.*cos(thHR2)+(-2).*dH3.* ...
  cos(thHR3);

%-------------------------------------------------------------------------%
% Fore Left leg coordinates
%-------------------------------------------------------------------------%
xForeLeftHip=xb+db.*cos(thb);
yForeLeftHip=yb+db.*sin(thb);
xForeLeftKnee=xb+db.*cos(thb)+2.*dF1.*sin(thFL1);
yForeLeftKnee=yb+(-2).*dF1.*cos(thFL1)+db.*sin(thb);
xForeLeftAnkle=xb+db.*cos(thb)+2.*dF1.*sin(thFL1)+2.*dF2.*sin(thFL2);
yForeLeftAnkle=yb+(-2).*dF1.*cos(thFL1)+(-2).*dF2.*cos(thFL2)+db.*sin(thb); ...
% xForeLeftFoot=xb+db.*cos(thb)+2.*dF1.*sin(thFL1)+2.*dF2.*sin(thFL2)+2.* ...
%   dF3.*sin(thFL3);
% yForeLeftFoot=yb+(-2).*dF1.*cos(thFL1)+(-2).*dF2.*cos(thFL2)+(-2).*dF3.* ...
%   cos(thFL3)+db.*sin(thb);
xForeLeftFoot=+2.*dF1.*sin(thFL1)+2.*dF2.*sin(thFL2)+2.* ...
  dF3.*sin(thFL3);
yForeLeftFoot=(-2).*dF1.*cos(thFL1)+(-2).*dF2.*cos(thFL2)+(-2).*dF3.* ...
  cos(thFL3);

%-------------------------------------------------------------------------%
% Hind Left leg coordinates
%-------------------------------------------------------------------------%
xHindLeftHip=xb+(-1).*db.*cos(thb);
yHindLeftHip=yb+(-1).*db.*sin(thb);
xHindLeftKnee=xb+(-1).*db.*cos(thb)+2.*dH1.*sin(thHL1);
yHindLeftKnee=yb+(-2).*dH1.*cos(thHL1)+(-1).*db.*sin(thb);
xHindLeftAnkle=xb+(-1).*db.*cos(thb)+2.*dH1.*sin(thHL1)+2.*dH2.*sin(thHL2); ...
yHindLeftAnkle=yb+(-2).*dH1.*cos(thHL1)+(-2).*dH2.*cos(thHL2)+(-1).*db.* ...
  sin(thb);
% xHindLeftFoot=xb+(-1).*db.*cos(thb)+2.*dH1.*sin(thHL1)+2.*dH2.*sin(thHL2)+ ...
%   2.*dH3.*sin(thHL3);
% yHindLeftFoot=yb+(-2).*dH1.*cos(thHL1)+(-2).*dH2.*cos(thHL2)+(-2).*dH3.* ...
%   cos(thHL3)+(-1).*db.*sin(thb);
xHindLeftFoot= +2.*dH1.*sin(thHL1)+2.*dH2.*sin(thHL2)+ ...
  2.*dH3.*sin(thHL3);
yHindLeftFoot=(-2).*dH1.*cos(thHL1)+(-2).*dH2.*cos(thHL2)+(-2).*dH3.* ...
  cos(thHL3);


%-------------------------------------------------------------------------%


f20 = figure(20);
set(f20, 'Position', [100, 100, 1049, 895]);
clf(f20);

hold all

%plot(xForeRightFoot(10000:end), yForeRightFoot(10000:end),'k')
plot(xForeRightFoot(:), yForeRightFoot(:))

plot(xdes_FR, ydes_FR)

hold off
ylabel('y (m)') 
xlabel('x (m)') 
title('FR Toe-Trajectory')
grid on