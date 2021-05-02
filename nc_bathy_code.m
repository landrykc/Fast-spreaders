
%% Read Data
%[X,Y,Z]=grdread2('MAR_all_dat.1.nc');

%% Plot Bathymetry Map
figure(1)
clf
imagesc(X,Y,Z)
axis xy
set(gca,'DataAspectRatio',[1 1 1])
hold on

disp('Use mouse to select two points.  After clicking on points hit enter.')
%[ix,iy]=ginput; %figre out wwhere you think the transform ends save them


MAR_startlon = MAR_depth_data.Lon(1);
MAR_endlon = MAR_depth_data.Lon(604);

MAR_startlat = MAR_depth_data.Lat(1);
MAR_endlat = MAR_depth_data.Lat(604);

ix=[MAR_startlon,MAR_endlon];
iy=[MAR_startlat,MAR_endlat];
plot(ix,iy,'ro-','markersize',10,'markerfacecolor','r')
hold on

%ix and iy are the endpoints that you pick

%% Create sample points along profile
tx=linspace(ix(1),ix(2),10);
ty=linspace(iy(1),iy(2),10);
plot(tx,ty,'ro','markersize',2,'markerfacecolor','b')
hold on
%% Interpolate bathymetry along profile
tz = interp2(X,Y,Z,tx,ty);
figure(2)
clf
plot(tx,tz)
hold on

%% slope of profile
coefficients = polyfit([ix(1), ix(2)], [iy(1), iy(2)], 1);
a = coefficients (1); %slope
b = coefficients (2); % yintercept
PdPz = zeros(length(tx),2,400);
MaxMin = zeros(length(tx),9);
%------You will want to start your loop here------
for i = 1:length(tx)
%% Choose a point C along line AB
%cx = -47.603792673981130;
%cy = 15.464959956936356;
end% better to define these based on the points in the tx & ty vectors, e.g.,
cx = tx(i);
cy = ty(i);
%% making the perpendicular line
% Get slope and y int of line perpendicular to AB at points tx, ty
A = [ix(1),iy(1)]; %[x,y]
B = [ix(2),iy(2)]; %[x,y]
perpS = -1/a;
perpY = ty-(a*tx);
Clen = km2deg(25); %do length in degrees
% % Find the end points of the perpendicular line with length Clen*2
% for tx = 1:1:500
Xp = cx + (Clen*sqrt(1/(1+perpS^2)))*[-1,1];
% end
% for ty = 1:1:500
Yp = cy + (perpS*Clen*sqrt(1/(1+perpS^2)))*[-1,1];
% end
% Emma -- this looks correct.  Points Xp & Yp are indeed the end points to
% a line perpendicular to A-B.  You can see this by just running the
% following lines:
figure(1)
plot(Xp(1),Yp(1),'ko','markerfacecolor', 'w')
plot(Xp(2),Yp(2),'ko','markerfacecolor', 'w')