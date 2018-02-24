%%
clearvars;
close all;
clc;

%%
load('/Volumes/LaCie/MATLAB/Research/Shear Layer Kemnetz/Data/Processed/12-29-2017/4/4_F1_stitched.mat');

%%
Lambda = 0.1406;

figure(); 
set(gcf,'units','centimeters','position',[0 0 30 12]);
surf(WF_stitched.x./Lambda, WF_stitched.y./Lambda, WF_stitched.WF, 'EdgeColor', 'none'); 
view(2); 
colormap jet;

xlabel('$x/\Lambda$', 'interpreter', 'latex');
ylabel('$x/\Lambda$', 'interpreter', 'latex');
