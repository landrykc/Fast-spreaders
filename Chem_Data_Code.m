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
figure
geoscatter(EPR_Chem_extract.Lat, EPR_Chem_extract.Lon, '.')
hold on
geoscatter(MAR_Chem_extract.Lat, MAR_Chem_extract.Lon, '.')
hold off

% Harker Diagram - EPR vs MAR
figure
plot(EPR_Chem_extract.SiO2, EPR_Chem_extract.Al2O3, '.',...
    MAR_Chem_extract.SiO2, MAR_Chem_extract.Al2O3, '.')

%% MgO

index = EPR_Chem_extract.Lat<0;
EPR_Chem_South_Lat = EPR_Chem_extract.Lat(index);

% index1 = EPR_Chem_extract.Lon<0;
EPR_Chem_South_Lon = EPR_Chem_extract.Lon(index);

figure
geoscatter(EPR_Chem_South_Lat, EPR_Chem_South_Lon, '.')
hold on
geoscatter(MAR_Chem_extract.Lat, MAR_Chem_extract.Lon, '.')
hold off

subplot(5,2,1)
plot(EPR_Chem_extract.SiO2, EPR_Chem_extract.MgO,'r.')
ylabel('MgO')
hold on
subplot(5,2,2)
plot(MAR_Chem_extract.SiO2, MAR_Chem_extract.MgO, '.')
subplot(5,2,3)
plot(EPR_Chem_extract.SiO2(index), EPR_Chem_extract.K2O(index),'r.')
ylabel('K_2O')
subplot(5,2,4)
plot(MAR_Chem_extract.SiO2, MAR_Chem_extract.K2O, '.')
subplot(5,2,5)
plot(EPR_Chem_extract.SiO2(index), EPR_Chem_extract.CaO(index),'r.');
ylabel('CaO')
subplot(5,2,6)
plot(MAR_Chem_extract.SiO2, MAR_Chem_extract.CaO,'.');
subplot(5,2,7)
plot(EPR_Chem_extract.SiO2(index), EPR_Chem_extract.Na2O(index),'r.');
ylabel('Na_2O')
subplot(5,2,8)
plot(MAR_Chem_extract.SiO2, MAR_Chem_extract.Na2O,'.');
subplot(5,2,9)
plot(EPR_Chem_extract.SiO2(index), EPR_Chem_extract.Al2O3(index),'r.');
ylabel('Al_2O_3')
subplot(5,2,10)
plot(MAR_Chem_extract.SiO2, MAR_Chem_extract.Al2O3,'.');
hold off





% Harker Diagram - EPR vs MAR -MgO
% figure
% plot(EPR_Chem_extract.SiO2(index), EPR_Chem_extract.MgO(index), '.',...
%     MAR_Chem_extract.SiO2, MAR_Chem_extract.MgO, '.')

%% K20




