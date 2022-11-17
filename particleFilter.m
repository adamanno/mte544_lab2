clear
clc
close all

load('topicData_point1.mat')
load('topicData_point2.mat')

odom1_msgs = cell2mat(odom1_msgs);
odom2_msgs = cell2mat(odom2_msgs);

scan1_msgs = cell2mat(scan1_msgs);
scan2_msgs = cell2mat(scan2_msgs);

tf1_msgs = cell2mat(tf1_msgs);
tf2_msgs = cell2mat(tf2_msgs);

tf_static1_msgs = cell2mat(tf_static1_msgs);
tf_static2_msgs = cell2mat(tf_static2_msgs);

map = imread('map_mazes/map_maze_2.pgm');
% imshow(map)
f = createFreespace(map, 'uint8');
figure(1)
imshow(f)







