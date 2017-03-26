%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ENPM661 Homework 3
%Author: Shaotu Jia
%Brief: This program is to find fesiable path using RRT algorithm

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear;
close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Set up the size of Confirguration Space 100 * 100
Sx = int8(0:100);
Sy = int8(0:100);

% Initialize Problem_1 requirements
start.x = 75;
start.y = 85;
start.previous.x = -1;
start.previous.y = -1;
goal.x = 100;
goal.y = 0;
goal.R = 20;
epsilon = 10; % the increment of every step

% Initialize NodeInitial
NodeInit = start;

% Add NodeInit to closeSet
closeSet = NodeInit;

%Initialize Maximum Node Number
K = 1000;

%Initialize NodeNew
NodeNew = start;

%Initialize the figure
figure(1), axis ([0 100 0 100]), hold on;

% for loop to generate RRT
for k = 1 : K
    
    NodeRand = RANDOM_STATE();
    
    NodeNear = NEAREST_NEIGHBOR(NodeRand, closeSet);
    
    NodeTemp = NEW_STATE(NodeNear, NodeRand, epsilon);
    
    if InObstacle(NodeTemp) == false
        NodeNew = NodeTemp;
        
       closeSet(end+1) = NodeNew;
    
    %Generate Edge for draw
    Edge.x = [NodeNew.x  NodeNear.x];
    Edge.y = [NodeNew.y  NodeNear.y];
 
    %Draw RRT trees  
    line(Edge.x , Edge.y);
    hold on;
    end
    
    if findGoal(NodeNew,goal) == true 
        goal.previous = NodeNew;
        reconstructPath(start , goal);
        disp('find the goal');
        return;
        
    end
              
    
end





