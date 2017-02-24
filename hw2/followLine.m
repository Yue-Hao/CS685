function [x,y,theta] = followLine(X_0, l)

K_d = 1;
K_h = 10;
delta = 0.01;

x = X_0(1);
y = X_0(2);
theta = X_0(3);

a = l(1);
b = l(2);
c = l(3);

i = 1;

while(1)
    

    if(i > 10000)
        break;
    end
    
    d = [a b c]*[x(i) y(i) 1]'/sqrt(a^2+b^2);
    
    theta_g = atan( -a / b);
    
    alpha_d = -K_d * d;
    alpha_h = K_h*(theta_g-theta(i));

    v = 1;
    omega = alpha_d + alpha_h;
   
    dx = v*cos(theta(i));
    dy = v*sin(theta(i));
    dtheta = omega;
   
    x = [x x(i)+dx*delta];
    y = [y y(i)+dy*delta];
    theta = [theta theta(i)+dtheta*delta];
   
    i = i+1;
end


end
