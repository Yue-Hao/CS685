clc;

K = [3 8 -1.5
     5 8 -1.5
     3 5 -1.5
     3 8 -1.0];


X_0 = [0,50, 0];
X_g = [0 0];

h = figure;


for i = 1:size(K,1)

x = [];
y = [];
theta = [];

[x y theta] = goToPose(X_0, X_g, K(i,:));
subplot(2,2,1);
hold on;
plot(x,y,'DisplayName',strcat('K=',mat2str(K(i,:))));
subplot(2,2,2);
hold on;
plot(x,'DisplayName',strcat('K=',mat2str(K(i,:))))
subplot(2,2,3);
hold on;
plot(y,'DisplayName',strcat('K=',mat2str(K(i,:))))
subplot(2,2,4);
hold on;
plot(theta,'DisplayName',strcat('K=',mat2str(K(i,:))))
end

subplot(2,2,1);
xlabel('x')
ylabel('y')
axis equal

subplot(2,2,2);
xlabel('t')
ylabel('x')
legend('show')
subplot(2,2,3);
xlabel('t')
ylabel('y')

subplot(2,2,4);
xlabel('t')
ylabel('theta')

saveas(h,strcat('hw2-',int2str(4)),'epsc');
