function y_ground = ground_height(x_foothold)

global x_loc gr_height

if x_foothold < x_loc(1)
    y_ground = gr_height(1);
elseif x_foothold < x_loc(2)
    y_ground = gr_height(2);
elseif x_foothold < x_loc(3)
    y_ground = gr_height(3);
elseif x_foothold < x_loc(4)
    y_ground = gr_height(4);
elseif x_foothold < x_loc(5)
    y_ground = gr_height(5);
elseif x_foothold < x_loc(6)
    y_ground = gr_height(6);
elseif x_foothold < x_loc(7)
    y_ground = gr_height(7);
else
    y_ground = gr_height(7);
end

end

