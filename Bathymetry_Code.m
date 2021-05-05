%% EESC6664 - Environmental Data Exploration & Analysis
% Team project
% Char, Sky, Kameko, Adam

% ========================================
% Bathymetry_Code.m
% Create top-down bathymetry map
% ========================================

%% Bathymetry Input

clear
clc

addpath('Data Files')
% /Data Files/EPR_all_data.nc
% /Data Files/MAR_all_data.nc

% Chem sample sites
load all_data.mat EPR_Chem_extract MAR_Chem_extract
% Find 9N segment of EPR
index = EPR_Chem_extract.Lat > 0 & EPR_Chem_extract.Lat < 14;

% Transect locations
load all_data.mat EPR_depth_data MAR_depth_data

% Earthquake locations (M > 5)
load all_data.mat EPR_Earthquake_Data MAR_Earthquake_Data

% Color Scheme
ColorEPR = [0.84 0.46 0];
ColorMAR = [0.38 0.51 0.74];
ColorBarEPR = [0.61 0.15 0.01];
ColorBarMAR = [0.28 0.22 0.47];

%% Read nc-files

% EPR
[EPR_Lon, EPR_Lat, EPR_Depth] = grdread2('EPR_all_data1.nc');

% MAR
[MAR_Lon, MAR_Lat, MAR_Depth] = grdread2('MAR_all_data1.nc');

%% EPR Map

figure
imagesc(EPR_Lon, EPR_Lat, EPR_Depth)
hold on
plot(EPR_depth_data.Lon, EPR_depth_data.Lat,'LineWidth',2,'Color',ColorEPR)
scatter(EPR_Chem_extract.Lon(index),EPR_Chem_extract.Lat(index),20,[0.85 0.47 0.89],'filled')
axis xy
set(gca,'DataAspectRatio',[1 1 1])
cmocean('-deep')
colorbar('location','eastoutside')
title('Bathymetric Map of the East Pacific Rise, Transect 9N')
yticklabels({'7°N','8°N','9°N','10°N','11°N','12°N'})
xticklabels({'110°W','108°W','106°W','104°W','102°W','100°W','98°W'})
hold off

%% MAR Map

figure
imagesc(MAR_Lon, MAR_Lat, MAR_Depth)
hold on
plot(MAR_depth_data.Lon, MAR_depth_data.Lat,'LineWidth',2,'Color',ColorMAR)
scatter(MAR_Chem_extract.Lon,MAR_Chem_extract.Lat,20,[0.85 0.47 0.89],'filled')
axis xy
set(gca,'DataAspectRatio',[1 1 1])
cmocean('-deep')
colorbar('location','eastoutside')
title('Bathymetric Map of the Northern Mid-Atlantic Ridge')
yticklabels({'22°N','24°N','26°N','28°N','30°N'})
xticklabels({'55°W','50°W','45°W','40°W','35°W'})
hold off

%% End
