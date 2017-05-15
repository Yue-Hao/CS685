function mGround = GroundMatrix(torso_matrix)

yProjection = [Normalize(torso_matrix(1:2,2)); 0];
xProjection = [yProjection(2); -yProjection(1); 0];
mGround = [xProjection yProjection [0;0;1]];

end