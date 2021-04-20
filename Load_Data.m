%% Load Data Files

clear;
clc;

addpath('Data Files');

%EPR Data along 9N includes:
%       Leg 138 density & P wave velocity
%       Leg 201 density & P wave velocity
%       Heat flow
%       Locations of Earthquakes >5.0
%       Volcanic Glasses

%MAR Ridge Data
%       Leg 306 density & P wave velocity
%       Heat flow
%       Locations of Earthquakes >0

%% Load Density Files

filename = 'Leg_138_density_EPR.csv';
EPR_density_138 = readtable(filename);

filename = 'Leg_201_density_EPR.csv';
EPR_density_201 = readtable(filename);

filename = 'Leg_306_density_MAR.csv';
MAR_density_306 = readtable(filename);


%% Load P-Wave Velocity Files

filename = 'Leg_138_PWV_EPR.csv';
EPR_PWV_138 = readtable(filename);

filename = 'Leg_201_PWV_EPR.csv';
EPR_PWV_201 = readtable(filename);

filename = 'Leg_306_PWV_MAR.csv';
MAR_PWV_306 = readtable(filename);


%% Load Heat Flow Data
% rate of thermal energy transfer

EPR_Heat_Flow_Data = readtable('Global_Heat_Flow_Data_-_Abbott_Compilation_EPR.xlsx');

MAR_Heat_Flow_Data = readtable('Global_Heat_Flow_Data_-_Abbott_Compilation_MAR.xlsx');

%% Load Core Measurement Data
% depth

EPR_Core_Data = readtable('Measurements_on_Cores_DSDP_ODP_and_IODP_Legs_1_to_312_EPR.xlsx');
%why is this not working

MAR_Core_Data = readtable('Measurements_on_Cores_DSDP_ODP_and_IODP_Legs_1_to_312_MAR.xlsx');


%% Load Earthquake Data

EPR_Earthquake_Data = readtable('Magnitude_5.0_(1960-2020)_EPR.xlsx');

MAR_Earthquake_Data = readtable('Magnitude_5.0_(1960-2020)_MAR.xlsx');





