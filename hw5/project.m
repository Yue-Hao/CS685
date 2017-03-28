function x = project(X, R, T, K)
% project takes X as an input image coordinates of 3D points in the world coordinate frame and 
% generates pixel coordinates of the projected points in the image,
% (R,T) is the displacement of the camera coordinate frame with respect to the world frame
% X is 3 × n vector of the coordinates of 3D points
% K is the matrix of intrin- sic image parameters, e.g. [800, 0, 250; 0, 800, 250; 0, 0, 1]
% the camera the z-axis if pointing towards the scene and y down and x to the right.

X = [X; ones(1,size(X,2))]

x = [K*R, K*T]*X;

x = x(1:2,:);
end