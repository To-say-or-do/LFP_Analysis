%% LFP Data Analysis
% Data pre
Data_load;
LFP_Data={};
for i = 1:length(ALL_Data)
    LFP_ALL=load(ALL_Data{i});%Load data for each subject
    Resps=LFP_ALL.resps;
    Contrasts_Order=LFP_ALL.contrasts;
    TimeVector=LFP_ALL.timeVector;
    con_index = find(Contrasts_Order==contrastValues(5));

    %Pre process
    %1.Divide original Data into four parts(Visual Cortex)
    Visual_Cortex_Position={1:48,49:96,193:240,241:288};
    %2.Minus the mean LFP data of the -0.2s
    Pretimes=find(TimeVector>=-0.2 & TimeVector< 0);
    Pre_Resps_15=mean(Resps(:,:,con_index),3);
    Resps_Pretimes=mean(Pre_Resps_15(:,Pretimes),2);
    Pre_Resps_2=Pre_Resps_15-repmat(Resps_Pretimes,1,size(Pre_Resps_15,2));
    LFP_Data{i,1}=Pre_Resps_2(Visual_Cortex_Position{1},:);
    LFP_Data{i,2}=Pre_Resps_2(Visual_Cortex_Position{2},:);
    LFP_Data{i,3}=Pre_Resps_2(Visual_Cortex_Position{3},:);
    LFP_Data{i,4}=Pre_Resps_2(Visual_Cortex_Position{4},:);
end
save Pre_LFP_Data.mat
