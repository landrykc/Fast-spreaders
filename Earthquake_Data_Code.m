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
%       Magnitude (M > 5, 1960-2020)
%       Depth

addpath('Data Files')
% /Data Files/EPR_all_data.nc
% /Data Files/MAR_all_data.nc

%% Read nc-files

% EPR
[EPR_Lon, EPR_Lat, EPR_Depth] = grdread2('EPR_all_data1.nc');

% MAR
[MAR_Lon, MAR_Lat, MAR_Depth] = grdread2('MAR_all_data1.nc');

%% Data check
% Map view of sample sites
% figure
% geoscatter(EPR_Earthquake_Data.Lat, EPR_Earthquake_Data.Lon, '.')
% hold on
% geoscatter(MAR_Earthquake_Data.Lat, MAR_Earthquake_Data.Lon, '.')
% hold off

%% Earthquake Clusters

figure

% EPR
subplot(2,1,1)
imagesc(EPR_Lon, EPR_Lat, EPR_Depth)
hold on
scatter(EPR_Earthquake_Data.Lon, EPR_Earthquake_Data.Lat,10,[0.9290 0.6940 0.1250],'filled')
axis xy
set(gca,'DataAspectRatio',[1 1 1])
cmocean('-deep')
colorbar('location','eastoutside')
title('M > 5 Epicenters (1960-2020) at the East Pacific Rise, Transect 9N')
yticklabels({'7°N','8°N','9°N','10°N','11°N','12°N'})
xticklabels({'110°W','108°W','106°W','104°W','102°W','100°W','98°W'})
hold off

% MAR
subplot(2,1,2)
imagesc(MAR_Lon, MAR_Lat, MAR_Depth)
hold on
scatter(MAR_Earthquake_Data.Lon, MAR_Earthquake_Data.Lat,10,[0.4940 0.1840 0.5560],'filled')
axis xy
set(gca,'DataAspectRatio',[1 1 1])
cmocean('-deep')
colorbar('location','eastoutside')
title('M > 5 Epicenters (1960-2020) at the Northern Mid-Atlantic Ridge')
yticklabels({'22°N','24°N','26°N','28°N','30°N'})
xticklabels({'55°W','50°W','45°W','40°W','35°W'})
hold off

%% Histogram

edges = 5:0.2:7;

figure

% EPR
subplot(2,1,1)
histogram(EPR_Earthquake_Data.Magnitude,edges,'FaceColor',[0.8500 0.3250 0.0980])
text(6.6,90,['Total = ' num2str(size(EPR_Earthquake_Data,1))],'FontSize',12)
ylim([0,120])
ylabel('Counts')
% xticks(5.1:0.2:6.9)
% xticklabels({'5.0-5.2','5.2-5.4','5.4-5.6','5.6-5.8','5.8-6.0','6.0-6.2','6.2-6.4','6.4-6.6','6.6-6.8','6.8-7.0'})
title('EPR M > 5 Earthquake Distribution (1960-2020)')

% MAR
subplot(2,1,2)
histogram(MAR_Earthquake_Data.Magnitude,edges,'FaceColor',[0 0.4470 0.7410])
text(6.6,90,['Total = ' num2str(size(MAR_Earthquake_Data,1))],'FontSize',12)
ylim([0,120])
ylabel('Counts')
% xticks(5.1:0.2:6.9)
% xticklabels({'5.0-5.2','5.2-5.4','5.4-5.6','5.6-5.8','5.8-6.0','6.0-6.2','6.2-6.4','6.4-6.6','6.6-6.8','6.8-7.0'})
xlabel('Magnitude')
title('MAR M > 5 Earthquake Distribution (1960-2020)')

%% Average Magnitude and Standard Deviations

EPR_mag_avg = mean(EPR_Earthquake_Data.Magnitude);

EPR_mag_std = std(EPR_Earthquake_Data.Magnitude);

MAR_mag_avg = mean(MAR_Earthquake_Data.Magnitude);

MAR_mag_std = std(MAR_Earthquake_Data.Magnitude);

%% Area of Study

EPR_max_lon = max(EPR_Earthquake_Data.Lon);

EPR_min_lon = min(EPR_Earthquake_Data.Lon);


EPR_max_lat = max(EPR_Earthquake_Data.Lat);

EPR_min_lat = min(EPR_Earthquake_Data.Lat);


MAR_max_lon = max(MAR_Earthquake_Data.Lon);

MAR_min_lon = min(MAR_Earthquake_Data.Lon);


MAR_max_lat = max(MAR_Earthquake_Data.Lat);

MAR_min_lat = min(MAR_Earthquake_Data.Lat);


%% End





