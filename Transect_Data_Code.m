%% EESC6664 - Environmental Data Exploration & Analysis
% Team project
% Char, Sky, Kameko, Adam

%% Transect Data 
% (Depth, Gravity Anomaly, Magnetic Anomaly, Free Air Anomaly)

clear
clc

load all_data.mat EPR_depth_data MAR_depth_data

% Data check
figure
plot(EPR_depth_data.Dist, EPR_depth_data.Depth)

figure
plot(MAR_depth_data.Dist, MAR_depth_data.Depth)
