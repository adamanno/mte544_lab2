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

map = imread('map_maze_2.pgm');
figure
%imshow(map);
xCoordWall = zeros(100,1);
yCoordWall = zeros(100,1);
counter=1;
resolution=0.03; %metres / pixel
origin = [-1.94, -8.63, 0]
for col=1:1:329
    for row=1:1:188
        if map(col,row) == 0
            xCoordWall(counter) = col;
            yCoordWall(counter) = 330-row;
            counter = counter + 1;
        end
    end
end
figure
scatter(xCoordWall,yCoordWall)

xCoordWall = xCoordWall*resolution;
yCoordWall = yCoordWall*resolution;

xCoordWall = xCoordWall+origin(1);
yCoordWall = yCoordWall+origin(2);
figure
scatter(xCoordWall,yCoordWall)

numParticles=200;
particle =zeros(numParticles,3); %x,y,rho
for i=1:1:numParticles
    particle(i,1) = randi([1 188]);
    particle(i,2) = randi([1 329]);
    while map(particle(i,2),particle(i,1))==205 || map(particle(i,2),particle(i,1))==0
        particle(i,1) = randi([1 188]);
        particle(i,2) = randi([1 329]);
    end
    particle(i,1) = particle(i,1)*resolution + origin(1);
    particle(i,2) = (330-particle(i,2))*resolution + origin(2);
    particle(i,3) = randi([0 360]);
end

%scatter(particle(:,1), particle(:,2), 'red')





