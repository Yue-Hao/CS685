% hash states:   
%  (l_a, l_b, l_c, current_queue)
% to a integer

function idx = map_to_integer(s, l_max)
    
    idx = s(1) + s(2)*(l_max+1) + s(3)*(l_max+1)^2 + (s(4)-1)*(l_max+1)^3 + 1;

end