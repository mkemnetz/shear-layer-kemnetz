%%
clearvars
close all;
clc;

%%
load('/Volumes/LaCie/MATLAB/Research/Shear Layer Kemnetz/Data/Processed/12-29-2017/3/3_F5_clean.mat')

%%
trim       = [6; 30; 3; 60];
[WF_trim] = trimMat(WF, trim);
[X_trim]  = trimMat(X, trim);

%%
fsamp       = 40307;
N           = 10;
% WF          = fliplr(WF);
dx          = X(1, 2, 1) - X(1, 1, 1);
dt          = 1/fsamp;
corr_offset = zeros(N, 2);
vel         = zeros(N, 1);
for i = 1:N
    [ corr_offset(i, :) ]   = computeShift( WF_trim(:, :, i), WF(:, :, i+1));
    [ shift, ~ ] = parabolaFit( WF(:, :, i), WF(:, :, i+1), corr_offset(i, 2) );
    [ vel(i) ]      = computeVel( shift, dx, dt );
    
end
