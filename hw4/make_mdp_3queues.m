% mdp:
%% T{action}(current_state, next_state) : transition model
%% R(current_state, action, next_state) : reward
%% gamma: discount factor

function queue_mdp = make_mdp_3queues(p, init_queue_length, l_max, gamma)

%  p:  a request is added to each queue

% states:   
%  (l_a, l_b, l_c, current_queue)

% Actions: change to queue a:1, b:2, c:3
T = {};
R = {};

for i = 1:map_to_integer([l_max, l_max, l_max, 3], l_max)
    for j = 1:map_to_integer([l_max, l_max, l_max, 3], l_max)
        for action = 1:3
            t = 0;
            r = 0;
            current_state = map_to_state(i,l_max);
            next_state = map_to_state(j,l_max);
            
            s_diff = next_state(1:3) - current_state(1:3);
                    
            if current_state(4) == next_state(4) && current_state(action) > 0
                 % a request is cleared
                 r = 1;
            else
                 r = 0;
            end
                    
            tt = [0 0 0];
            for k = 1:3
            	if s_diff(k) == -1
                    if(k == action)
                        % cleared and not added
                        tt(k) = 1 - p(k);
                    else
                        % not possible
                        tt(k) = 0;
                    end
                 elseif s_diff(k) == 0
                    if(k == action)
                        % no queue change
                        if(current_state(k) == 0)
                            % not cleared request and not added
                            tt(k) = 1 - p(k);
                        else
                            % cleared and added
                            tt(k) = p(k);
                        end
                    else  
                        % queue change
                        if(current_state(k) == l_max)
                            % queue full
                            tt(k) = 1;
                        else
                            % not cleared and not added
                            tt(k) = 1-p(k);
                        end
                    end
                 elseif s_diff(k) == 1
                    if(k == action)
                        % no queue change
                        if(current_state(k) == 0)
                            % not clear and added
                            tt(k) = p(k);
                        else
                            % not possible
                            tt(k) = 0;
                        end
                    else
                        % queue change
                        tt(k) = p(k);
                    end                            
                 else
                    % not possible
                    tt(k) = 0;
                 end
            end
            t = tt(1)*tt(2)*tt(3);
            
            T{action}(i,j) = t;
            R{action}(i,j) = r;
        end
    end
end

queue_mdp.T = T;
queue_mdp.R = R;
queue_mdp.gamma = gamma;

end
