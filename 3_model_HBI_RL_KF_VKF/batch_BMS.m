clear all;close all;
load('allLME.mat');

addpath(genpath('C:\Users\yan00286\Documents\MATLAB\spm12'));
[alpha,exp_r,xp,pxp,bor] = spm_BMS (allLME);
x=categorical({'RW','dual RW','kalman filter','volatile kalman filter'});
bar(x,pxp);
ylabel('protected exceedance probabilities');
xlabel('models');
  