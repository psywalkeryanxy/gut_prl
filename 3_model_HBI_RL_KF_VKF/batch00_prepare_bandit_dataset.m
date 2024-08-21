
%xinyuan yan

%model modified from this NC paper https://pubmed.ncbi.nlm.nih.gov/34782597/
%
clear all;close all;
%read data
numOfCues=3;


rawdatapath='C:\Users\yan00286\99_YanX_personal\02_Gut_Social_resting\RAWDATA';
%% where datafile
alldatafiles = dir([rawdatapath,filesep,'sub*']);






alldata  = {};

for subIDX=1:length(alldatafiles)
        %load  subdata
    data2load = dir([rawdatapath,filesep,alldatafiles(subIDX).name,filesep,'reversal*onset*.mat']);
    load([rawdatapath,filesep,alldatafiles(subIDX).name,filesep,data2load(1).name]);
    disp([rawdatapath,filesep,alldatafiles(subIDX).name,filesep,data2load(1).name]);
   
    

    choice_raw = choice;
    choice_seq = choice_raw;
    
    outcome = feedback;
    outcome(find(outcome==2))=0;
    
    %% prepare the outcome data
    subchoice = choice_seq';
    reward = outcome';
    
    thisSubData_reward =reward;
    thisSubData_choice = subchoice;
   
    
    
    
    thisSubData_recode_reward=nan(length(thisSubData_choice),2);
    
    for kk=1:length(thisSubData_choice)
        %if all choices = stay
        
        if thisSubData_choice(kk,1)==1 && thisSubData_reward(kk,1)==1%
            
            thisSubData_recode_reward(kk,1)=1;
            thisSubData_recode_reward(kk,2)=0;
   
        end
         if thisSubData_choice(kk,1)==1 && thisSubData_reward(kk,1)==0%
            
            thisSubData_recode_reward(kk,1)=0;
            thisSubData_recode_reward(kk,2)=1;
   
        end       

         if thisSubData_choice(kk,1)==2 && thisSubData_reward(kk,1)==1
            
            thisSubData_recode_reward(kk,1)=0;
            thisSubData_recode_reward(kk,2)=1;

        end          
        if thisSubData_choice(kk,1)==2 && thisSubData_reward(kk,1)==0%stay 0
            
            thisSubData_recode_reward(kk,1)=1;
            thisSubData_recode_reward(kk,2)=0;
           
        end
         
       
    end
    
    
    thisSubData.choice = thisSubData_choice;%1stay | 0switch
    thisSubData.outcome = thisSubData_recode_reward;%1stay | 0switch
    
    alldata{subIDX,1}=thisSubData;
    
    
    
    
end
save alldatabandit alldata