clear
clc
close all

load('lab2_data.mat')

map = imread('map_mazes/map_maze_2.pgm');
figure(1)
imshow(map)
f = createFreespace(map, 'uint8');
figure(2)
imshow(f)
imwrite(f, 'freespace.bmp','bmp')


m=1000;
p = createParticles(m,f,1);

figure(3)
hold on
for n = 1:m
    plot(p(n).y, p(n).x, '.r')
end



