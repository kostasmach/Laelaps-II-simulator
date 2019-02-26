function x_location = next_vertical_surface_loc(x_foothold)

global x_loc


if x_foothold < x_loc(1)
    x_location = x_loc(1);
elseif x_foothold < x_loc(2)
    x_location = x_loc(2);
elseif x_foothold < x_loc(3)
    x_location = x_loc(3);
elseif x_foothold < x_loc(4)
    x_location = x_loc(4);
elseif x_foothold < x_loc(5)
    x_location = x_loc(5);
elseif x_foothold < x_loc(6)
    x_location = x_loc(6);
elseif x_foothold < x_loc(7)
    x_location = x_loc(7);
else
    x_location = 10;
end

end

