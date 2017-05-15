function weight = measurement_prob(particle, measurements)

global landmarks bearing_noise;

num_landmarks = size(landmarks,1);

predicted_dist = Length(landmarks - repmat([particle(1,1:2) 0.5],...
                         num_landmarks,1));

predicted_angle = vec2angleX(landmarks(:,1:2) - repmat(particle(1,1:2),...
                         num_landmarks,1));

% compute errors
error = 1.0;

for i = 1 : num_landmarks
    
    if measurements.lms(i)

        dist_error(i) = abs(measurements.dist(i) - predicted_dist(i));
        
        angle_error = abs(castAngleFromLocal2World(measurements.angle(i),...
           particle(1,3))- rad2deg(predicted_angle(i)));

        angle_error = mod(angle_error+180, 360) - 180;
        
        error = error .* gaussian(0, bearing_noise(1) * predicted_dist(i) / 100, dist_error(i));
        
        error = error .* gaussian(0,bearing_noise(2),angle_error);
    end
    
end

weight = error;

end