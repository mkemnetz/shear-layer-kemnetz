%%
clearvars;
close all;
clc;

%%
f_1    = 50000;
Uc     = 90;
Lambda = 0.1406;
rho_sl = 1.225;
rho_inf = 1.2;
M = 0.5;

c      = (rho_inf/rho_sl)*(M^2);


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