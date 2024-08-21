function plot_bandit_results(value_model,realchoice)

addpath(genpath([pwd,filesep,'Tools-master']));


% general graphics, this will apply to any figure you open
% (groot is the default figure object).
set(groot, ...
'DefaultFigureColor', 'w', ...
'DefaultAxesLineWidth', 0.5, ...
'DefaultAxesXColor', 'k', ...
'DefaultAxesYColor', 'k', ...
'DefaultAxesFontUnits', 'points', ...
'DefaultAxesFontSize', 8, ...
'DefaultAxesFontName', 'Helvetica', ...
'DefaultLineLineWidth', 1, ...
'DefaultTextFontUnits', 'Points', ...
'DefaultTextFontSize', 8, ...
'DefaultTextFontName', 'Helvetica', ...
'DefaultAxesBox', 'off', ...
'DefaultAxesTickLength', [0.02 0.025]);
 
% set the tickdirs to go out - need this specific order
set(groot, 'DefaultAxesTickDir', 'out');
set(groot, 'DefaultAxesTickDirMode', 'manual');




time = [1:1:300];
data1 = value_model;
data2 = realchoice;
 
colors = cbrewer('qual', 'Set2', 8);
 

hold on;
% bl = boundedline(time, mean(data1), std(data1)/sqrt(length(data1)), ...
%     time, mean(data2), std(data2)/sqrt(length(data1)), ...
%     'cmap', colors);

bl = boundedline(time, data1), ...
    time, data2), ...
    'cmap', colors);

% boundedline has an 'alpha' option, which makes the errorbars transparent
% (so it's nice when they overlap). However, when saving to pdf this makes
% the files HUGE, so better to keep your hands off alpha and make the final
% figure transparant in illustrator
 
xlim([-0.4 max(time)]); xlabel('Time (s)'); ylabel('Signal');
 
% instead of a legend, show colored text
lh = legend(bl);
legnames = {'value(model)', 'choice'};
for i = 1:length(legnames),
    str{i} = ['\' sprintf('color[rgb]{%f,%f,%f} %s', colors(i, 1), colors(i, 2), colors(i, 3), legnames{i})];
end
lh.String = str;
lh.Box = 'off';
 
% move a bit closer
lpos = lh.Position;
lpos(1) = lpos(1) + 0.15;
lh.Position = lpos;


end%
