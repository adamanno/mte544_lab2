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

N_part = 5000; % number of particles to create
p = createParticles(N_part, map); % particles vector
w = ones(1, length(p))./length(p); % weights vector

q1 = transformScan2(scan1_msgs(1).ranges, p(674));
q2 = transformScan2(scan1_msgs(1).ranges, p(674));


[i1, d1] = knnsearch(KDS, q1, K=1);
% [i2, d2] = knnsearch(KDS, q2, K=1);
i1 = unique(i1);

probs = exp((-(d1.^2))./(2*0.04));

[i2, d2] = knnsearch(occPoints,q1,'K',720,'Distance','euclidean');

figure(1)
hold on
map.show()
hold off
hold on
plot(q1(:,1), q1(:,2), '.r')
for i = 1:length(i1)
    plot(occPoints(i1(i),1), occPoints(i1(i),2), '.b')
end
% plot(q2(:,1), q2(:,2), '.b')
legend('Transformed Scan', 'KNN')


%% ************************************************************************
N_iter = 100;
for i = 1:N_iter % outer loop:
    for j = 1:length(p) % inner loop: weight particles
%         transformedScan = transformScan2(scan1_msgs(1).ranges, p(j));
    end

    % resample according to the weights
end


%% plotting section
if false
    figure(1)
    hold on
    map.show()
    hold off
    
    hold on
    for n = 1:N_part
        plot(p(n).x, p(n).y, '.r')
    end
    
    hold on
    for n = 1:length(occPoints)
        plot(occPoints(n,1), occPoints(n,2), '.b')
        
    end
    hold off

end

