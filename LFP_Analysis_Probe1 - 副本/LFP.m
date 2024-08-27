%% LFP Data Analysis
% Data pre
clear all;
Data_Load;
LFP_Data={};
for i = 1:length(ALL_Data)
    LFP_ALL=load(ALL_Data{i});%Load data for each subject
    Resps=LFP_ALL.resps;
    Contrasts_Order=LFP_ALL.contrasts;
    TimeVector=LFP_ALL.timeVector;
    con_index = find(Contrasts_Order==contrastValues(5));

    %Pre process
    %1.Delete Interference Electrode(you will find it after you check the LFP average image)
    Pre_Resps_1=[Resps(1:191,:,:);Resps(191,:,:);Resps(193:end,:,:)];
    %2.Minus the mean LFP data of the -0.2s
    Pretimes=find(TimeVector>=-0.2 & TimeVector< 0);
    Pre_Resps_15=mean(Pre_Resps_1(:,:,con_index),3);
    Resps_Pretimes=mean(Pre_Resps_15(:,Pretimes),2);
    Pre_Resps_2=Pre_Resps_15-repmat(Resps_Pretimes,1,size(Pre_Resps_15,2));
    LFP_Data{i}=Pre_Resps_2;
end
save Pre_LFP_Data.mat