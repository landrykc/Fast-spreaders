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

% Color scheme
ColorEPR = [0.84 0.46 0];
ColorMAR = [0.38 0.51 0.74];
ColorBarEPR = [0.61 0.15 0.01];
ColorBarMAR = [0.28 0.22 0.47];

%% Data check

% Remove obvious data outliers, defined as SiO2 < 1
outlier = EPR_Chem_extract.SiO2 < 1;
EPR_Chem_extract(outlier,:) = [];
clear outlier

% Map view of sample sites
% figure
% geoscatter(EPR_Chem_extract.Lat, EPR_Chem_extract.Lon, '.')
% hold on
% geoscatter(MAR_Chem_extract.Lat, MAR_Chem_extract.Lon, '.')
% hold off

% Find 9N segment of EPR
index = EPR_Chem_extract.Lat > 0 & EPR_Chem_extract.Lat < 14;

% EPR_Chem_South_Lat = EPR_Chem_extract.Lat(index);
% EPR_Chem_South_Lon = EPR_Chem_extract.Lon(index);

% Updated map
% figure
% geoscatter(EPR_Chem_South_Lat, EPR_Chem_South_Lon, '.')
% hold on
% geoscatter(MAR_Chem_extract.Lat, MAR_Chem_extract.Lon, '.')
% hold off

%% Minor Elements (excluding Si, Al, Mg, Ca, Na, K)

% EPR
EPR_Others = 100 - sum(EPR_Chem_extract{:,5:10},2);

% MAR
MAR_Others = 100 - sum(MAR_Chem_extract{:,5:10},2);

%% Average Composition

% EPR
EPR_meanSiO2 = mean(EPR_Chem_extract.SiO2(index));
EPR_meanAl2O3 = mean(EPR_Chem_extract.Al2O3(index));
EPR_meanMgO = mean(EPR_Chem_extract.MgO(index));
EPR_meanCaO = mean(EPR_Chem_extract.CaO(index));
EPR_meanNa2O = mean(EPR_Chem_extract.Na2O(index));
EPR_meanK2O = mean(EPR_Chem_extract.K2O(index));
EPR_meanOthers = mean(EPR_Others(index));

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
MAR_meanOthers = mean(MAR_Others);

MAR_meanComposition = [MAR_meanSiO2;
    MAR_meanAl2O3;
    MAR_meanMgO;
    MAR_meanCaO;
    MAR_meanNa2O+MAR_meanK2O;
    MAR_meanOthers];

% % Pie Charts
% EPR_labels = {['SiO_2 (' num2str(EPR_meanSiO2,3) ' %)'];
%     ['Al_2O_3 (' num2str(EPR_meanAl2O3,3) ' %)'];
%     ['MgO (' num2str(EPR_meanMgO,3) ' %)'];
%     ['CaO (' num2str(EPR_meanCaO,3) ' %)'];
%     ['Na_2O + K_2O (' num2str(EPR_meanNa2O+EPR_meanK2O,3) ' %)'];
%     ['Others: Fe, Ti, ... (' num2str(EPR_meanOthers,3) ' %)']};
% MAR_labels = {['SiO_2 (' num2str(MAR_meanSiO2,3) ' %)'];
%     ['Al_2O_3 (' num2str(MAR_meanAl2O3,3) ' %)'];
%     ['MgO (' num2str(MAR_meanMgO,3) ' %)'];
%     ['CaO (' num2str(MAR_meanCaO,3) ' %)'];
%     ['Na_2O + K_2O (' num2str(MAR_meanNa2O+EPR_meanK2O,3) ' %)'];
%     ['Others: Fe, Ti, ... (' num2str(MAR_meanOthers,3) ' %)']};
% 
% % slice offset
% explode = [1,0,0,0,0,0];
% 
% figure % EPR
% pie(EPR_meanComposition, explode, EPR_labels)
% set(gca, 'Colormap', lines)
% title('EPR - Average Composition')
% 
% figure % MAR
% pie(MAR_meanComposition, explode, MAR_labels)
% set(gca, 'Colormap', lines)
% title('MAR - Average Composition')

%% Standard Deviation of Each Component

% EPR
EPR_stdSiO2 = std(EPR_Chem_extract.SiO2(index));
EPR_stdAl2O3 = std(EPR_Chem_extract.Al2O3(index));
EPR_stdMgO = std(EPR_Chem_extract.MgO(index));
EPR_stdCaO = std(EPR_Chem_extract.CaO(index));
EPR_stdNa2O = std(EPR_Chem_extract.Na2O(index));
EPR_stdK2O = std(EPR_Chem_extract.K2O(index));

% MAR
MAR_stdSiO2 = std(MAR_Chem_extract.SiO2);
MAR_stdAl2O3 = std(MAR_Chem_extract.Al2O3);
MAR_stdMgO = std(MAR_Chem_extract.MgO);
MAR_stdCaO = std(MAR_Chem_extract.CaO);
MAR_stdNa2O = std(MAR_Chem_extract.Na2O);
MAR_stdK2O = std(MAR_Chem_extract.K2O);

%% Standard error of the mean 
% Equation: standard error = std / sqrt(number of samples)

% EPR
EPR_sample_number = length(EPR_Chem_extract.SiO2(index));

EPR_errSiO2 = EPR_stdSiO2 / sqrt(EPR_sample_number);
EPR_errAl2O3 = EPR_stdAl2O3 / sqrt(EPR_sample_number);
EPR_errMgO = EPR_stdMgO / sqrt(EPR_sample_number);
EPR_errCaO = EPR_stdCaO / sqrt(EPR_sample_number);
EPR_errNa2O_K2O = std(EPR_Chem_extract.Na2O(index)+EPR_Chem_extract.K2O(index)) / sqrt(EPR_sample_number);
EPR_errOthers = std(EPR_Others(index)) / sqrt(EPR_sample_number);

EPR_error = [EPR_errSiO2;
    EPR_errAl2O3;
    EPR_errMgO;
    EPR_errCaO;
    EPR_errNa2O_K2O;
    EPR_errOthers];

% MAR
MAR_sample_number = length(MAR_Chem_extract.SiO2);

MAR_errSiO2 = MAR_stdSiO2 / sqrt(MAR_sample_number);
MAR_errAl2O3 = MAR_stdAl2O3 / sqrt(MAR_sample_number);
MAR_errMgO = MAR_stdMgO / sqrt(MAR_sample_number);
MAR_errCaO = MAR_stdCaO / sqrt(MAR_sample_number);
MAR_errNa2O_K2O = std(MAR_Chem_extract.Na2O+MAR_Chem_extract.K2O) / sqrt(MAR_sample_number);
MAR_errOthers = std(MAR_Others) / sqrt(MAR_sample_number);

MAR_error = [MAR_errSiO2;
    MAR_errAl2O3;
    MAR_errMgO;
    MAR_errCaO;
    MAR_errNa2O_K2O;
    MAR_errOthers];

%% Bar Charts with Standard Error
% Updated from previous pie charts

bar_labels = {'SiO_2';
    'Al_2O_3';
    'MgO';
    'CaO';
    'Na_2O+K_2O';
    'Others (Fe, Ti, ...)'};

figure
b = bar([EPR_meanComposition MAR_meanComposition]);
hold on
errorbar(b(1).XEndPoints',EPR_meanComposition,EPR_error,'k','LineStyle','none')
errorbar(b(2).XEndPoints',MAR_meanComposition,MAR_error,'k','LineStyle','none')
b(1).FaceColor = ColorEPR;
b(2).FaceColor = ColorMAR;
xlabel('Elements')
xticklabels(bar_labels)
ylabel('Mean composition (wt %)')
title('Average Chemical Composition of EPR and MAR')
legend('EPR Mean', 'MAR Mean', 'Standard Error')

%% Harker Diagrams (with Std)

figure
tiledlayout(5,2,'TileSpacing','compact')

% Tile 1 - R 1, C 1
nexttile
plot(EPR_Chem_extract.SiO2(index), EPR_Chem_extract.MgO(index),'.','Color',ColorEPR,'MarkerSize',5)
hold on
e1 = errorbar(EPR_meanSiO2, EPR_meanMgO, EPR_stdSiO2, 'horizontal');
e1.Marker = '.';
e1.MarkerSize = 10;
e1.Color = ColorBarEPR;
e1.LineWidth = 1.5;
e2 = errorbar(EPR_meanSiO2, EPR_meanMgO, EPR_stdMgO, 'vertical');
e2.Marker = '.';
e2.MarkerSize = 10;
e2.Color = ColorBarEPR;
e2.LineWidth = 1.5;
ylabel('MgO')
ylim([0 50])
yticks([0 25 50])
xlim([40 60])
set(gca,'Xticklabel',[])
title('EPR')
hold off

% Tile 2 - R 1, C 2
nexttile
plot(MAR_Chem_extract.SiO2, MAR_Chem_extract.MgO,'.','Color',ColorMAR,'MarkerSize',5)
hold on
e1 = errorbar(MAR_meanSiO2, MAR_meanMgO, MAR_stdSiO2, 'horizontal');
e1.Marker = '.';
e1.MarkerSize = 10;
e1.Color = ColorBarMAR;
e1.LineWidth = 1.5;
e2 = errorbar(MAR_meanSiO2, MAR_meanMgO, MAR_stdMgO, 'vertical');
e2.Marker = '.';
e2.MarkerSize = 10;
e2.Color = ColorBarMAR;
e2.LineWidth = 1.5;
ylim([0 50])
yticks([0 25 50])
xlim([40 60])
set(gca,'Xticklabel',[])
title('MAR')
hold off

% Tile 3 - R 2, C 1
nexttile
plot(EPR_Chem_extract.SiO2(index), EPR_Chem_extract.K2O(index),'.','Color',ColorEPR,'MarkerSize',5)
ylabel('K_2O')
hold on
e1 = errorbar(EPR_meanSiO2, EPR_meanK2O, EPR_stdSiO2, 'horizontal');
e1.Marker = '.';
e1.MarkerSize = 10;
e1.Color = ColorBarEPR;
e1.LineWidth = 1.5;
e2 = errorbar(EPR_meanSiO2, EPR_meanK2O, EPR_stdK2O, 'vertical');
e2.Marker = '.';
e2.MarkerSize = 10;
e2.Color = ColorBarEPR;
e2.LineWidth = 1.5;
ylim([0 2])
xlim([40 60])
set(gca,'Xticklabel',[])
hold off

% Tile 4 - R 2, C 2
nexttile
plot(MAR_Chem_extract.SiO2, MAR_Chem_extract.K2O,'.','Color',ColorMAR,'MarkerSize',5)
hold on
e1 = errorbar(MAR_meanSiO2, MAR_meanK2O, MAR_stdSiO2, 'horizontal');
e1.Marker = '.';
e1.MarkerSize = 10;
e1.Color = ColorBarMAR;
e1.LineWidth = 1.5;
e2 = errorbar(MAR_meanSiO2, MAR_meanK2O, MAR_stdK2O, 'vertical');
e2.Marker = '.';
e2.MarkerSize = 10;
e2.Color = ColorBarMAR;
e2.LineWidth = 1.5;
ylim([0 2])
xlim([40 60])
set(gca,'Xticklabel',[])
hold off

% Tile 5 - R 3, C 1
nexttile
plot(EPR_Chem_extract.SiO2(index), EPR_Chem_extract.CaO(index),'.','Color',ColorEPR,'MarkerSize',5)
hold on
e1 = errorbar(EPR_meanSiO2, EPR_meanCaO, EPR_stdSiO2, 'horizontal');
e1.Marker = '.';
e1.MarkerSize = 10;
e1.Color = ColorBarEPR;
e1.LineWidth = 1.5;
e2 = errorbar(EPR_meanSiO2, EPR_meanCaO, EPR_stdCaO, 'vertical');
e2.Marker = '.';
e2.MarkerSize = 10;
e2.Color = ColorBarEPR;
e2.LineWidth = 1.5;
ylabel('CaO')
ylim([0 20])
xlim([40 60])
set(gca,'Xticklabel',[])
hold off

% Tile 6 - R 3, C 2
nexttile
plot(MAR_Chem_extract.SiO2, MAR_Chem_extract.CaO,'.','Color',ColorMAR,'MarkerSize',5)
hold on
e1 = errorbar(MAR_meanSiO2, MAR_meanCaO, MAR_stdSiO2, 'horizontal');
e1.Marker = '.';
e1.MarkerSize = 10;
e1.Color = ColorBarMAR;
e1.LineWidth = 1.5;
e2 = errorbar(MAR_meanSiO2, MAR_meanCaO, MAR_stdCaO, 'vertical');
e2.Marker = '.';
e2.MarkerSize = 10;
e2.Color = ColorBarMAR;
e2.LineWidth = 1.5;
ylim([0 20])
xlim([40 60])
set(gca,'Xticklabel',[])
hold off

% Tile 7 - R 4, C 1
nexttile
plot(EPR_Chem_extract.SiO2(index), EPR_Chem_extract.Na2O(index),'.','Color',ColorEPR,'MarkerSize',5)
hold on
e1 = errorbar(EPR_meanSiO2, EPR_meanNa2O, EPR_stdSiO2, 'horizontal');
e1.Marker = '.';
e1.MarkerSize = 10;
e1.Color = ColorBarEPR;
e1.LineWidth = 1.5;
e2 = errorbar(EPR_meanSiO2, EPR_meanNa2O, EPR_stdNa2O, 'vertical');
e2.Marker = '.';
e2.MarkerSize = 10;
e2.Color = ColorBarEPR;
e2.LineWidth = 1.5;
ylabel('Na_2O')
yticks([0 2 4 6])
ylim([0 6])
xlim([40 60])
set(gca,'Xticklabel',[])
hold off

% Tile 8 - R 4, C 2
nexttile
plot(MAR_Chem_extract.SiO2, MAR_Chem_extract.Na2O,'.','Color',ColorMAR,'MarkerSize',5)
hold on
e1 = errorbar(MAR_meanSiO2, MAR_meanNa2O, MAR_stdSiO2, 'horizontal');
e1.Marker = '.';
e1.MarkerSize = 10;
e1.Color = ColorBarMAR;
e1.LineWidth = 1.5;
e2 = errorbar(MAR_meanSiO2, MAR_meanNa2O, MAR_stdNa2O, 'vertical');
e2.Marker = '.';
e2.MarkerSize = 10;
e2.Color = ColorBarMAR;
e2.LineWidth = 1.5;
yticks([0 2 4 6])
ylim([0 6])
xlim([40 60])
set(gca,'Xticklabel',[])
hold off

% Tile 9 - R 5, C 1
nexttile
plot(EPR_Chem_extract.SiO2(index), EPR_Chem_extract.Al2O3(index),'.','Color',ColorEPR,'MarkerSize',5)
hold on
e1 = errorbar(EPR_meanSiO2, EPR_meanAl2O3, EPR_stdSiO2, 'horizontal');
e1.Marker = '.';
e1.MarkerSize = 10;
e1.Color = ColorBarEPR;
e1.LineWidth = 1.5;
e2 = errorbar(EPR_meanSiO2, EPR_meanAl2O3, EPR_stdAl2O3, 'vertical');
e2.Marker = '.';
e2.MarkerSize = 10;
e2.Color = ColorBarEPR;
e2.LineWidth = 1.5;
ylabel('Al_2O_3')
ylim([0 30])
xlim([40 60])
xlabel('SiO_2')
hold off

% Tile 10 - R 5, C 2
nexttile
plot(MAR_Chem_extract.SiO2, MAR_Chem_extract.Al2O3,'.','Color',ColorMAR,'MarkerSize',5)
hold on
e1 = errorbar(MAR_meanSiO2, MAR_meanAl2O3, MAR_stdSiO2, 'horizontal');
e1.Marker = '.';
e1.MarkerSize = 10;
e1.Color = ColorBarMAR;
e1.LineWidth = 1.5;
e2 = errorbar(MAR_meanSiO2, MAR_meanAl2O3, MAR_stdAl2O3, 'vertical');
e2.Marker = '.';
e2.MarkerSize = 10;
e2.Color = ColorBarMAR;
e2.LineWidth = 1.5;
ylim([0 30])
xlim([40 60])
xlabel('SiO_2')
hold off

%% End
