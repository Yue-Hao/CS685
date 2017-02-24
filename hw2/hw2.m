clc;

method  = 2;

X = [-35, 35, 0
      -35,10,0
      -50,10, 0];

h = figure;
hold on;

for i = 1:3

X_0 = X(i,:);
X_g = [0 0];
l = [-1 1 0];

x = [];
y = [];
theta = [];
if (method == 1)
[x y theta] = goToPoint(X_0, X_g);
elseif (method == 2)
[x y theta] = followLine(X_0, l);
else
[x y theta] = goToPose(X_0, X_g);
end

plot(x,y);
%
%plot(X_0(0),X_0(1),'-bx','MarkerSize',10);
%plot(X_g(0),X_g(1),'-rx','MarkerSize',10);
%title(strcat('delta = ', num2str(delta(i))));
%xlim([x0-1 x0+1])
%ylim([y0-0.5 y0+0.5])
end

xlabel('x')
ylabel('y')
axis equal

saveas(h,strcat('hw2-',int2str(method)),'epsc');
