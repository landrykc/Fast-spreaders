%% EESC6664 - Environmental Data Exploration & Analysis
% Team project
% Char, Sky, Kameko, Adam

% ========================================
% Bathymetry_Code.m
% Create top-down bathymetry map
% ========================================

%% Bathymetry Input

addpath('Data Files')
% /Data Files/EPR_all_data.nc
% /Data Files/MAR_all_data.nc

%% EPR

[X_EPR, Y_EPR, Z_EPR] = grdread2('EPR_all_data1.nc');

figure
imagesc(X_EPR, Y_EPR, Z_EPR)
axis xy
set(gca,'DataAspectRatio',[1 1 1])
colorbar






%% MAR

[MAR_Lon, MAR_Lat, MAR_Depth] = grdread2('MAR_all_data1.nc');

figure
imagesc(MAR_Lon, MAR_Lat, MAR_Depth)
axis xy
set(gca,'DataAspectRatio',[1 1 1])
colorbar
