function world = castVecFromLocal2World(vector2d, orient)

stheta = 0.0;
ctheta = 0.0;
if size(orient,2) == 1
    stheta = -cos(orient);
    ctheta = sin(orient);
else
    orient = orient ./ Length(orient)
	stheta =  -orient(1);
	ctheta = orient(2);
end
	world(:,1) = vector2d(:,1)*ctheta - vector2d(:,2)*stheta;
	world(:,2) = vector2d(:,1)*stheta + vector2d(:,2)*ctheta;
end