function tau = ankle_torque(phi3, phi3dot)

global ankle_stop_angle_1 ankle_stop_angle_2 k_ankle tau_preload phi3eq 
global k_stop b_stop

%-------------------------------------------------------------------------%
% Relative angle and ang. rate for 3rd segment w.r.t. the 2nd segment
%-------------------------------------------------------------------------%
% phi3 = th3 - th2;
% phi3dot = th3dot - th2dot;

%-------------------------------------------------------------------------%
% Ankle spring torque
%-------------------------------------------------------------------------%
% Enable spring only if it is not in touch with the mechanicla stop
if phi3 > phi3eq 
    tau_spring =  - tau_preload - k_ankle * (phi3 - phi3eq);
else
    tau_spring =  - tau_preload; % this could be 0 but helps stabilizing
end

%-------------------------------------------------------------------------%
% Torque from mechanical stops (Hunt Crossley model)
%-------------------------------------------------------------------------%
if phi3 < (ankle_stop_angle_1)
    delta_phi = ankle_stop_angle_1 - phi3;
    phi_dot = phi3dot;
    tau_stop = k_stop * delta_phi^1.5 - b_stop * phi_dot * delta_phi^1.5;
elseif phi3 > (ankle_stop_angle_2)
    delta_phi = -(ankle_stop_angle_2 - phi3);
    phi_dot = -phi3dot;
    tau_stop = -(k_stop * delta_phi^1.5 - b_stop * phi_dot * delta_phi^1.5);
else
    tau_stop = 0;
end

%-------------------------------------------------------------------------%
% Total torque
%-------------------------------------------------------------------------%
tau = tau_spring + tau_stop;

end