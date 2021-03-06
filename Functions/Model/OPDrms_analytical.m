function [OPDrms2] = OPDrms_analytical(Ap, x, k, lambda, Uc) 
%OPDRMS_ANALYTICAL - One line description of what the function or script performs (H1 line) 
%Optional file header info (to give more details about the function than in the H1 line) 
%Optional file header info (to give more details about the function than in the H1 line) 
%Optional file header info (to give more details about the function than in the H1 line) 
% 
% Syntax:  [output1,output2] = OPDrms_analytical(input1,input2,input3) 
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
fun = @(Ap, x, t, k, lambda, Uc) (F(x, t, k, lambda, Uc) - (A(Ap, t, k, lambda, Uc) + x.*B(Ap, t, k, lambda, Uc)))^2;
OPDrms2 = (Uc./lambda).*integral(@(t)fun(Ap, x, t, k, lambda, Uc), 0, lambda./Uc);
 
 
 
 
 
 
 
 
%% -------------- END CODE --------------- %% 
end 
%% --------- BEGIN SUBFUNCTIONS ---------- %% 










 % ===== EOF ====== [OPDrms_analytical.m] ======  

