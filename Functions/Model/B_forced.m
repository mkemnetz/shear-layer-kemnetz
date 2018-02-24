function [b] = B_forced(beta, t, lambda, Uc) 
%B - One line description of what the function or script performs (H1 line) 
%Optional file header info (to give more details about the function than in the H1 line) 
%Optional file header info (to give more details about the function than in the H1 line) 
%Optional file header info (to give more details about the function than in the H1 line) 
% 
% Syntax:  [output1,output2] = B(input1,input2,input3) 
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
 
b = (3.*beta.^(-2).*lambda.^(-1).*pi.^(-1).*cos(2.*lambda.^(-1).*pi.*( ...
  beta.*lambda+(-1).*t.*Uc))+(-3/2).*beta.^(-3).*lambda.^(-1).*pi.^( ...
  -2).*sin(2.*lambda.^(-1).*pi.*t.*Uc)+6.*beta.^(-2).*lambda.^(-1).* ...
  pi.^(-1).*sin(beta.*pi).*sin(lambda.^(-1).*pi.*(beta.*lambda+(-2) ...
  .*t.*Uc))+(-3/2).*beta.^(-3).*lambda.^(-1).*pi.^(-2).*sin(2.* ...
  lambda.^(-1).*pi.*(beta.*lambda+(-1).*t.*Uc))).^(1/2);
 
 
 
 
 
 
 
 
 
%% -------------- END CODE --------------- %% 
end 
%% --------- BEGIN SUBFUNCTIONS ---------- %% 










 % ===== EOF ====== [B.m] ======  

