%% EESC6664 - Environmental Data Exploration & Analysis
% Team project
% Char, Sky, Kameko, Adam

%% Load Data Files

clear;
clc;

addpath('Data Files');

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

EPR_depth_data = readtable('EPR.txt');
MAR_depth_data = readtable('MAR.txt');


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
% rate of thermal energy transfer
% Collected on Geomapapp, I can't actually find a database for this one

% EPR
EPR_Heat_Flow_Data = readtable('Global_Heat_Flow_Data_-_Abbott_Compilation_EPR.xlsx');

% MAR
MAR_Heat_Flow_Data = readtable('Global_Heat_Flow_Data_-_Abbott_Compilation_MAR.xlsx');

%% Load Core Depth Data 
% We may want different depth data idk
% Database: IODP, collected on Geomapapp

% EPR
EPR_Core_Data = readtable('Measurements_on_Cores_DSDP_ODP_and_IODP_Legs_1_to_312_EPR.xls');

% MAR
MAR_Core_Data = readtable('Measurements_on_Cores_DSDP_ODP_and_IODP_Legs_1_to_312_MAR.xlsx');

%% Load Earthquake Data
% Databse: USGS, collected on Geomapapp

% EPR
EPR_Earthquake_Data = readtable('Magnitude_5.0_(1960-2020)_EPR.xlsx');

% MAR
MAR_Earthquake_Data = readtable('Magnitude_5.0_(1960-2020)_MAR.xlsx');

%% Chem Data
% Dataabase: PetDB

% EPR
EPR_Chem_Data = readtable('EastPacificRise_ALL_CHEM_DATA');

% MAR
MAR_Chem_Data = readtable('MAR_Chem_Data_WholeRock.txt');

%% Save Workspace

% save all_data.mat

% This only needs to be done once
% Next time simply use 'load all_data.mat'

% Rerun this step if updated

%% (Additional Data)
