% value iteration:

function [V, pi] = value_iteration(mdp, precision)

%IN: mdp, precision
%OUT: V, pi

% Recall: to obtain an estimate of the value function within accuracy of
% "precision" it suffices that one of the following conditions is met:
%   (i)  max(abs(V_new-V)) <= precision / (2*gamma/(1-gamma))
%   (ii) gamma^i * Rmax / (1-gamma) <= precision  -- with i the value
%   iteration count, and Rmax = max_{s,a,s'} | R(s,a,s') |

% state

gamma=0.99;

X = 1:12;
U = 1:4;
V = zeros(12,1);
pi = zeros(12,1);

% calculate R(X)
R = zeros(size(X));
% iterate through action

for j = 1:numel(X)
    x = X(j);
    for k = 1:numel(U)
        u = U(k);
        R(x) = R(x) + sum(mdp.T{u}*mdp.R{u}(x,:)');
    end
end

Rmax = max(R);

for i = 1:1000

	V_new = zeros(size(V));
    
    %iterate through state
    for j = 1:numel(X)
        TU = zeros(size(U));
        
        % iterate through action
        for k = 1:numel(U)
            u = U(k);
            TU(k) = sum(mdp.T{u}*V);
        end
        
        V_new(j) = R(j)+gamma*max(TU);

    end
    
    if max(abs(V_new-V)) <= precision / (2*gamma/(1-gamma)) ...
                || gamma^i * Rmax / (1-gamma) <= precision
        break;
    end
    V = V_new;
end

end

