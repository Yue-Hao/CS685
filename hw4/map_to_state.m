
% hash integer:   
% to a state
% (l_a, l_b, l_c, current_queue)

function s = map_to_state(idx, l_max)
    
    s = zeros(1,4);
    s(4) = (idx-1)/(l_max+1)^3;
    s(3) = (idx-s(4))/(l_max+1)^2;
end