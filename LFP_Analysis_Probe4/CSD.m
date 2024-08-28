%% CSD Analysis
% Data pre
Data_load;
CSD_Data={};
CSD_val={};
iCSD_val={};
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
    CSD_Data{i,1}=Pre_Resps_2(Visual_Cortex_Position{1},:);
    CSD_Data{i,2}=Pre_Resps_2(Visual_Cortex_Position{2},:);
    CSD_Data{i,3}=Pre_Resps_2(Visual_Cortex_Position{3},:);
    CSD_Data{i,4}=Pre_Resps_2(Visual_Cortex_Position{4},:);
    %3.Calculate CSD
    for j = 1:size(CSD_Data,2)
        %There are 384 points on the probe, which are in pairs
        CSD_Data_1=CSD_Data{i,j}(1:end-4,:)-2*CSD_Data{i,j}(3:end-2,:)+CSD_Data{i,j}(5:end,:);
        %Add four column to the data
        CSD_Data_2=[CSD_Data_1(3,:);CSD_Data_1(3,:);CSD_Data_1;CSD_Data_1(end,:);CSD_Data_1(end,:)];
        CSD_val{i,j}=CSD_Data_2;
    end

    %4.Calculate iCSD
    % Perform iCSD reconstruction using Tikhonov regularization
    for k = 1:size(CSD_val,2)
        lambda = 0.1; % Regularization parameter
        I = eye(size(CSD_val{i,k}, 1)); % Identity matrix
        CSD_inverse = (I + lambda^2 ) \ CSD_val{i,k};
        iCSD_val{i,k}=CSD_inverse;
    end
end
save Pre_CSD_Data.mat