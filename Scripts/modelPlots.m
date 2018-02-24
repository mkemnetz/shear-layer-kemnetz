%%
clearvars;
close all;
clc;

%%
beta   = 1; 
lambda = 0.2; 
x      = 0:0.001:(lambda * beta);

Ap1       = x./(lambda * beta);
[OPDrms1] = OPDrms_explicit(x, lambda, beta);
[OPDrms1_f] = OPDrms_explicit_forced(x, lambda, beta);

%%
beta   = 2; 
lambda = 0.2; 
x      = 0:0.001:(lambda * beta);

Ap2         = x./(lambda * beta);
[OPDrms2]   = OPDrms_explicit(x, lambda, beta);
[OPDrms2_f] = OPDrms_explicit_forced(x, lambda, beta);

%%
beta   = 5; 
lambda = 0.2; 
x      = 0:0.001:(lambda * beta);

Ap3         = x./(lambda * beta);
[OPDrms3]   = OPDrms_explicit(x, lambda, beta);
[OPDrms3_f] = OPDrms_explicit_forced(x, lambda, beta);

%%
beta   = 100; 
lambda = 0.2; 
x      = 0:0.001:(lambda * beta);

Ap4         = x./(lambda * beta);
[OPDrms4]   = OPDrms_explicit(x, lambda, beta);
[OPDrms4_f] = OPDrms_explicit_forced(x, lambda, beta);

%%
beta   = 1.4; 
lambda = 0.2; 
x      = 0:0.001:(lambda * beta);

Ap5         = x./(lambda * beta);
[OPDrms5]   = OPDrms_explicit(x, lambda, beta);
[OPDrms5_f] = OPDrms_explicit_forced(x, lambda, beta);


%%
figure(); 
set(gcf,'units','centimeters','position',[0 0 12 8]); 
plot(Ap5, OPDrms5, '-.r');
xlabel('$x/Ap$', 'interpreter', 'latex');
ylabel('$OPD_{rms}$', 'interpreter', 'latex');
title('Modeled OPDrms, $\beta = 1.4$','interpreter', 'latex')

%%
figure(); 
set(gcf,'units','centimeters','position',[0 0 12 8]); 
plot(Ap5, OPDrms5+0.7, '-.r');
hold on;
plot(Ap5, OPDrms5_f, '-b');

xlabel('$x/Ap$', 'interpreter', 'latex');
ylabel(' Scaled $OPD_{rms}$', 'interpreter', 'latex');
title('Modeled OPDrms, $\beta = 1.4$','interpreter', 'latex')
legend('Unforced', 'Forced')

%%
figure(); 
set(gcf,'units','centimeters','position',[0 0 12 8]); 
plot(Ap1, OPDrms1, '-.r');
hold on;
plot(Ap2, OPDrms2, '-g');
plot(Ap3, OPDrms3, '--b');
xlabel('$x/Ap$', 'interpreter', 'latex');
ylabel('$OPD_{rms}$', 'interpreter', 'latex');
legend('beta = 1', 'beta = 2', 'beta = 5')