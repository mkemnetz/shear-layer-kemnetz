function [OPDrms] = OPDrms_explicit(x, lambda, beta) 
%OPDRMS_EXPLICIT - One line description of what the function or script performs (H1 line) 
%Optional file header info (to give more details about the function than in the H1 line) 
%Optional file header info (to give more details about the function than in the H1 line) 
%Optional file header info (to give more details about the function than in the H1 line) 
% 
% Syntax:  [output1,output2] = OPDrms_explicit(input1,input2,input3) 
% 
% Inputs: 
%    input1 - Description 
%    input2 - Description 
%    input3 - Description 
% 
% Outputs: 
%    output1 - Description 
%    output2 - Description 
% 
% Example: 
%    Line 1 of example 
%    Line 2 of example 
%    Line 3 of example 
% 
% Other m-files required: none 
% Subfunctions: none 
% MAT-files required: none 
% 
% See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2 
 
% Author: Matthew Kemnetz 
% Hessert Laboratory for Aerospace Research B034 
% email: mkemnetz@nd.edu, kemnetz.m@gmail.com 
% Website: http://www.matthewkemnetz.com 
% February 2018; Last revision: 13-February-2018 
% Copyright 2018, Matthew Kemnetz, All rights reserved. 
 
%% ------------- BEGIN CODE -------------- %% 
 
C1 = (1/8).*pi.^(-2).*lambda.^2+(9/4).*pi.^(-6).*beta.^(-4).*lambda.^2+(25/16).* ...
  pi.^(-4).*beta.^(-2).*lambda.^2+(-9/4).*pi.^(-6).*beta.^(-4).*lambda.^2.*cos(2.* ...
  pi.*beta)+(47/16).*pi.^(-4).*beta.^(-2).*lambda.^2.*cos(2.*pi.*beta)+(-9/2).* ...
  pi.^(-5).*beta.^(-3).*lambda.^2.*sin(2.*pi.*beta)+(5/8).*pi.^(-3).*beta.^(-1).* ...
  lambda.^2.*sin(2.*pi.*beta);

C2 = (1/2)+(9/4).*pi.^(-6).*beta.^(-6)+(9/4).*pi.^(-4).*beta.^(-4)+(-9/4).* ...
  pi.^(-6).*beta.^(-6).*cos(2.*pi.*beta)+(9/4).*pi.^(-4).*beta.^(-4).*cos(2.* ...
  pi.*beta)+(-9/2).*pi.^(-5).*beta.^(-5).*sin(2.*pi.*beta);

C3 = (-9/2).*pi.^(-6).*beta.^(-5).*lambda+(-15/4).*pi.^(-4).*beta.^(-3).*lambda+(9/2).* ...
  pi.^(-6).*beta.^(-5).*lambda.*cos(2.*pi.*beta)+(-21/4).*pi.^(-4).*beta.^(-3).* ...
  lambda.*cos(2.*pi.*beta)+9.*pi.^(-5).*beta.^(-4).*lambda.*sin(2.*pi.*beta)+(-3/4).* ...
  pi.^(-3).*beta.^(-2).*lambda.*sin(2.*pi.*beta);
 
C4 = (3/2).*pi.^(-2).*beta.^(-2)+(3/2).*pi.^(-2).*beta.^(-2).*cos(2.*pi.*beta)+( ...
  -3/2).*pi.^(-3).*beta.^(-3).*sin(2.*pi.*beta);
 
C5 = (-3/2).*pi.^(-3).*beta.^(-3)+(3/2).*pi.^(-3).*beta.^(-3).*cos(2.*pi.*beta)+ ...
  (-3/2).*pi.^(-2).*beta.^(-2).*sin(2.*pi.*beta);

C6 = (-5/4).*pi.^(-2).*beta.^(-1).*lambda+(-7/4).*pi.^(-2).*beta.^(-1).*lambda.*cos(2.* ...
  pi.*beta)+(-1/2).*pi.^(-1).*lambda.*sin(2.*pi.*beta)+(3/2).*pi.^(-3).*beta.^(-2) ...
  .*lambda.*sin(2.*pi.*beta);

C7 = (3/2).*pi.^(-3).*beta.^(-2).*lambda+(1/2).*pi.^(-1).*lambda.*cos(2.*pi.*beta)+( ...
  -3/2).*pi.^(-3).*beta.^(-2).*lambda.*cos(2.*pi.*beta)+(-7/4).*pi.^(-2).*beta.^( ...
  -1).*lambda.*sin(2.*pi.*beta);
 
root = C1+x.^2.*(C2+C4.*cos(2.*pi.*x.*lambda.^(-1))+C5.*sin(2.*pi.*x.*lambda.^( ...
  -1)))+x.*(C3+C6.*cos(2.*pi.*x.*lambda.^(-1))+C7.*sin(2.*pi.*x.*lambda.^( ...
  -1)));
 
OPDrms = sqrt(root);
 
 
%% -------------- END CODE --------------- %% 
end 
%% --------- BEGIN SUBFUNCTIONS ---------- %% 










 % ===== EOF ====== [OPDrms_explicit.m] ======  

