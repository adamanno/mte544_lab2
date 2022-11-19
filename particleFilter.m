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
map.GridOriginInLocal = [-0.843 -3.94]; % Spoke with Ahmed about this, he said it was okay to use this value as the origin for maze 2

x_range = map.XWorldLimits;
y_range = map.YWorldLimits;

% get points from the map and create the KDTree searcher
o = map2points(map);
searcher = KDTreeSearcher(o);

% create particles in region
m=5000;
p = createParticles(m,x_range,y_range);


figure(1)
hold on
map.show()
hold off

hold on
for n = 1:m
    plot(p(n).x, p(n).y, '.r')
end

hold on
for n = 1:length(o)
    plot(o(n,1), o(n,2), '.b')
    
end
hold off



