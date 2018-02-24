%%
clearvars;
close all;
clc;

%%
load('/Volumes/LaCie/MATLAB/Research/Shear Layer Kemnetz/Data/Processed/12-29-2017/4/4_F1_stitched.mat');

%%
Lambda = 0.1406;

phase  = WF_stitched.WF;
xx     = WF_stitched.x./Lambda;
yy     = WF_stitched.y./Lambda;

l = size(phase, 2);
w = size(phase, 1);

[Xq,Yq] = meshgrid(0:0.005:81, 1:w);
[X,Y]   = meshgrid(linspace(0,81.9754, l), 1:w);

newX     = interp2(X, Y, xx, Xq, Yq, 'cubic');

l2 = size(newX, 2);
w2 = size(newX, 1);
[Xq,Yq]  = meshgrid(linspace(1, l, l2), linspace(1, w, w2));
[X,Y]    = meshgrid(1:l, 1:w);

newY     = interp2(X, Y, yy, Xq, Yq, 'cubic');
newPhase = interp2(xx, yy, phase, newX, newY, 'spline');


%% 
phase  = newPhase;
xx     = newX;
yy     = newY;

dx     = xx(1, 2) - xx(1, 1);

N      = 50;
% N      = 15;
TTP    = cell(1, N); 
Ap     = zeros(1, N);

for j = 1:N
    numberOfLambda = 0.2*j;
    
    if numberOfLambda < 0.5
        fine_m = 30;
        fine_n = 30;
    elseif (numberOfLambda >= 0.5) && (numberOfLambda < 5)
        fine_m = 100;
        fine_n = 100;
    elseif (numberOfLambda >= 5) && (numberOfLambda < 8)
        fine_m = 200;
        fine_n = 200;
    elseif (numberOfLambda >= 8)
        fine_m = 300;
        fine_n = 300;
    end

    Uc     = 94.46;
    Uc_l   = Uc/Lambda;
    

    f_1    = 50000;
    dt     = 1/f_1;
    shift  = round((Uc_l*dt)./dx);

%     k      = 21*j;
    k      = 42*j;

    n      = floor((size(phase, 2)-k)/shift)+1;

    WF     = zeros(fine_m, fine_n, n);
    x      = zeros(fine_m, fine_n, n);
    y      = zeros(fine_m, fine_n, n);

    parfor i = 1:n
            pt = phase(:, (1+(i-1)*shift):(k+(i-1)*shift));
            xt = xx(:, (1+(i-1)*shift):(k+(i-1)*shift));
            yt = yy(:, (1+(i-1)*shift):(k+(i-1)*shift));
            l = size(pt, 2);
            w = size(pt, 1);

            [Xq,Yq] = meshgrid(linspace(1,l, fine_n), linspace(1,w, fine_m));
            [X,Y]   = meshgrid(1:l, 1:w);

            WF(:, :, i) = interp2(X, Y, pt, Xq, Yq, 'cubic');
            x(:, :, i)  = interp2(X, Y, xt, Xq, Yq, 'cubic');
            y(:, :, i)  = interp2(X, Y, yt, Xq, Yq, 'cubic');


%         if(mod(i, 1000) == 0)
%             fprintf('\n %d - %d \n', j, i);
%         end
    end

    if j == 1
        fprintf('\n %d \n', j);
    elseif(mod(j, 10) == 0)
        fprintf('\n %d \n', j);
    end
    
    [WF_ttpRem_1, TTP_1] = removeTTP(WF, x, y);
    x_1         = x;

    TTP{j}   = atan(TTP_1(1, :)/(Lambda));
    Ap(1, j) = numberOfLambda;
end

rho_sl = 1.1574;
rho_inf = 1.2;
M = 0.27;

c      = (rho_inf/rho_sl)*(M^2);
rmsTTP = zeros(1, N);
for i = 1:N
    rmsTTP(i) = rms(TTP{i});
 
end
y = rmsTTP./c;
figure();
set(gcf,'units','centimeters','position',[0 0 1.2*8 8]);
AX = semilogy(Ap, y);
%%
selectedTTP = [0.2/0.2, 1.8/0.2, 2.6/0.2, 9.4/0.2];
blockSize  = 2000;
A_y        = cell(1, size(selectedTTP, 2));
freq       = cell(1, size(selectedTTP, 2));

for i = 1:size(selectedTTP, 2)
    kk = selectedTTP(i);
    [~, A_y{i}, freq{i}] = A_SpecNN(TTP{kk},blockSize,f_1, 2); % Deflection angle amplitude spectra
end

figure();
set(gcf,'units','centimeters','position',[0 0 1.2*8 8]);
loglog(freq{1}.*(Lambda/Uc),A_y{1},'-');
hold on;
loglog(freq{2}.*(Lambda/Uc),A_y{2},'-');
loglog(freq{3}.*(Lambda/Uc),A_y{3},'-');
loglog(freq{4}.*(Lambda/Uc),A_y{4},'-');

grid on;
xlim([10^-1 10^1]);
hleg = legend('$Ap/\Lambda = 0.2$', '$Ap/\Lambda = 1.8$', '$Ap/\Lambda = 2.6$', '$Ap/\Lambda = 9.4$');
set(hleg, 'interpreter', 'latex');
set(hleg, 'location', 'southwest');
xlabel('$St_{\Lambda}$', 'interpreter', 'latex');
ylabel('$|\hat{\theta}|^2$', 'interpreter', 'latex');
title('Aero-optical jitter energy spectra, $|\hat{\theta}|^2$, $f_f = 640 \, Hz$', 'interpreter', 'latex');
%%
Ap2 = 0:0.2:10;
t = linspace(0, 1, f_1);
rmsB = zeros(1, size(Ap2, 2));
for i = 1:size(Ap2, 2)
    beta = Ap2(i)/Lambda;
    [b] = B_forced(beta, t, Lambda, Uc);
    rmsB(i) = rms(b);
end

yy = rmsB./c;

figure();
set(gcf,'units','centimeters','position',[0 0 1.2*8 8]);
semilogy(Ap2, yy);

figure();
set(gcf,'units','centimeters','position',[0 0 1.2*8 8]);
semilogy(Ap2, yy);
hold on; 
semilogy(Ap, y);

hleg = legend('Model', 'Experimental');
set(hleg, 'interpreter', 'latex');
set(hleg, 'location', 'southwest');
xlabel('$Ap/\Lambda$', 'interpreter', 'latex');
ylabel('$\frac{\theta_{rms}}{(\rho_{\infty}/\rho_{SL}) \cdot M^2}$', 'Interpreter', 'Latex');
title('Normalized $\theta_{rms}$ vs $Ap$, $f_f = 640 \, Hz$', 'interpreter', 'latex');