
clear all;close all;

load('results_kf_v6p25.mat');

for whichcue=1:2
    figure(99);
    screensize = get( groot, 'Screensize' );
    ResolutionVal = 1200;
    set(gcf, 'Position', [screensize(1),screensize(2),screensize(3),screensize(4)]*0.5);
    
    exampleSub=2;
    
    
    if whichcue==1
        
        value_model = allsub_pchoice_1(exampleSub,:);
        temp_allsub_choice = alldata{exampleSub,1}.choice;
        temp_allsub_choice(find(temp_allsub_choice~=1))=0;
        realchoice = temp_allsub_choice;
        subplot(3,1,whichcue)
        plot(value_model);hold on
        plot(realchoice);
        ylim([-0.1,1.1]);
        %plot_bandit_results(value_model,realchoice)
        hold on
        
        
    end
    
    if whichcue==2
        
        value_model =  allsub_pchoice_2(exampleSub,:);
        temp_allsub_choice = alldata{exampleSub,1}.choice-1;
        temp_allsub_choice(find(temp_allsub_choice~=1))=0;
        realchoice = temp_allsub_choice;
        
        subplot(3,1,whichcue)
        plot(value_model);hold on
        plot(realchoice);
        ylim([-0.1,1.1]);
        %plot_bandit_results(value_model,realchoice)
        hold on
        
        
    end
    

    
    

    
    
    
end