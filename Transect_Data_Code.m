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

% load all_data 4.mat EPR_depth_data MAR_depth_data

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

%% Slope

% EPR

EPR_PfitL = polyfit(EPR_depth_data.Dist(1:EPR_max_index),EPR_smooth(1:EPR_max_index),1);

EPR_slopeL = EPR_PfitL(1);
EPR_interceptL = EPR_PfitL(2);

EPR_polyvalL = (polyval(EPR_PfitL,EPR_depth_data.Dist(1:EPR_max_index)))/1000;
% divide by 1000 to convert to km

%now for the right side of the ridge

EPR_PfitR = polyfit(EPR_depth_data.Dist(EPR_max_index:end),EPR_smooth(EPR_max_index:end),1);

EPR_slopeR = EPR_PfitR(1);
EPR_interceptR = EPR_PfitR(2);

EPR_polyvalR = (polyval(EPR_PfitR,EPR_depth_data.Dist(EPR_max_index:end)))/1000;

EPR_slope_avg = (EPR_slopeL + (-1.*EPR_slopeR))/2;

%%
% Left side of MAR

MAR_PfitL = polyfit(MAR_depth_data.Dist(1:MAR_max_index),MAR_smooth(1:MAR_max_index),1);

MAR_slopeL = MAR_PfitL(1);
MAR_interceptL = MAR_PfitL(2);

MAR_polyvalL = (polyval(MAR_PfitL,MAR_depth_data.Dist(1:MAR_max_index)))/1000;

%Right side of MAR

MAR_PfitR = polyfit(MAR_depth_data.Dist(MAR_max_index:end),MAR_smooth(MAR_max_index:end),1);

MAR_slopeR = MAR_PfitR(1);
MAR_interceptR = MAR_PfitR(2);

MAR_polyvalR = (polyval(MAR_PfitR,MAR_depth_data.Dist(MAR_max_index:end)))/1000;

MAR_slope_avg = (MAR_slopeL + (-1.*MAR_slopeR))/2;

%% Transects for EPR & MAR

figure
subplot(2,1,1)
plot(EPR_depth_data.Dist, abs(EPR_smooth/1000))
hold on
plot(EPR_depth_data.Dist(1:EPR_max_index),(-1.*EPR_polyvalL),'g')
hold on
plot(EPR_depth_data.Dist(EPR_max_index:end),(-1.*EPR_polyvalR),'m')
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
hold on
plot(MAR_depth_data.Dist(1:MAR_max_index),(-1.*MAR_polyvalL),'g')
hold on
plot(MAR_depth_data.Dist(MAR_max_index:end),(-1.*MAR_polyvalR),'m')
set(gca, 'YDir', 'reverse')
xline(MAR_dist, ':')
xlim([MAR_dist-50*5 MAR_dist+50*5])
ylim([2.5 4.5])
xlabel('Distance from ridge axis (km)')
ylabel('Depth (km)')
xticks(MAR_dist-50*4:50:MAR_dist+50*4)
xticklabels({'200','150','100','50','0','50','100','150','200'})
title('MAR')


