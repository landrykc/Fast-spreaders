%% EESC6664 - Environmental Data Exploration & Analysis
% Team project
% Char, Sky, Kameko, Adam

% ========================================
% Earthquake_Data_Code.m
% Plot earthquake distribution
% ========================================

%% Earthquake Data

clear
clc

load all_data.mat EPR_Earthquake_Data MAR_Earthquake_Data

% EPR_Earthquake_Data & MAR_Earthquake_Data
%       Lat
%       Lon
%       Magnitude
%       Depth

%% Data check
% Map view of sample sites
figure
geoscatter(EPR_Earthquake_Data.Lat, EPR_Earthquake_Data.Lon, '.')
hold on
geoscatter(MAR_Earthquake_Data.Lat, MAR_Earthquake_Data.Lon, '.')
hold off

%% EPR



%% MAR


