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

% clear
% clc

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
% figure
% geoscatter(EPR_Chem_extract.Lat, EPR_Chem_extract.Lon, '.')
% hold on
% geoscatter(MAR_Chem_extract.Lat, MAR_Chem_extract.Lon, '.')
% hold off

% Find southern segment of EPR
index = EPR_Chem_extract.Lat > 0 & EPR_Chem_extract.Lat < 14;
EPR_Chem_South_Lat = EPR_Chem_extract.Lat(index);
EPR_Chem_South_Lon = EPR_Chem_extract.Lon(index);

% Updated map
% figure
% geoscatter(EPR_Chem_South_Lat, EPR_Chem_South_Lon, '.')
% hold on
% geoscatter(MAR_Chem_extract.Lat, MAR_Chem_extract.Lon, '.')
% hold off

%% Harker Diagrams

figure
tiledlayout(5,2,'TileSpacing','compact') 

% Tile 1 - R 1, C 1
nexttile
plot(EPR_Chem_extract.SiO2, EPR_Chem_extract.MgO,'r.')
ylabel('MgO')
ylim([0 50])
yticks([0 25 50])
xlim([40 60])
set(gca,'Xticklabel',[])
title('EPR')
hold on

% Tile 2 - R 1, C 2
nexttile
plot(MAR_Chem_extract.SiO2, MAR_Chem_extract.MgO, '.')
ylim([0 50])
yticks([0 25 50])
xlim([40 60])
set(gca,'Xticklabel',[])
title('MAR')

% Tile 3 - R 2, C 1
nexttile
plot(EPR_Chem_extract.SiO2(index), EPR_Chem_extract.K2O(index),'r.')
ylabel('K_2O')
ylim([0 2])
xlim([40 60])
set(gca,'Xticklabel',[])

% Tile 4 - R 2, C 2
nexttile
plot(MAR_Chem_extract.SiO2, MAR_Chem_extract.K2O, '.')
ylim([0 2])
xlim([40 60])
set(gca,'Xticklabel',[])

% Tile 5 - R 3, C 1
nexttile
plot(EPR_Chem_extract.SiO2(index), EPR_Chem_extract.CaO(index),'r.');
ylabel('CaO')
ylim([0 20])
xlim([40 60])
set(gca,'Xticklabel',[])

% Tile 6 - R 3, C 2
nexttile
plot(MAR_Chem_extract.SiO2, MAR_Chem_extract.CaO,'.');
ylim([0 20])
xlim([40 60])
set(gca,'Xticklabel',[])

% Tile 7 - R 4, C 1
nexttile
plot(EPR_Chem_extract.SiO2(index), EPR_Chem_extract.Na2O(index),'r.');
ylabel('Na_2O')
yticks([0 2 4 6])
ylim([0 6])
xlim([40 60])
set(gca,'Xticklabel',[])

% Tile 8 - R 4, C 2
nexttile
plot(MAR_Chem_extract.SiO2, MAR_Chem_extract.Na2O,'.');
yticks([0 2 4 6])
ylim([0 6])
xlim([40 60])
set(gca,'Xticklabel',[])

% Tile 9 - R 5, C 1
nexttile
plot(EPR_Chem_extract.SiO2(index), EPR_Chem_extract.Al2O3(index),'r.');
ylabel('Al_2O_3')
ylim([0 30])
xlim([40 60])
xlabel('SiO_2')

% Tile 10 - R 5, C 2
nexttile
plot(MAR_Chem_extract.SiO2, MAR_Chem_extract.Al2O3,'.');
ylim([0 30])
xlim([40 60])
xlabel('SiO_2')
hold off

%% 
