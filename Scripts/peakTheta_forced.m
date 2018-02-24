%%
clearvars
close all;
clc;

%%
% load('/Volumes/LaCie/MATLAB/Research/Shear Layer Kemnetz/Data/Processed/12-29-2017/3/3_F5_clean.mat')
load('/Volumes/LaCie/MATLAB/Research/Shear Layer Kemnetz/Data/Processed/12-29-2017/4/4_F1_clean.mat')


%%  Deflection Angle 

fsamp      = 40000;
Uc         = 94.4631;


trim       = [6; 30; 3; 60];
[ThX_trim] = trimMat(ThX, trim);
[X_trim]   = trimMat(X, trim);
NN         = size(ThX_trim,3); 
Nx         = size(ThX_trim,2); 
Ny         = size(ThX_trim,1);
ThX_r      = ThX_trim(14, :, :);
dx         = X_trim(1, 2, 1) - X_trim(1, 1, 1);
xx         = X_trim(14, :, 1)+(-X_trim(14, 1, 1));
bigX       = convlength(X_trim(:, :, 1)+(-X_trim(:, 1, 1)), 'm', 'ft')*12;

blockSize  = 1000;
A_y        = zeros(size(ThX_r, 2), blockSize/2);
freq       = zeros(size(ThX_r, 2), blockSize/2);

for i = 1:size(ThX_r, 2)
    [~, A_y(i, :), freq(i, :)] = A_SpecNN(ThX_r(1, i, :),blockSize,fsamp, 2); % Deflection angle amplitude spectra
end


%%
xxx = repmat(fliplr(bigX(1, :))+6.2136, blockSize/2, 1);
figure()
set(gcf,'units','centimeters','position',[0 0 15 12]);
% surf(xxx, freq', A_y', 'Edgecolor', 'none');
surf(freq', xxx, A_y', 'Edgecolor', 'none');
xlim([0, 6000]);
caxis([10^-6, 10^-5]);
colorbar;
colormap jet;
view(2);

xlabel('Frequency, Hz', 'interpreter', 'latex');
ylabel('Streamwise distance from splitter plate, x inches', 'interpreter', 'latex');
title('Deflection angle energy spectra, $|\hat{\theta}|^2$, $f_f = 640 \, Hz$', 'interpreter', 'latex');

%%
figure();
set(gcf,'units','centimeters','position',[0 0 1.2*8 8]);


% loglog(freq(1, :),A_y(1, :),'-');
% hold on;
% loglog(freq(5, :),A_y(5, :),'-');
% loglog(freq(10, :),A_y(10, :),'-');
% loglog(freq(15, :),A_y(15, :),'-');
% loglog(freq(30, :),A_y(30, :),'-');
% loglog(freq(50, :),A_y(50, :),'-');
semilogy(freq(1, :),A_y(1, :),'-');
hold on;
semilogy(freq(5, :),A_y(5, :),'-');
semilogy(freq(10, :),A_y(10, :),'-');
semilogy(freq(15, :),A_y(15, :),'-');
semilogy(freq(30, :),A_y(30, :),'-');
semilogy(freq(50, :),A_y(50, :),'-');

grid on;

% xlim([10^-1 3]);
% ylim([10^-29 10^-16]);

% h = legend('$Ap/\delta \approx 1.00$', '$Ap/\delta \approx 3.00$', ...
%     '$Ap/\delta \approx 5.00$', '$Ap/\delta \approx 20.00$', 'location', 'southwest');
% set(h,'Interpreter','Latex');
% xlabel('$St_{\delta}$', 'Interpreter','Latex');
% ylabel('$\hat{\theta}$', 'Interpreter', 'Latex');