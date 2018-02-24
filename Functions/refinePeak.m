function [xp, yp] = refinePeak(x, y) 
%REFINEPEAK - One line description of what the function or script performs (H1 line) 
%Optional file header info (to give more details about the function than in the H1 line) 
%Optional file header info (to give more details about the function than in the H1 line) 
%Optional file header info (to give more details about the function than in the H1 line) 
% 
% Syntax:  [output1,output2] = refinePeak(input1,input2,input3) 
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
    
    [p, ~, mu] = polyfit(x, y, 2);
    x1 = x(1):0.01:x(3);
    y1 = polyval(p,x1, [], mu);
    [yp,index] = max(y1, [], 2);
    xp = x1(index);
 
 
 
 
 
 
 
 
 
 
%% -------------- END CODE --------------- %% 
end 
%% --------- BEGIN SUBFUNCTIONS ---------- %% 










 % ===== EOF ====== [refinePeak.m] ======  

