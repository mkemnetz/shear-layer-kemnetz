f_1    = 50000;
Lambda = 0.1406;
Uc     = 94.46;
rho_sl = 1.1574;
rho_inf = 1.2;
M = 0.27;

c      = (rho_inf/rho_sl)*(M^2);


Ap2 = 0:0.002:10;
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

%%

f_1    = 50000;
Lambda = 0.1406;
Uc     = 94.46;
rho_sl = 1.1574;
rho_inf = 1.2;
M = 0.27;

c      = (rho_inf/rho_sl)*(M^2);


Ap2 = 0:1e-6:2;
rmsb = B_forced2(Lambda, Ap2);

yy = rmsb./c;

figure();
set(gcf,'units','centimeters','position',[0 0 1.2*8 8]);
semilogy(Ap2/Lambda, yy);
xlim([0 10]);

xlabel('$Ap/\Lambda$', 'interpreter', 'latex');
ylabel('$\frac{\theta_{rms}}{(\rho_{\infty}/\rho_{SL}) \cdot M^2}$', 'Interpreter', 'Latex');
title('Normalized $\theta_{rms}$ vs $Ap$, $f_f = 640 \, Hz$', 'interpreter', 'latex');