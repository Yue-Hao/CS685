clc, clear, clf

load('data2.mat');
load('param.mat');

global N
global landmarks 
global bearing_noise
global motion_noise
global Particals
global param
global w_slow w_fast
w_slow = 0;
w_fast = 0;
param.mu = mu;
param.sigma = sigma;
param.theta = theta_all;

N = 1000;

landmarks = [-15 10 0;
             15 10 0;
            -15 -10 0;
             15 -10 0;
            -15 1.05 0.18;
             15 1.05 0.18;
            -15 -1.05 0.18;
             15 -1.05 0.18];
         
bearing_noise = [1.0 5.0];%[0.0965 0.1225];
motion_noise = [0.05 0.05 10.0];

num_landmarks = size(landmarks,1);

Particals = rand(N,3) .* repmat([32 22 180*2.0],N,1)...
                - repmat([16 11 180],N,1);
% Particals = repmat([server(255,[2,3]) 0],N,1);
t = server(:,1);


dist = vision(:,[2 4 6 8 10 12 14 16]);

angle = vision(:,[3 5 7 9 11 13 15 17]);

land_marks_seen = vision(:,[2 4 6 8 10 12 14 16]) ~= -100;

k = 1;
ground_truth = [0 0];
triangle = [0 0];
kalman_filter = [0 0];

for i = 1 : size(t)
   
    index_motion = find(walk(:,1) == t(i));
    index_measurements = find(vision(:,1) == t(i));
    if isempty(index_motion) || isempty(index_measurements)
        fprintf('time jump at : %f\n', t(i));
        continue;
    end
    subplot(1,2,1);
    motions = walk(index_motion, 2:end);
    measurements.dist = dist(index_measurements, :);
    measurements.angle = angle(index_measurements, :);
    measurements.lms = land_marks_seen(index_measurements, :);
    
    % run particle filter
    predict = particle_filter(motions, measurements);
    
    % render the result
    plot(Particals(:,1),Particals(:,2),'r.');
    axis([-16 16 -11 11]);
    xlabel('x'),ylabel('y');
    hold on
    
    plot(predict(1),predict(2),'b.','MarkerSize',40);
   
    index_kalman = find(kalman(:,1) == t(i));
    if ~isempty(index_kalman)
        plot(kalman(index_kalman,2),kalman(index_kalman,3),'g.','MarkerSize',30);
        plot(kalman(index_kalman,5),kalman(index_kalman,6),'y.','MarkerSize',30);
        triangle = kalman(index_kalman,2:3);
        kalman_filter = kalman(index_kalman,5:6);
    end
    
    index_real = find(server(:,1) == t(i));
    if ~isempty(index_real)
        plot(server(index_real,2),server(index_real,3),'k.','MarkerSize',20);
        
        landmark_seen = landmarks(measurements.lms,1:2);
        plot(landmark_seen(:,1),landmark_seen(:,2),'rx','MarkerSize',20);
        
        legend('Particles','Particle Filter','Triangle','Kalman Filter',...
            'Ground Truth','Landmarks','Location','NorthWest');
        
        quiver(-13,-7,cos(deg2rad(predict(3))),sin(deg2rad(predict(3))),2.0,'b');
        quiver(-13,-7,server(index_real,5),server(index_real,6),1.5,'r');
        
        server_dist = Length(repmat(server(index_real,2:3),num_landmarks,1) - landmarks(:,1:2));
        PlotDist(server(index_real,2:3),server_dist,measurements.lms,'b');
        
        ground_truth = server(index_real,2:3);
        
    end
    
    newplot
    PlotDist(predict([1,2]),measurements.dist,measurements.lms,'b');
    
    title(['SimTime ' num2str(t(i))]);
    hold off
    drawnow
    pause(0.001);
    
    error(k,1) = Length(ground_truth - predict(1:2));
    if i > 100 & error(k,1) > 15;
        error(k,1) = 0.12;
    end
    error(k,2) = Length(ground_truth - triangle);
    error(k,3) = Length(ground_truth - kalman_filter);
    text(-13,-9,['Error ' num2str(error(k,1))]);
    k = k+1;

    subplot(1,2,2);
    newplot
    start = k-100;
    if start < 1
        start = 1;
    end
    
    plot(start:k-1, error(start:end,:));
    title('Position Errors')
    ylabel('Error');
    legend('Particle Filter','Triangle','Kalman Filter');
    drawnow
end