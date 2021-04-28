%% EESC6664 - Environmental Data Exploration & Analysis
% Team project
% Char, Sky, Kameko, Adam

% ========================================
% Transect_Data_Code.m
% Create bathymetry plot along transect
% ========================================

%% Transect Data 

% clear
% clc

load all_data.mat EPR_depth_data MAR_depth_data

% EPR_depth_data & MAR_depth_data
%       Lon
%       Lat
%       Dist
%       FAA (Free Air Anomaly)
%       MA (Magnetic Anomaly)
%       GA (Gravity Anomaly)
%       Depth

%% Data check

figure
plot(EPR_depth_data.Dist, EPR_depth_data.Depth)

figure
plot(MAR_depth_data.Dist, MAR_depth_data.Depth)
