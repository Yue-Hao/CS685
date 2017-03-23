
% hash integer:   
% to a state
% (l_a, l_b, l_c, current_queue)

function s = map_to_state(idx, l_max)
    idx = idx-1;
    s = zeros(1,4);
    s(4) = floor(idx/(l_max+1)^3) + 1;
    idx = mod(idx,(l_max+1)^3);
    s(3) = floor(idx/(l_max+1)^2);
    idx = mod(idx,(l_max+1)^2);
    s(2) = floor(idx/(l_max+1)^1);
    idx = mod(idx,(l_max+1)^1);
    s(1) = idx;
end