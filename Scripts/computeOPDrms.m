%%
clearvars;
close all;
clc;

%%
load('/Volumes/LaCie/MATLAB/Research/Shear Layer Kemnetz/Data/Processed/12-29-2017/3/3_F5_clean.mat')

%%
trim       = [6; 30; 3; 60];
[WF_trim]  = trimMat(WF, trim);
[X_trim]   = trimMat(X, trim);
[Y_trim]   = trimMat(Y, trim);
xx         = X_trim(14, :, 1)+(-X_trim(14, 1, 1));
bigX       = convlength(X_trim(:, :, 1)+(-X_trim(:, 1, 1)), 'm', 'ft')*12;
xxx        = fliplr(bigX(1, :))+6.2136;


%%
[OPDrms] = OPDrms_temporal(WF_trim);

figure();
set(gcf,'units','centimeters','position',[0 0 15 10]);
surf(xxx, 12*convlength(Y_trim(:, :, 1), 'm', 'ft'), OPDrms, 'Edgecolor', 'none');
view(2);

xlabel('$x, inches from splitter plate$', 'Interpreter','Latex');
ylabel('$y, inches$', 'Interpreter', 'Latex');
title('$OPD_{rms}$, $f_f = 0$, $M = 0.5$','Interpreter','Latex');

figure();
set(gcf,'units','centimeters','position',[0 0 15 10]);
plot(xxx, OPDrms(12, :)); 
xlabel('$x, inches from splitter plate$', 'Interpreter','Latex');
title('Centerline $OPD_{rms}$, $f_f = 0$, $M = 0.5$','Interpreter','Latex');


xlabel('$x (m)$', 'Interpreter','Latex');
ylabel('$y (m)$', 'Interpreter', 'Latex');
title('$OPD_{rms}$, $f_f = 0$, $M = 0.5$','Interpreter','Latex');

%%
OPDrms1 = OPDrms;
x1 = xxx;
%%
load('/Volumes/LaCie/MATLAB/Research/Shear Layer Kemnetz/Data/Processed/12-29-2017/4/4_F1_clean.mat')

%%
trim       = [8; 35; 3; 60];
[WF_trim]  = trimMat(WF, trim);
[X_trim]   = trimMat(X, trim);
[Y_trim]   = trimMat(Y, trim);
xx         = X_trim(14, :, 1)+(-X_trim(14, 1, 1));
bigX       = convlength(X_trim(:, :, 1)+(-X_trim(:, 1, 1)), 'm', 'ft')*12;
xxx        = fliplr(bigX(1, :))+6.2136;

%%
[OPDrms] = OPDrms_temporal(WF_trim);

figure();
set(gcf,'units','centimeters','position',[0 0 15 10]);
surf(xxx, 12*convlength(Y_trim(:, :, 1), 'm', 'ft'), OPDrms, 'Edgecolor', 'none');
view(2);

xlabel('$x, inches from splitter plate$', 'Interpreter','Latex');
ylabel('$y, inches$', 'Interpreter', 'Latex');
title('$OPD_{rms}$, $f_f = 640$, $M = 0.5$','Interpreter','Latex');

figure();
set(gcf,'units','centimeters','position',[0 0 15 10]);
plot(xxx, OPDrms(12, :)); 
xlabel('$x, inches from splitter plate$', 'Interpreter','Latex');
title('Centerline $OPD_{rms}$, $f_f = 640$, $M = 0.5$','Interpreter','Latex');

%%
OPDrms2 = OPDrms;
x2 = xxx;

%%


figure();
set(gcf,'units','centimeters','position',[0 0 15 10]);
plot(x1, OPDrms1(12, :)); 
hold on
plot(x2, OPDrms2(12, :)); 
xlabel('$x, inches from splitter plate$', 'Interpreter','Latex');
title('Centerline $OPD_{rms}$, $M = 0.5$','Interpreter','Latex');
legend('Unforced', 'Forced');