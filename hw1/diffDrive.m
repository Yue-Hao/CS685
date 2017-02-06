function [x,y,theta] = diffDrive(x0, y0, theta0, v, omega, t, delta)

x = zeros(1,t);
y = zeros(1,t);
theta = zeros(1,t);

for i = 1:t

    dtheta = omega;
    if i == 1
        dx = v * cos(theta0);
        dy = v * sin(theta0);
        x(i) = x0 + dx * delta;
        y(i) = y0 + dy * delta;
        theta(i) = theta0 + dtheta * delta;
    else
        dx = v * cos(theta(i-1));
        dy = v * sin(theta(i-1));
        x(i) = x(i-1) + dx * delta;
        y(i) = y(i-1) + dy * delta;
        theta(i) = theta(i-1) + dtheta * delta;
    end
end

end
