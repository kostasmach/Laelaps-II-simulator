function [NFR, FFR, NHR, FHR, NFL, FFL, NHL, FHL, ...
    slipFR, slipHR, slipFL, slipHL] = ground_forces( ...
    yFRf, yHRf, yFLf, yHLf, xFRf, xHRf, xFLf, xHLf, ...
    xFRfdot, yFRfdot, xHRfdot, yHRfdot, ...
    xFLfdot, yFLfdot, xHLfdot, yHLfdot)

global k_ground b_ground
global mu_d mu_s slip_error friction_velocity

%-------------------------------------------------------------------------%
% Normal forces from the ground
%-------------------------------------------------------------------------%
% Fore Right foot
%-------------------------------------------------------------------------%
% Flight phase
if yFRf > ground_height(xFRf) 
    NFR = 0;
% Stance phase
else 
    delta_y_FRf = ground_height(xFRf) - yFRf;
    NFR = k_ground*abs(delta_y_FRf)^1.5 - ...
        b_ground*yFRfdot*abs(delta_y_FRf)^1.5;
end

%-------------------------------------------------------------------------%
% Hind Right foot
%-------------------------------------------------------------------------%
% Flight phase
if yHRf > ground_height(xHRf) 
    NHR = 0;
% Stance phase
else 
    delta_y_HRf = ground_height(xHRf) - yHRf;
    NHR = k_ground*abs(delta_y_HRf)^1.5 - ...
        b_ground*yHRfdot*abs(delta_y_HRf)^1.5;
end

%-------------------------------------------------------------------------%
% Fore Left foot
%-------------------------------------------------------------------------%
% Flight phase
if yFLf > ground_height(xFLf) 
    NFL = 0;
% Stance phase
else 
    delta_y_FLf = ground_height(xFLf) - yFLf;
    NFL = k_ground*abs(delta_y_FLf)^1.5 - ...
        b_ground*yFLfdot*abs(delta_y_FLf)^1.5;
end

%-------------------------------------------------------------------------%
% Hind Left foot
%-------------------------------------------------------------------------%
% Flight phase
if yHLf > ground_height(xHLf) 
    NHL = 0;
% Stance phase
else 
    delta_y_HLf = ground_height(xHLf) - yHLf;
    NHL = k_ground*abs(delta_y_HLf)^1.5 - ...
        b_ground*yHLfdot*abs(delta_y_HLf)^1.5;
end


%-------------------------------------------------------------------------%
% Horizontal forces
%-------------------------------------------------------------------------%
% Fore Right foot
%-------------------------------------------------------------------------%
% Flight phase
if yFRf > ground_height(xFRf)
    FFR = 0;
    slipFR  = -1; % indicating slipping in stance phase; no meaning here
% Stance phase
else
    % Calculate slip and stick friction forces
    Fstatic = mu_s * NFR;
    Fslip   = mu_d * NFR;
    
    % Determine stick/slip
    if abs(xFRfdot) <= slip_error % Friction zero crossing
        slipFR  = 0; % stick
    else
        slipFR  = 1; % slip
    end

    % Calculate friction
    if slipFR == 0
        FFR = -sign(xFRfdot)*abs(xFRfdot)*(Fstatic/slip_error);
    elseif slipFR == 1
        FFR = -sign(xFRfdot)*Fslip - sign(xFRfdot)* ...
            (Fstatic-Fslip)*exp(-abs(xFRfdot/friction_velocity));
    end    
end
% Rare case: Hitting vertical surface
if ((xFRf > (next_vertical_surface_loc(xFRf)-0.015)) && ...
        (yFRf < ground_height(next_vertical_surface_loc(xFRf)+0.02)))    
    delta_x_FRf = next_vertical_surface_loc(xFRf)-0.015- xFRf;
    FFR_vertical_hit = k_ground*abs(delta_x_FRf)^1.5 - ...
        b_ground*xFRfdot*abs(delta_x_FRf)^1.5;    
    FFR = FFR - FFR_vertical_hit;
end

%-------------------------------------------------------------------------%
% Hind Right foot
%-------------------------------------------------------------------------%
% Flight phase
if yHRf > ground_height(xHRf)
    FHR = 0;
    slipHR  = -1; % indicating slipping in stance phase; no meaning here
% Stance phase
else
    % Calculate slip and stick friction forces
    Fstatic = mu_s * NHR;
    Fslip   = mu_d * NHR;
    
    % Determine stick/slip
    if abs(xHRfdot) <= slip_error % Friction zero crossing
        slipHR  = 0; % stick
    else
        slipHR  = 1; % slip
    end

    % Calculate friction
    if slipHR == 0
        FHR = -sign(xHRfdot)*abs(xHRfdot)*(Fstatic/slip_error);
    elseif slipHR == 1
        FHR = -sign(xHRfdot)*Fslip - sign(xHRfdot)* ...
            (Fstatic-Fslip)*exp(-abs(xHRfdot/friction_velocity));
    end    
end
% Rare case: Hitting vertical surface
if ((xHRf > (next_vertical_surface_loc(xHRf)-0.015)) && ...
        (yHRf < ground_height(next_vertical_surface_loc(xHRf)+0.02)))    
    delta_x_HRf = next_vertical_surface_loc(xHRf)-0.015- xHRf;
    FHR_vertical_hit = k_ground*abs(delta_x_HRf)^1.5 - ...
        b_ground*xHRfdot*abs(delta_x_HRf)^1.5;    
    FHR = FHR - FHR_vertical_hit;
end

    
%-------------------------------------------------------------------------%
% Fore Left foot
%-------------------------------------------------------------------------%
% Flight phase
if yFLf > ground_height(xFLf)
    FFL = 0;
    slipFL  = -1; % indicating slipping in stance phase; no meaning here
% Stance phase
else
    % Calculate slip and stick friction forces
    Fstatic = mu_s * NFL;
    Fslip   = mu_d * NFL;
    
    % Determine stick/slip
    if abs(xFLfdot) <= slip_error % Friction zero crossing
        slipFL  = 0; % stick
    else
        slipFL  = 1; % slip
    end

    % Calculate friction
    if slipFL == 0
        FFL = -sign(xFLfdot)*abs(xFLfdot)*(Fstatic/slip_error);
    elseif slipFL == 1
        FFL = -sign(xFLfdot)*Fslip - sign(xFLfdot)* ...
            (Fstatic-Fslip)*exp(-abs(xFLfdot/friction_velocity));
    end    
end
% Rare case: Hitting vertical surface
if ((xFLf > (next_vertical_surface_loc(xFLf)-0.015)) && ...
        (yFLf < ground_height(next_vertical_surface_loc(xFLf)+0.02)))    
    delta_x_FLf = next_vertical_surface_loc(xFLf)-0.015- xFLf;
    FFL_vertical_hit = k_ground*abs(delta_x_FLf)^1.5 - ...
        b_ground*xFLfdot*abs(delta_x_FLf)^1.5;    
    FFL = FFL - FFL_vertical_hit;
end

%-------------------------------------------------------------------------%
% Hind Left foot
%-------------------------------------------------------------------------%
% Flight phase
if yHLf > ground_height(xHLf)
    FHL = 0;
    slipHL  = -1; % indicating slipping in stance phase; no meaning here
% Stance phase
else
    % Calculate slip and stick friction forces
    Fstatic = mu_s * NHL;
    Fslip   = mu_d * NHL;
    
    % Determine stick/slip
    if abs(xHLfdot) <= slip_error % Friction zero crossing
        slipHL  = 0; % stick
    else
        slipHL  = 1; % slip
    end

    % Calculate friction
    if slipHL == 0
        FHL = -sign(xHLfdot)*abs(xHLfdot)*(Fstatic/slip_error);
    elseif slipHL == 1
        FHL = -sign(xHLfdot)*Fslip - sign(xHLfdot)* ...
            (Fstatic-Fslip)*exp(-abs(xHLfdot/friction_velocity));
    end    
end
% Rare case: Hitting vertical surface
if ((xHLf > (next_vertical_surface_loc(xHLf)-0.015)) && ...
        (yHLf < ground_height(next_vertical_surface_loc(xHLf)+0.02)))    
    delta_x_HLf = next_vertical_surface_loc(xHLf)-0.015- xHLf;
    FHL_vertical_hit = k_ground*abs(delta_x_HLf)^1.5 - ...
        b_ground*xHLfdot*abs(delta_x_HLf)^1.5;    
    FHL = FHL - FHL_vertical_hit;
end


end

