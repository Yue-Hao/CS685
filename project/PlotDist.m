function PlotDist(pos, dist, landMarkSeen,color)

global landmarks

% index = find(landMarkSeen);
% n = length(index);
% line([repmat(pos(1),n,1) landmarks(index,1)],...
%         [repmat(pos(2),n,1) landmarks(index,2)]);
% hold on
% 
% mid_point = (landmarks(index,:) + repmat(pos,n,1)) ./ 2;
% text(mid_point(:,1),mid_point(:,2),num2str(dist(index)));

hold on
for i = 1 : size(landmarks,1)
    if landMarkSeen(i)
        line([pos(1), landmarks(i,1)], [pos(2), landmarks(i,2)]);
        mid_point = (landmarks(i,1:2) + pos) ./ 2;
        text(mid_point(1),mid_point(2),num2str(dist(i)));
    end
end

end