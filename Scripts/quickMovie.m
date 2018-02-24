%%
clearvars;
close all;
clc;

%%
% load('/Volumes/LaCie/MATLAB/Research/Shear Layer Kemnetz/Data/Processed/12-29-2017/3/3_F5_clean.mat')
load('/Volumes/LaCie/MATLAB/Research/Shear Layer Kemnetz/Data/Processed/12-29-2017/4/4_F1_clean.mat')

%%
A = imrotate(WF(:, :, 1),-18);
WF_rot = zeros(size(A, 1), size(A, 2), size(WF, 3));
for i = 1:size(WF, 3)
    WF_rot(:, :, i) = imrotate(WF(:, :, i),-18);
end

trim      = [18, 41, 10, 60];
[WF_trim] = trimMat(WF_rot, trim);

figure(1)
for i = 1:500
    surf(WF_trim(:, :, i), 'Edgecolor', 'none');
%     view(2);
    zlim([-0.3, 0.32]);
    drawnow;
    colormap jet;
    pause(0.1);
    
end
%%
% figure(1)
% for i = 1:500
%     surf(X(:, :, i), Y(:, :, i), WF(:, :, i), 'Edgecolor', 'none');
%     view(2);
%     drawnow;
%     colormap jet;
%     pause(0.1);
%     
% end

%%
% [B, steadyComponent] = removeSteadyLensing(WF, 100);

% figure(1)
% for i = 1:200
%     surf(B(:, :, i), 'Edgecolor', 'none');
%     view(2);
%     drawnow;
%     pause(0.1);
%     
% end
% 
% figure(1)
% for i = 1:200
%     surf(WF(:, :, i), 'Edgecolor', 'none');
%     view(2);
%     drawnow;
%     pause(0.1);
%     
% end