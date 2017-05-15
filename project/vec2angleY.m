function angle = vec2angleY(vector2d)

    angle = asin(-vector2d(:,1)./Length(vector2d(:,1:2)))
    index = find(vector2d(:,2) < 0)
    if ~isempty(index)
        angle(index) = sign(vector2d(index,2)) * pi - angle(index);

end