clear all;
close all;
addpath(genpath('W:\6_SEEG_Bandit\1_Analysis_banditOnline\2_ANALYSIS_VKF\cbm-master\codes'));
fdata = load('alldatabandit.mat');
data = fdata.alldata;
% 2nd input: a cell input containing function handle to models
models = {@fit_rl, @fit_2rl,@fit_hgf2,@fit_hgf3,@fit_kf,@fit_vkf};
% note that by handle, I mean @ before the name of the function
% 3rd input: another cell input containing file-address to files saved by cbm_lap


v=6.25;


%RL
prior_RL = struct('mean',zeros(2,1),'variance',v);
%fname_RL = 'lap_RL_v100.mat';
fname_RL = 'lap_RL_v6p25_singleupdate.mat';
cbm_lap(data,@fit_rl, prior_RL,fname_RL);

%winloss RL
prior_dualRL = struct('mean',zeros(3,1),'variance',v);
%fname_dualRL = 'lap_dualRL_v100.mat';
fname_dualRL = 'lap_dualRL_v6p25.mat';
cbm_lap(data,@fit_2rl, prior_dualRL,fname_dualRL);

%