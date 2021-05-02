%% EESC6664 - Environmental Data Exploration & Analysis
% Team project
% Char, Sky, Kameko, Adam

% ========================================
% Load_Data.m
% Read raw data tables and preprocess
% Output stored in 'all_data.mat'
% ========================================

%% Load Data Files

clear
clc

addpath('Data Files')

% EPR (East Pacific Rise) Data along 9N includes:
%       Leg 138 density & P wave velocity
%       Leg 201 density & P wave velocity
%       Heat flow
%       Locations of Earthquakes >5.0
%       Whole Rock, Glass, and Mineral Chem Data

% MAR (Mid Atlantic Ridge) Data:
%       Leg 306 density & P wave velocity
%       Heat flow
%       Locations of Earthquakes >0
%       Whole Rock Chem Data

%% Load Depth, Gravity Anomaly, Magnetic Anomaly, Free Air Anomaly
% Geomapapp

% Variables of interest
%       FAA - Free Air Anomaly
%       MA  - Magnetic Anomaly
%       GA  - Gravity Anomaly

% EPR
EPR_depth_data = readtable('EPR.txt');
EPR_depth_data.Properties.VariableNames = {'Lon', 'Lat', 'Dist', 'FAA', 'MA', 'GA', 'Depth'};
EPR_depth_data.Properties.VariableUnits = {'deg', 'deg', 'km', 'mgal', 'nT', 'mgal', 'm'};

% MAR
MAR_depth_data = readtable('MAR.txt');
MAR_depth_data.Properties.VariableNames = {'Lon', 'Lat', 'Dist', 'MA', 'FAA', 'GA', 'Depth'};
MAR_depth_data.Properties.VariableUnits = {'deg', 'deg', 'km', 'nT', 'mgal', 'mgal', 'm'};
MAR_depth_data = movevars(MAR_depth_data, 'FAA', 'Before', 'MA'); % switch FAA and MA columns to ensure consistent table structure

%% Load Transects (Do we still need to keep these?)
% Geomapapp

% EPR
EPR_transect = readtable('EPR_transect.txt');
EPR_transect.Properties.VariableNames = {'Lon', 'Lat', 'Dist', 'Depth'};
EPR_transect.Properties.VariableUnits = {'deg', 'deg', 'km', 'm'};

% MAR
MAR_transect = readtable('MAR_transect.txt');
MAR_transect.Properties.VariableNames = {'Lon', 'Lat', 'Dist', 'Depth'};
EPR_transect.Properties.VariableUnits = {'deg', 'deg', 'km', 'm'};

% NEW Transects

% EPR
% EPR_transect_new = readtable('EPR_transect_new.xlsx');
% 
% % MAR
% MAR_transect_new = readtable('MAR_transect_new.xlsx');

% These 'new' tables look similar to EPR_depth_data/MAR_depth_data (generated in the previous section)

%% Load Density Files
% Database: IODP

% EPR - Leg 138 & 201
EPR_density_138 = readtable('Leg_138_density_EPR.csv');
EPR_density_201 = readtable('Leg_201_density_EPR.csv');

% MAR - Leg 306
MAR_density_306 = readtable('Leg_306_density_MAR.csv');

%% Load P-Wave Velocity Files
% Do we want s-wave too?
% Database: IODP

% EPR - Leg 138 & 201
EPR_PWV_138 = readtable('Leg_138_PWV_EPR.csv');
EPR_PWV_201 = readtable('Leg_201_PWV_EPR.csv');

% MAR - Leg 306
MAR_PWV_306 = readtable('Leg_306_PWV_MAR.csv');

%% Load Heat Flow Data
% Rate of thermal energy transfer
% Collected on Geomapapp, I can't actually find a database for this one

% EPR
EPR_Heat_Flow_Data = readtable('Global_Heat_Flow_Data_-_Abbott_Compilation_EPR.xlsx');

% MAR
MAR_Heat_Flow_Data = readtable('Global_Heat_Flow_Data_-_Abbott_Compilation_MAR.xlsx');

%% Load Core Depth Data 
% We may want different depth data idk
% Database: IODP, collected on Geomapapp

% EPR
% EPR_Core_Data = readtable('Measurements_on_Cores_DSDP_ODP_and_IODP_Legs_1_to_312_EPR.xls');
% 
% % MAR
% MAR_Core_Data = readtable('Measurements_on_Cores_DSDP_ODP_and_IODP_Legs_1_to_312_MAR.xlsx');

%% Load Earthquake Data
% Databse: USGS, collected on Geomapapp

% Variables of interest
%       Time
%       Lat
%       Lon
%       Magnitude
%       Depth

opts = spreadsheetImportOptions('NumVariables', 5); % first 5 columns
opts.DataRange = 'A2'; % starting cell
opts.VariableTypes = {'string', 'double', 'double', 'double', 'double'};

% EPR
EPR_Earthquake_Data = readtable('Magnitude_5.0_(1960-2020)_EPR.xlsx', opts);
EPR_Earthquake_Data.Properties.VariableNames = {'Time', 'Lat', 'Lon', 'Magnitude', 'Depth'};
EPR_Earthquake_Data.Properties.VariableUnits = {'', 'deg', 'deg', '', 'km'};

% MAR
MAR_Earthquake_Data = readtable('Magnitude_5.0_(1960-2020)_MAR.xlsx', opts);
MAR_Earthquake_Data.Properties.VariableNames = {'Time', 'Lat', 'Lon', 'Magnitude', 'Depth'};
MAR_Earthquake_Data.Properties.VariableUnits = {'', 'deg', 'deg', '', 'km'};

clear opts

%% Chem Data
% Database: PetDB

% Variables of interest
%       SiO2
%       Al2O3
%       MgO
%       CaO
%       Na2O
%       K2O

% What type of Fe minerals do we need?
% Original data have FeO/FeOT/Fe2O3/Fe2O3T

% EPR
EPR_Chem_Data = readtable('EastPacificRise_ALL_CHEM_DATA.xlsx', 'Sheet', 'Data');

EPR_Chem_extract = EPR_Chem_Data(:, [4, 10, 5, 6, 14, 16, 24, 25, 27, 28]);
EPR_Chem_extract.Properties.VariableNames = {'SampleType', 'RockName',...
    'Lat', 'Lon', 'SiO2', 'Al2O3', 'MgO', 'CaO', 'Na2O', 'K2O'};
EPR_Chem_extract.Properties.VariableUnits = {'', '',...
    'deg', 'deg', 'wt %', 'wt %', 'wt %', 'wt %', 'wt %', 'wt %'};

% convert text data into numeric data
for column = 3:10
    EPR_Chem_extract.(EPR_Chem_extract.Properties.VariableNames{column}) = str2double(EPR_Chem_extract{:,column});
end

EPR_Chem_extract.SampleType = upper(EPR_Chem_extract.SampleType); % convert to uppercase
index_EPR = EPR_Chem_extract.SampleType == "WHOLE ROCK" & EPR_Chem_extract.RockName == "BASALT";
EPR_Chem_extract = EPR_Chem_extract(index_EPR, :);
clear column index_EPR

EPR_Chem_extract = rmmissing(EPR_Chem_extract); % remove missing values

% MAR
MAR_Chem_Data = readtable('MAR_Chem_Data_WholeRock.txt');
MAR_Chem_extract = MAR_Chem_Data(:, [15, 17, 6, 7, 19, 21, 29, 30, 31, 32]);
MAR_Chem_extract.Properties.VariableNames = {'SampleType', 'RockName',...
    'Lat', 'Lon', 'SiO2', 'Al2O3', 'MgO', 'CaO', 'Na2O', 'K2O'};
MAR_Chem_extract.Properties.VariableUnits = {'', '',...
    'deg', 'deg', 'wt %', 'wt %', 'wt %', 'wt %', 'wt %', 'wt %'};

index_MAR = MAR_Chem_extract.SampleType == "WHOLE ROCK" & MAR_Chem_extract.RockName == "BASALT";
MAR_Chem_extract = MAR_Chem_extract(index_MAR, :);
clear index_MAR

MAR_Chem_extract = rmmissing(MAR_Chem_extract); % remove missing values

%% Save Workspace

% save all_data.mat

% This only needs to be done once
% Next time simply use 'load all_data.mat'

% Rerun this step if updated

%% NC files



[MAR_Lon,MAR_Lat,MAR_Depth]=grdread2('MAR_all_data1.nc');


imagesc(MAR_Lon,MAR_Lat,MAR_Depth)




