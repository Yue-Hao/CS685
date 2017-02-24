clc;

X = [-35, 35, 0
      -35,10,0
     0,50, 0];

h = figure;


for j = 1:3
for i = 1:size(X,1)

X_0 = X(i,:);
X_g = [0 0];
l = [-1 1 0];

x = [];
y = [];
theta = [];
if (j == 1)
[x y theta] = goToPoint(X_0, X_g);
elseif (j == 2)
[x y theta] = followLine(X_0, l);
else
[x y theta] = goToPose(X_0, X_g);
end

subplot(2,2,j)
hold on;
plot(x,y);
end

end
subplot(2,2,1)
xlabel('x')
ylabel('y')
axis equal
title('goToPoint')

subplot(2,2,2)
xlabel('x')
ylabel('y')
axis equal
title('followLine')

subplot(2,2,3)
xlabel('x')
ylabel('y')
axis equal
title('goToPose')

saveas(h,'hw2-0','epsc');
