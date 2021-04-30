%% This is the satellite data


filename = 'MARtake2.nc';
%1a. Use the function "ncdisp" to display information about the data contained in this file
%addpath to Blob folder to access downloaded files

ncdisp(filename);

% %1b. Use the function "ncreadatt" to extract the latitude and longitude
% %attributes of this dataset
% 
% LAT = ncread(filename,'latitude');
% LONG = ncread(filename,'longitude');
% LAT2 = double(LAT);
% LONG2 = double(LONG);
% 
% %1c. Use the function "ncread" to extract the variables "time" and
% %"ctdmo_seawater_temperature"
% 
% Timesat = ncread(filename,'time');  %'seconds since 1970-01-01T00:00:00Z'
% sstAnom = ncread(filename,'sstAnom');
% 
% imagesc(sstAnom(:,:,1))
% 
% figure(1); clf
% worldmap([20 60], [-170 -100])
% contourfm(LAT2,LONG2,sstAnom(:,:,1)','linecolor','none');
% colorbar
% geoshow('landareas.shp','FaceColor','black')
% title('SST Anom (^oC)')
% % 
