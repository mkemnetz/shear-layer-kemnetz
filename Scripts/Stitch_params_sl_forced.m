%% TTP_params.m
%  Matthew Kemnetz
%  This file generates the parameters and constants used in the wavefront
%  stitching algorithm

%  Path for loading the data
%  Unforced
% params.path = '/Volumes/LaCie/MATLAB/Research/Shear Layer Kemnetz/Data/Processed/12-29-2017/3/3_F5_clean.mat';

%  Forced
params.path = '/Volumes/LaCie/MATLAB/Research/Shear Layer Kemnetz/Data/Processed/12-29-2017/4/4_F1_clean.mat';

%  Set the number of rows and columns for the interpolated wavefront.  The
%  main algorithm uses interp2 to refine the mesh.  
params.fine = 200;

%  Set the start frame number to begin the stitching
params.start = 	1;

%  Set the number of frames to stitch together.
% params.N     = 1000;
% params.N     = 1000;
% params.N     = 100;
% params.N     = 1400;
params.N     = 1000;

%  Set the number of excess rows and columns to be trimed off either side; 
params.excessRows    = 1;
params.excessColumns = 1;

%  Set smoothing filter size
params.filterSize = 5;

% Set a flag to decide if you want to use the constant conv speed or the
% computed conv speed to stitch the frames.  
% true  => instantaneous computed conv speed
% false => constant conv speed
params.instantConv_flag = true;

% Set a flag to decide if you want to use the tip, tilt, and piston 
% correction.
% true  => TTP is added to neighboring frames to ensure continuity in 
%          overlap region 
% false => TTP is NOT added
params.TTP_flag = true;

params.mach = 0.5;
% params.mach = 0.03;

% Temp in Farenheit
params.T    = 69.5;

%  Set the trim for the wavefronts
params.trim = [8; 35; 3; 60];
%% After this point selections should be automatic
% Set the forced overlap used if the computed overlap is 0.

    params.forcedOverlap  = 15;
    
    params.expected_shift = 15;

    params.downsample     = 5;

% Set the sampling frequency used in the experiment.  Used to compute 
% convective velocity 

%     params.fsamp = 40000;
    params.fsamp = 40000/params.downsample;


% Set the boundary layer thickness from the experiment.

   params.delta = 1;


% Set the free stream velocity from the experiment.

    params.Vinf = machToVel(params.mach, params.T);



