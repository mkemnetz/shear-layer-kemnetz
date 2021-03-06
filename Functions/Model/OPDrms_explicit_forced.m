function [OPDrms] = OPDrms_explicit_forced(x, lambda, beta) 
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
 
OPDrms = ((1/2)+(9/4).*beta.^(-4).*pi.^(-4)+(13/4).*beta.^(-2).*pi.^(-2)+( ...
  -9/4).*beta.^(-4).*pi.^(-4).*cos(2.*beta.*pi)+(5/4).*beta.^(-2).* ...
  pi.^(-2).*cos(2.*beta.*pi)+(-3/2).*beta.^(-2).*pi.^(-2).*cos(2.* ...
  lambda.^(-1).*pi.*(beta.*lambda+(-1).*x))+(3/2).*beta.^(-2).*pi.^( ...
  -2).*cos(2.*lambda.^(-1).*pi.*x)+(-1/8).*beta.^(-1).*pi.^(-2).* ...
  cos(2.*lambda.^(-1).*pi.*(beta.*lambda+x))+(1/8).*beta.^(-1).* ...
  pi.^(-2).*cos(2.*lambda.^(-1).*pi.*((-2).*lambda+beta.*lambda+x))+ ...
  (-9/2).*beta.^(-3).*pi.^(-3).*sin(2.*beta.*pi)+x.^2.*((9/4).* ...
  beta.^(-6).*lambda.^(-2).*pi.^(-4)+(9/2).*beta.^(-4).*lambda.^(-2) ...
  .*pi.^(-2)+(-9/4).*beta.^(-6).*lambda.^(-2).*pi.^(-4).*cos(2.* ...
  beta.*pi)+(-9/2).*beta.^(-5).*lambda.^(-2).*pi.^(-3).*sin(2.* ...
  beta.*pi))+(-1/2).*beta.^(-1).*pi.^(-1).*sin(2.*lambda.^(-1).*pi.* ...
  (beta.*lambda+(-1).*x))+(5/2).*beta.^(-1).*pi.^(-1).*sin(2.* ...
  lambda.^(-1).*pi.*x)+(3/8).*beta.^(-2).*pi.^(-3).*sin(2.*lambda.^( ...
  -1).*pi.*(beta.*lambda+x))+(-3/8).*beta.^(-2).*pi.^(-3).*sin(2.* ...
  lambda.^(-1).*pi.*((-2).*lambda+beta.*lambda+x))+x.*((-9/2).* ...
  beta.^(-5).*lambda.^(-1).*pi.^(-4)+(-15/2).*beta.^(-3).*lambda.^( ...
  -1).*pi.^(-2)+(9/2).*beta.^(-5).*lambda.^(-1).*pi.^(-4).*cos(2.* ...
  beta.*pi)+(-3/2).*beta.^(-3).*lambda.^(-1).*pi.^(-2).*cos(2.* ...
  beta.*pi)+(3/2).*beta.^(-3).*lambda.^(-1).*pi.^(-2).*cos(2.* ...
  lambda.^(-1).*pi.*(beta.*lambda+(-1).*x))+(-3/2).*beta.^(-3).* ...
  lambda.^(-1).*pi.^(-2).*cos(2.*lambda.^(-1).*pi.*x)+9.*beta.^(-4) ...
  .*lambda.^(-1).*pi.^(-3).*sin(2.*beta.*pi)+(-3).*beta.^(-2).* ...
  lambda.^(-1).*pi.^(-1).*sin(2.*lambda.^(-1).*pi.*x)+(-3/8).* ...
  beta.^(-3).*lambda.^(-1).*pi.^(-3).*sin(2.*lambda.^(-1).*pi.*( ...
  beta.*lambda+x))+(3/8).*beta.^(-3).*lambda.^(-1).*pi.^(-3).*sin( ...
  2.*lambda.^(-1).*pi.*((-2).*lambda+beta.*lambda+x)))).^(1/2);
 
%% -------------- END CODE --------------- %% 
end 
%% --------- BEGIN SUBFUNCTIONS ---------- %% 










 % ===== EOF ====== [OPDrms_explicit.m] ======  

