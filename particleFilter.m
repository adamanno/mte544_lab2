clear
clc
close all

% previously loaded all data from .db3 bag file using ROS toolbox
load('data/lab2_data.mat')
map = imread('map_mazes/map_maze_2.pgm');
map = occupancyMap(map./255, 0.03^-1);
% occupancyMap parameters
map.OccupiedThreshold = 0.65;
map.FreeThreshold = 0.25;

% *************************************************************************
% Spoke with Ahmad about this, he said it was okay to use 
% this value as the origin for maze 2 
map.GridOriginInLocal = [-0.843 -3.94]; 
% *************************************************************************

occPoints = map2points(map); % get points from the map 
KDS = KDTreeSearcher(occPoints); % create the KDTree searcher

N_part = 50000; % number of particles to create
p = createParticles(N_part, map); % particles vector
w = ones(1, N_part)./N_part; % weights vector

N_iter = 10; % max number of iteratinos the algorithm will run
poseGuess(1) = averagePose(p); % create memory to store the weighted-average pose from each iteration

% select the scan point
scan = scan1_msgs;
figname = 'point1.png'; % Point 3 on Maze 2
% scan = scan2_msgs;
% figname = 'point2.png'; % Point 7 on Maze 2

for i = 2:N_iter + 1 % outer loop: iterations

    for j = 1:N_part % inner loop: weight particles
        q = transformScan2(scan(i-1).ranges, p(j)); % generate point cloud in particle coordinate frame
        [idx, d] = knnsearch(KDS, q, K=1); % knn search algorithm
        probs = exp(-(d.^2)./(2*0.04)); % calculate the probabilities
        w(j) = prod(probs); % probs to weights
    end

    fprintf('Weighted %i particles at iteration %i/%i\n', N_part, i-1, N_iter)

    % scale weights for proportional sampling
    w = w./sum(w);
    
    %Resample based on weightings
    %resample array is an array with information on which particle got sampled
    resample = randsrc(1,N_part,[linspace(1, N_part, N_part); w]);
    tempPart = p;
    
    %Replace particle struct with resampled particles
    for k = 1:N_part
       p(k) = tempPart(resample(k));
    end

    poseGuess(i) = averagePose(p);
    
    % calculate differences between the last best-average pose and the 
    % current best-average pose
    deltax = poseGuess(i).x - poseGuess(i-1).x;
    deltay = poseGuess(i).y - poseGuess(i-1).y;
    deltatheta = poseGuess(i).theta - poseGuess(i-1).theta;
    
    err = norm([deltax deltay deltatheta]); % norm of the error vector

    if err < 0.0005 % exit condition
        fprintf('Error between current guessed pose and previous guessed pose is less than 0.0005. Breaking loop.\n')
        break
    end
end

%Plot estimated pose and its lidar scan point cloud onto of the map
figure(1)
hold on
map.show()
hold off
hold on
plot(poseGuess(end).x, poseGuess(end).y, '.r')
q = transformScan2(scan(1).ranges, poseGuess(end));
plot(q(:,1), q(:,2), 'b.')
legend('Best Pose', 'LiDAR Cloud')
hold off
exportgraphics(gcf,figname,'BackgroundColor', 'none', 'Resolution',1800)
fprintf('exported %s\n', figname)

%%
%Plotting the changes in the pose each iteration, as it converges to the best estimate
figure(2)
n = linspace(1, length(poseGuess), length(poseGuess)) - 1;

subplot(3,1,1)
set(gcf, Position=[0 0 800 320])
hold on
grid on
title('X-estimate vs. Iteration')
plot(n, [poseGuess(:).x], '-b.')
xlabel('iterations') 
ylabel('x coordinate [meters]') 

subplot(3,1,2)
hold on
grid on
title('Y-estimate vs. Iteration')
plot(n, [poseGuess(:).y], '-b.')
xlabel('iterations') 
ylabel('y coordinate [meters]') 

subplot(3,1,3)
hold on
grid on
title('\theta-estimate vs. Iteration')
plot(n, [poseGuess(:).theta], '-b.')
xlabel('iterations') 
ylabel('orientation [radians]') 

exportgraphics(gcf, 'convergencePlot.png', 'Resolution', 1800)
fprintf('exported convergencePlot.png\n')
