%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ENPM661 Homework 3
%Author: Shaotu Jia
%Brief: This program is to find fesiable path using RRT algorithm

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

% for loop to generate RRT
for k = 1 : 10
    
    NodeRand = RANDOM_STATE();
    
    NodeNear = NEAREST_NEIGHBOR(NodeRand, closeSet);
    
    NodeNew = NEW_STATE(NodeNear, NodeRand, epsilon);
    
    closeSet(end+1) = NodeNew;
    
    Edge.x = [NodeNew.x  NodeNear.x];
    Edge.y = [NodeNew.y  NodeNear.y];
    
    figure (1); 
    
    line(Edge.x , Edge.y);
    hold on;
    
end





