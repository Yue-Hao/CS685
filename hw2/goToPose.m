function [x,y,theta] = goToPose(X_0, X_g)

k_rho = 3;
k_alpha = 8;
k_beta = -1.5;
delta = 0.01;

x = X_0(1);
y = X_0(2);
theta = X_0(3);

x_g = X_g(1);
y_g = X_g(2);

i = 1;

while(1)
    
    rho = sqrt((x_g-x(i))^2+(y_g-y(i))^2);
    
    if( rho < 0.1 || i > 10000)
     	break;
    end
    
    alpha = -theta(i) + atan2(y_g-y(i),(x_g-x(i)));
    beta = -theta(i) - alpha;
    
    v = k_rho * rho;
    omega = k_alpha * alpha + k_beta * beta;
   
    dx = v*cos(theta(i));
    dy = v*sin(theta(i));
    dtheta = omega;
   
    x = [x x(i)+dx*delta];
    y = [y y(i)+dy*delta];
    theta = [theta theta(i)+dtheta*delta];
   
    i = i+1;
end


end
