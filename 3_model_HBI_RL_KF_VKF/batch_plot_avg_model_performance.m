clear all;close all;
%%
load('results_kf_v6p25.mat');

avg_pchoice_1 = nanmean(allsubval_1,1);

ste = std( allsubval_1,1)./sqrt(32);
y=avg_pchoice_1;
x = 1:numel(y);
curve1 = y + ste;
curve2 =  y - ste;
x2 = [x, fliplr(x)];
inBetween = [curve1, fliplr(curve2)];
fill(x2, inBetween, 'g');
hold on
plot(x, y, 'r', 'LineWidth', 2);
hold on
plot([1:1:125],[repmat(0.75,[50,1]);repmat(0.25,[25,1]);repmat(0.75,[50,1])],'k');
hold on
allsubchoice1 = [];

for whichsub=1:length(alldata)
    subchoice=alldata{whichsub,1}.choice;
    subchoice(find(subchoice==2))=0;
  allsubchoice1 = [allsubchoice1; subchoice'];
   
    
end

y=nanmean(allsubchoice1);
ste = std( allsubchoice1,1)./sqrt(32);
x = 1:numel(y);
curve1 = y + ste;
curve2 =  y - ste;
x2 = [x, fliplr(x)];
inBetween = [curve1, fliplr(curve2)];
fill(x2, inBetween, 'b');
hold on
plot(x, y, 'k', 'LineWidth', 2);
