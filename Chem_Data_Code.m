%% EESC6664 - Environmental Data Exploration & Analysis
% Team project
% Char, Sky, Kameko, Adam

% ========================================
% Chem_Data_Code.m
% For geochemical analysis
% 
% Original chem dataset
% EPR_Chem_Data, MAR_Chem_Data
% 
% Recommend using processed subset
% EPR_Chem_extract MAR_Chem_extract
% ========================================

%% Chem Data

clear
clc

load all_data.mat EPR_Chem_extract MAR_Chem_extract

% EPR_Chem_extract & MAR_Chem_extract
%       Lat
%       Lon
%       SiO2
%       Al2O3
%       MgO
%       CaO
%       Na2O
%       K2O

%% Data check
% Map view of sample sites
figure
geoscatter(EPR_Chem_extract.Lat, EPR_Chem_extract.Lon, '.')
hold on
geoscatter(MAR_Chem_extract.Lat, MAR_Chem_extract.Lon, '.')
hold off

% Harker Diagram - EPR vs MAR
figure
plot(EPR_Chem_extract.SiO2, EPR_Chem_extract.Al2O3, '.',...
    MAR_Chem_extract.SiO2, MAR_Chem_extract.Al2O3, '.')

%% EPR



%% MAR


