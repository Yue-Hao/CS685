x0 = 100;
y0 = 50;
theta0 = 45;

omega = 2;
v = 1;

t = 100;

delta = [0.01, 0.1, 0.5, 1.0];

h = figure;

for i = 1: 4
    
subplot(2,2,i);

[x y theta] = diffDrive(x0, y0, deg2rad(theta0), v, deg2rad(omega), t, delta(i));

plot(x,y);
hold on
plot(x0,y0,'-rx','MarkerSize',10);
title(strcat('delta = ', num2str(delta(i))));
%xlim([x0-1 x0+1])
%ylim([y0-0.5 y0+0.5])
xlabel('x')
ylabel('y')
axis equal

end

saveas(h,'hw1','epsc');
