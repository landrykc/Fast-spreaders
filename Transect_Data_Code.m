%% EESC6664 - Environmental Data Exploration & Analysis
% Team project
% Char, Sky, Kameko, Adam

% ========================================
% Transect_Data_Code.m
% Create depth profile along transect
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

%% Smoothing Topography

EPR_smooth = movmean(EPR_depth_data.Depth,14); % smoothing data
MAR_smooth = movmean(MAR_depth_data.Depth,4); % smoothing data
[EPR_max,EPR_max_index] = max(EPR_smooth); % find middle EPR
[MAR_max,MAR_max_index] = max(MAR_smooth); % find middle MAR
EPR_dist = EPR_depth_data.Dist(EPR_max_index);
MAR_dist = MAR_depth_data.Dist(MAR_max_index);

%% Data check

% figure
% plot(EPR_depth_data.Dist, EPR_depth_data.Depth)
% 
% figure
% plot(MAR_depth_data.Dist, MAR_depth_data.Depth)

%% Transects for EPR & MAR

figure
subplot(2,1,1)
plot(EPR_depth_data.Dist, abs(EPR_smooth/1000))
set(gca, 'YDir', 'reverse')
xline(EPR_dist, ':')
xlim([EPR_dist-50*5 EPR_dist+50*5])
ylim([2.5 4.5])
ylabel('Depth (km)')
xticks(EPR_dist-50*4:50:EPR_dist+50*4)
xticklabels({'200','150','100','50','0','50','100','150','200'})
title('EPR')

subplot(2,1,2)
plot(MAR_depth_data.Dist, abs(MAR_smooth/1000))
set(gca, 'YDir', 'reverse')
xline(MAR_dist, ':')
xlim([MAR_dist-50*5 MAR_dist+50*5])
ylim([2.5 4.5])
xlabel('Distance from ridge axis (km)')
ylabel('Depth (km)')
xticks(MAR_dist-50*4:50:MAR_dist+50*4)
xticklabels({'200','150','100','50','0','50','100','150','200'})
title('MAR')

%% Slope

% EPR


% MAR

