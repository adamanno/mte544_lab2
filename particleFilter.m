clear
clc
close all

load('data/lab2_data.mat')

map = imread('map_mazes/map_maze_2.pgm');

f = createFreespace(map, 'uint8');
w = createWallmap(map, 'uint8');

map_matlab = occupancyMap(map./255, 0.03^-1);
map_matlab.OccupiedThreshold = 0.65;
map_matlab.FreeThreshold = 0.25;
map_matlab.GridOriginInLocal = [-0.843 -3.94 ];

map_matlab.XWorldLimits
map_matlab.YWorldLimits

m=1000;

% modify createParticles to generate particles on the 
% x = [2, xmax], y =[-y, ymin] intervals
% theta = [0, 2*pi]
p = createParticles(m,f,1);


figure(1)
hold on
map_matlab.show()
hold off
hold on
for n = 1:m
    plot(p(n).y, p(n).x, '.r')
end
hold off

% figure(2)
% hold on
% imshow(f)
% hold off
% 
% figure (3)
% hold on
% imshow(w)
% hold off
% 

% figure(4)
% hold on
% imshow(f)


