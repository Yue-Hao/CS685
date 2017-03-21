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
            if max(s_diff) > 1 || min(s_diff) < -1
                T{action}(i,j) = 0;
                R{action}(i,j) = 0;
                continue;
            end
            
            if current_state(4) == next_state(4)
                % no queue change

                if current_state(4) == action
                    
                    if current_state(action) > 0
                        % a request is cleared
                        r = 1;
                    end
                    
                    s_diff(action) = s_diff(action) + 1;
                    t = calc_t(s_diff,p);
                    
                    switch mat2str(s_diff)
                            case '[0 0 0]'l
                                t = (1-p(1))*(1-p(2))*(1-p(3));
                            case '[1 0 0]'
                                t = p(1)*(1-p(2))*(1-p(3));
                            case '[0 1 0]'
                                t = (1-p(1))*p(2)*(1-p(3));
                            case '[1 1 0]'
                                t = p(1)*p(2)*(1-p(3));
                            case '[0 0 1]'
                                t = (1-p(1))*(1-p(2))*p(3);
                            case '[1 0 1]'
                                t = p(1)*(1-p(2))*p(3);
                            case '[0 1 1]'
                                t = (1-p(1))*p(2)*p(3);
                            case '[1 1 1]'
                                t = p(1)*p(2)*p(3);
                            otherwise
                                t = 0;
                        end
                    
                else
                    t = 0; r = 0;
                end
            else
                % queue changed
                
                r = 0; % not clearing a request
                
                if next_state(4) == action
                    
                        switch mat2str(s_diff)
                            case '[0 0 0]'
                                t = (1-p(1))*(1-p(2))*(1-p(3));
                            case '[1 0 0]'
                                t = p(1)*(1-p(2))*(1-p(3));
                            case '[0 1 0]'
                                t = (1-p(1))*p(2)*(1-p(3));
                            case '[1 1 0]'
                                t = p(1)*p(2)*(1-p(3));
                            case '[0 0 1]'
                                t = (1-p(1))*(1-p(2))*p(3);
                            case '[1 0 1]'
                                t = p(1)*(1-p(2))*p(3);
                            case '[0 1 1]'
                                t = (1-p(1))*p(2)*p(3);
                            case '[1 1 1]'
                                t = p(1)*p(2)*p(3);
                            otherwise
                                t = 0;
                        end
    
                else
                    t = 0;
                end
                
            end         
            
            T{action}(i,j) = t;
            R{action}(i,j) = r;
        end
    end
end

queue_mdp.T = T;
queue_mdp.R = R;
queue_mdp.gamma = gamma;
end
