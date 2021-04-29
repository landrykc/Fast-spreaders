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

%% smoothing topography?

EPR_smooth = movmean(EPR_depth_data.Depth,50);%smoothing data
MAR_smooth = movmean(MAR_depth_data.Depth,50);%smoothing data
[EPR_max,EPR_max_index] = max(EPR_smooth);%find middle EPR
[MAR_max,MAR_max_index] = max(MAR_smooth);%find middle MAR
EPR_dist = EPR_depth_data.Dist(EPR_max_index);
MAR_dist = MAR_depth_data.Dist(MAR_max_index);

%% Data check

figure
ax1 = subplot(2,1,1)
plot(EPR_depth_data.Dist, EPR_smooth)
xlim([46.5 546.5]);
xticks([96.5 146.5 196.5 246.5 296.5 346.5 396.5 446.5 496.5])
xticklabels({'200','150','100','50','0','50','100','150','200'})
ax2 = subplot(2,1,2)
plot(MAR_depth_data.Dist, MAR_smooth)
xlim([721.6 1221.6]);


