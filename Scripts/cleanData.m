%%
clearvars
close all;
clc;

%% Load in data
% load('/Volumes/LaCie/MATLAB/Research/Shear Layer Kemnetz/Data/Processed/12-29-2017/3/3_F5_WF.mat');
% load('/Volumes/LaCie/MATLAB/Research/Shear Layer Kemnetz/Data/Processed/12-29-2017/3/3_F5_TH.mat');
load('/Volumes/LaCie/MATLAB/Research/Shear Layer Kemnetz/Data/Processed/12-29-2017/4/4_F1_WF.mat');
load('/Volumes/LaCie/MATLAB/Research/Shear Layer Kemnetz/Data/Processed/12-29-2017/4/4_F1_TH.mat');
%%
[ x_Final, y_Final, theta_Final_x, theta_Final_y, phase_Final ] = ...
    buildWF( WF, ThX, ThY, Mask_WF, 'Mag', 10, 'NormalizeByDeltaFlag', false, 'windowSize', 100 );

%%
WF  = cat(3,phase_Final{:});
ThX = cat(3,theta_Final_x{:});
ThY = cat(3,theta_Final_y{:});
X   = cat(3,x_Final{:});
Y   = cat(3,y_Final{:});
