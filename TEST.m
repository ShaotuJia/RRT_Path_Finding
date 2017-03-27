clc;
clear;
close all;

%This script is to test functions
NodeNear.x = 2;
NodeNear.y = 4;
NodeTemp.x = 4;
NodeTemp.y = 4;
Center.x = 3;
Center.y = 1;

dist = lineToCenter(NodeNear , NodeTemp , Center);
