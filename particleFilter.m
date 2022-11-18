clear
clc
close all

load('lab2_data.mat')

map = imread('map_mazes/map_maze_2.pgm');

f = createFreespace(map, 'uint8');
w = createWallmap(map, 'uint8');


map_matlab = occupancyMap(map./255, 0.03^-1);
map_matlab.OccupiedThreshold = 0.65;
map_matlab.FreeThreshold = 0.25;
map_matlab.LocalOriginInWorld = [-0.843 -3.94];

figure(1)
hold on
map_matlab.show()
hold off

figure(2)
hold on
imshow(f)
hold off

figure (3)
hold on
imshow(w)
hold off

m=1000;
p = createParticles(m,f,1);

figure(4)
hold on
imshow(f)
hold on
for n = 1:m
    plot(p(n).y, p(n).x, '.r')
end
hold off


