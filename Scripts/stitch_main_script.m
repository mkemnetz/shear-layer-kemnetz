%%
clearvars;
close all;
clc;

%%
Stitch_params_sl_forced;

%%
load(params.path, 'WF', 'X', 'Y')

%%
[ WF ]                  = downsampleData( WF, params.downsample );
[ X ]                   = downsampleData( X, params.downsample );
[ Y ]                   = downsampleData( Y, params.downsample );
[ WF_stitched, OUTPUT ] = stitchWF2( WF, X, Y, params);