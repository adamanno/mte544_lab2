clear
clc

% open bags
bag1 = ros2bagreader('point1/point1_0.db3');
bag2 = ros2bagreader('point2/point2_0.db3');

% read bag 1
odom1_msgs = readMessages(select(bag1,"Topic","/odom"));
scan1_msgs = readMessages(select(bag1,"Topic","/scan"));

tf1_msgs = readMessages(select(bag1,"Topic","/tf"));
tf_static1_msgs = readMessages(select(bag1,"Topic","/tf_static"));

save('data/topicData_point1.mat', 'odom1_msgs', 'scan1_msgs', 'tf1_msgs','tf_static1_msgs')

% read bag 2
odom2_msgs = readMessages(select(bag2,"Topic","/odom"));
scan2_msgs = readMessages(select(bag2,"Topic","/scan"));

tf2_msgs = readMessages(select(bag2,"Topic","/tf"));
tf_static2_msgs = readMessages(select(bag2,"Topic","/tf_static"));

save('data/topicData_point2.mat', 'odom2_msgs', 'scan2_msgs', 'tf2_msgs','tf_static2_msgs')

