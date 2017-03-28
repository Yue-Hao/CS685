% To test the function consider a unit cube placed in the origin of
% the world coordinate system (specified by 8 vertices [0, 0, 0]?, [1, 0, 0]?, etc

X = [0,0,0;
     1, 0, 0;
     1, 1, 0;
     0, 1, 0;
     0, 1, 1;
     0, 0, 1;
     1, 0, 1;
     1, 1, 1];

X = X';

K = [800, 0, 250;
     0, 800, 250;
     0, 0, 1];
 
R = [0,0,-1;
     1,0,0;
     0,-1,0];

T = [2,0,0]';

x = project(X, R, T, K);
 

scatter(x(1,:),x(2,:),'filled');
axis equal;

clear
load('3Dpoints.mat');
% test calibration
[R,T,K] = calibration2Dto3D(X,x2);

