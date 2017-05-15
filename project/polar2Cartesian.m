function vec = polar2Cartesian(r, theta, phi)
% theta,phi in rad

vec(:,1) = r .* sin(theta) .* cos(phi);
vec(:,2) = r .* sin(theta) .* sin(phi);
vec(:,3) = r .* cos(theta);

end