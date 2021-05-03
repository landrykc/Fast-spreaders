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

%% Average Composition

% EPR
EPR_meanSiO2 = mean(EPR_Chem_extract.SiO2);
EPR_meanAl2O3 = mean(EPR_Chem_extract.Al2O3);
EPR_meanMgO = mean(EPR_Chem_extract.MgO);
EPR_meanCaO = mean(EPR_Chem_extract.CaO);
EPR_meanNa2O = mean(EPR_Chem_extract.Na2O);
EPR_meanK2O = mean(EPR_Chem_extract.K2O);
EPR_meanOthers = 100 - (EPR_meanSiO2+EPR_meanAl2O3+EPR_meanMgO+EPR_meanCaO+EPR_meanNa2O+EPR_meanK2O);

EPR_meanComposition = [EPR_meanSiO2;
    EPR_meanAl2O3;
    EPR_meanMgO;
    EPR_meanCaO;
    EPR_meanNa2O+EPR_meanK2O;
    EPR_meanOthers];

% MAR
MAR_meanSiO2 = mean(MAR_Chem_extract.SiO2);
MAR_meanAl2O3 = mean(MAR_Chem_extract.Al2O3);
MAR_meanMgO = mean(MAR_Chem_extract.MgO);
MAR_meanCaO = mean(MAR_Chem_extract.CaO);
MAR_meanNa2O = mean(MAR_Chem_extract.Na2O);
MAR_meanK2O = mean(MAR_Chem_extract.K2O);
MAR_meanOthers = 100 - (MAR_meanSiO2+MAR_meanAl2O3+MAR_meanMgO+MAR_meanCaO+MAR_meanNa2O+MAR_meanK2O);

MAR_meanComposition = [MAR_meanSiO2;
    MAR_meanAl2O3;
    MAR_meanMgO;
    MAR_meanCaO;
    MAR_meanNa2O+MAR_meanK2O;
    MAR_meanOthers];

% Plot
EPR_labels = {['SiO_2 (' num2str(EPR_meanSiO2,3) ' %)'];
    ['Al_2O_3 (' num2str(EPR_meanAl2O3,3) ' %)'];
    ['MgO (' num2str(EPR_meanMgO,3) ' %)'];
    ['CaO (' num2str(EPR_meanCaO,3) ' %)'];
    ['Na_2O + K_2O (' num2str(EPR_meanNa2O+EPR_meanK2O,3) ' %)'];
    ['Others: Fe, Ti, ... (' num2str(EPR_meanOthers,3) ' %)']};
MAR_labels = {['SiO_2 (' num2str(MAR_meanSiO2,3) ' %)'];
    ['Al_2O_3 (' num2str(MAR_meanAl2O3,3) ' %)'];
    ['MgO (' num2str(MAR_meanMgO,3) ' %)'];
    ['CaO (' num2str(MAR_meanCaO,3) ' %)'];
    ['Na_2O + K_2O (' num2str(MAR_meanNa2O+EPR_meanK2O,3) ' %)'];
    ['Others: Fe, Ti, ... (' num2str(MAR_meanOthers,3) ' %)']};
explode = [1,0,0,0,0,0];

figure % EPR
pie(EPR_meanComposition, explode, EPR_labels)
set(gca, 'Colormap', lines)
title('Average Composition - EPR')

figure % MAR
pie(MAR_meanComposition, explode, MAR_labels)
set(gca, 'Colormap', lines)
title('Average Composition - MAR')
%% End

%% Average and Standard deviation
%EPR
EPR_stdSiO2 = std(EPR_Chem_extract.SiO2);
EPR_stdAl2O3 = std(EPR_Chem_extract.Al2O3);
EPR_stdMgO = std(EPR_Chem_extract.MgO);
EPR_stdCaO = std(EPR_Chem_extract.CaO);
EPR_stdNa2O = std(EPR_Chem_extract.Na2O);
EPR_stdK2O = std(EPR_Chem_extract.K2O);

%MAR
MAR_stdSiO2 = std(MAR_Chem_extract.SiO2);
MAR_stdAl2O3 = std(MAR_Chem_extract.Al2O3);
MAR_stdMgO = std(MAR_Chem_extract.MgO);
MAR_stdCaO = std(MAR_Chem_extract.CaO);
MAR_stdNa2O = std(MAR_Chem_extract.Na2O);
MAR_stdK2O = std(MAR_Chem_extract.K2O);

%% Test (Change Color and Plot More!)

figure
plot(EPR_Chem_extract.SiO2, EPR_Chem_extract.MgO,'r.')
hold on
e1 = errorbar(EPR_meanSiO2, EPR_meanMgO, EPR_stdSiO2, 'horizontal');
e1.Marker = '.';
e1.MarkerSize = 30;
e1.Color = 'blue';
e2 = errorbar(EPR_meanSiO2, EPR_meanMgO, EPR_stdMgO, 'vertical');
e2.Marker = '.';
e2.MarkerSize = 30;
e2.Color = 'blue';
ylabel('MgO')
ylim([0 50])
yticks([0 25 50])
xlim([40 60])
title('EPR')
hold off
