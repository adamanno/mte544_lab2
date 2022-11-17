clear
clc

bag1 = ros2bagreader('point1/point1_0.db3');
bag2 = ros2bagreader('point2/point2_0.db3');

% odom1 = select(bag1,"Topic","/odom");
% odom2 = select(bag2,"Topic","/odom");

% scan1 = select(bag1,"Topic","/scan");
% scan2 = select(bag2,"Topic","/scan");


odom1_msgs = readMessages(select(bag1,"Topic","/odom"));
scan1_msgs = readMessages(select(bag1,"Topic","/scan"));

tf1_msgs = readMessages(select(bag1,"Topic","/tf"));
tf_static1_msgs = readMessages(select(bag1,"Topic","/tf_static"));