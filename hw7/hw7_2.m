
x = [2.0,4.0,0.0];
u = [pi/2,0.0,1.0]';

X = [2.0,4.0,0.0];

for i = 1:5000
    X(i,:) = sample_motion_model(x,u);
end

plot(X(:,1),X(:,2),'.');
axis equal;
xlabel('x');
ylabel('y');
print('motion','-depsc')