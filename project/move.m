function partical_moved = move(partical, motions)

% partical = [x, y, orient]
% motions = [step_x, step_y, turn_angle, time_in_cycle]
global motion_noise

walk = castVecFromLocal2World(motions(:,1:2),deg2rad(partical(:,3)))

motions = predict_motion([walk, motions(:,3:5)])

partical_moved = partical + motions + randn(1,3) .* motion_noise;

partical_moved(:,3) = mod(partical_moved(:,3) + 180, 360) - 180;

end
