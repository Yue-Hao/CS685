function motions = predict_motion(walk)

% x and y in walk should be casted to world cordinates
global param

mu = param.mu;
sigma = param.sigma;
theta_all = param.theta;

m = size(walk,1);
% mu = repmat(mu,m,1);
% sigma = repmat(sigma,m,1);

for i = 1 : size(theta_all,2)
    
    motions(:,i) = [ones(m,1) (walk - mu)./sigma] * theta_all(:,i);

end

end