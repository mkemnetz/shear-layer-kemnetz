%%
clearvars;
close all;
clc;

%%
% Uhs    = machToVel( 0.5, 69.5 );
% Uc     = 0.6*Uhs;
Uc = 120;
lambda = 0.2;
beta   = 1;
% x  = 1:100;
x = linspace(0, beta*lambda, 100);
t  = 0:0.0001:5;
z  = @(x, t) x.*sin(((2*pi)/lambda)*(x - Uc*t));

Ap    = [40, 40];
WF    = zeros(size(x, 2), size(x, 2), size(t, 2));
WF_ap = zeros(Ap(1), Ap(2), size(t, 2));
mid   = (length(x)/2);
for tt = 1:size(t, 2)
    A = z(x, tt);
    B = repmat(A,size(x, 2),1);
    WF(:, :, tt) = B;
    
    WF_ap(:, :, tt) = B(1:Ap(1), mid - (Ap(1)/2):mid + (Ap(1)/2) - 1);
end

%%
[OPDrms] = OPDrms_temporal(WF);

figure(); 
surf(OPDrms, 'edgecolor', 'none');
view(2);

%%
[WF_ap_slrm, ~] = removeSteadyLensing(WF_ap, size(WF_ap, 3));
[X,Y] = meshgrid(1:Ap(1),1:Ap(2));
X2 = repmat(X, [1 1 size(WF_ap, 3)]);
Y2 = repmat(Y, [1 1 size(WF_ap, 3)]);
[ WF_ap_slrm_TTP, ~ ] = removeTTP( WF_ap_slrm, X2, Y2);

[OPDrms] = OPDrms_temporal(WF_ap_slrm_TTP);

figure(); 
surf(OPDrms, 'edgecolor', 'none');
view(2);

%%
WFtr = zeros(size(WF_ap));
Mask_WF = ones(size(WFtr, 1), size(WFtr, 2));
for tt = 1:size(t, 2)
    [ WFtr(:, :, tt) ] = TT_remove(Mask_WF,WF_ap(:, :, tt));
end

[OPDrms] = OPDrms_temporal(WFtr);

figure(); 
surf(OPDrms, 'edgecolor', 'none');
view(2);

%%
% makemov(WF_ap_slrm_TTP, 60, 5);