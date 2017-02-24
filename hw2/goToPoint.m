function [x,y,theta] = goToPoint(X_0, X_g)

K_v = 1;
K_h = 4;
delta = 0.01;

x = X_0(1);
y = X_0(2);
theta = X_0(3);

x_g = X_g(1);
y_g = X_g(2);

i = 1;

while(1)
    
    d = sqrt((x_g-x(i))^2+(y_g-y(i))^2);
    if( d < 0.1 || i > 10000)
        break;
    end
    
    theta_g = atan((y_g-y(i))/(x_g-x(i)));

    v = K_v * sqrt((x_g-x(i))^2+(y_g-y(i))^2);
    omega = K_h * (theta_g - theta(i));
   
    dx = v*cos(theta(i));
    dy = v*sin(theta(i));
    dtheta = omega;
   
    x = [x x(i)+dx*delta];
    y = [y y(i)+dy*delta];
    theta = [theta theta(i)+dtheta*delta];
   
    i = i+1;
end


end
