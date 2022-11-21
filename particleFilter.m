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

N_part = 1000; % number of particles to create
p = createParticles(N_part, map); % particles vector
w = ones(1, N_part)./N_part; % weights vector

N_iter = 2;
poseGuess = zeros(N_iter,3);
poseGuess(1,:) = averagePose(p);


for i = 2:N_iter + 1 % outer loop:
    for j = 1:N_part % inner loop: weight particles
        q = transformScan2(scan1_msgs(i-1).ranges, p(j));
        [idx, d] = knnsearch(KDS, q, K=1);
        probs = exp((-(d.^2))./(2*0.04));
        w(j) = prod(probs);
    end
    
    a = sum(w)/length(w)
    % scale weights for proportional sampling
    w = w./sum(w);

    particleIndex = zeros(1, N_part);
    for k = 1:N_part
       particleIndex(k) = k;
    end
    resample = randsrc(1,N_part,[particleIndex; w]);
    tempPart = p;
    for k = 1:N_part
       p(k) = tempPart(resample(k));
    end

%     for k = 2:N_part
%         w(k) = w(k) + w(k-1);
%     end
%     
%     % resample according to the weights
%     for k = 1:N_part
%         r = rand();
%         for m = 1:N_part
%             if r < w(m)
%                 p(k) = p(m);
%                 break
%             end
%         end
%     end

    poseGuess(i,:) = averagePose(p);
end



figure(1)
hold on
map.show()
hold off
hold on
plot(poseGuess(:,1), poseGuess(:,2), '.r')
hold off

figure(2)
hold on
grid on
plot(linspace(0, N_iter, N_iter+1), poseGuess(:,3), '-b.')


% %% plotting section
% if false
%     figure(1)
%     hold on
%     map.show()
%     hold off
%     
%     hold on
%     for n = 1:N_part
%         plot(p(n).x, p(n).y, '.r')
%     end
%     
%     hold on
%     for n = 1:length(occPoints)
%         plot(occPoints(n,1), occPoints(n,2), '.b')
%         
%     end
%     hold off
% 
% end

