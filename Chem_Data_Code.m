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
ylim([0 50])
yticks([0 25 50])
xlim([20 70])
set(gca,'Xticklabel',[])
title('EPR')
hold on
subplot(5,2,2)
plot(MAR_Chem_extract.SiO2, MAR_Chem_extract.MgO, '.')
ylim([0 50])
yticks([0 25 50])
set(gca,'Xticklabel',[])
title('MAR')
subplot(5,2,3)
plot(EPR_Chem_extract.SiO2(index), EPR_Chem_extract.K2O(index),'r.')
ylabel('K_2O')
ylim([0 2])
set(gca,'Xticklabel',[])
subplot(5,2,4)
plot(MAR_Chem_extract.SiO2, MAR_Chem_extract.K2O, '.')
ylim([0 2])
set(gca,'Xticklabel',[])
subplot(5,2,5)
plot(EPR_Chem_extract.SiO2(index), EPR_Chem_extract.CaO(index),'r.');
ylabel('CaO')
ylim([0 20])
set(gca,'Xticklabel',[])
subplot(5,2,6)
plot(MAR_Chem_extract.SiO2, MAR_Chem_extract.CaO,'.');
ylim([0 20])
set(gca,'Xticklabel',[])
subplot(5,2,7)
plot(EPR_Chem_extract.SiO2(index), EPR_Chem_extract.Na2O(index),'r.');
ylabel('Na_2O')
yticks([0 2 4])
set(gca,'Xticklabel',[])
subplot(5,2,8)
plot(MAR_Chem_extract.SiO2, MAR_Chem_extract.Na2O,'.');
yticks([0 2 4])
set(gca,'Xticklabel',[])
subplot(5,2,9)
plot(EPR_Chem_extract.SiO2(index), EPR_Chem_extract.Al2O3(index),'r.');
ylabel('Al_2O_3')
ylim([0 30])
xlabel('SiO_2')
subplot(5,2,10)
plot(MAR_Chem_extract.SiO2, MAR_Chem_extract.Al2O3,'.');
ylim([0 30])
xlabel('SiO_2')
hold off





% Harker Diagram - EPR vs MAR -MgO
% figure
% plot(EPR_Chem_extract.SiO2(index), EPR_Chem_extract.MgO(index), '.',...
%     MAR_Chem_extract.SiO2, MAR_Chem_extract.MgO, '.')

%% K20




