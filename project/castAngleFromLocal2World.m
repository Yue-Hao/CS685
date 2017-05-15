function world = castAngleFromLocal2World(angle, orient)
% angle(rad) ori(deg)
if size(orient,2) == 1
    world = angle + orient;
else
    ori_angle = rad2deg(vec2angleX(orient))
    world = angle + ori_angle;
end
world = mod(world + 180,360) - 180;
end