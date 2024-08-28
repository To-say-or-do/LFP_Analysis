%% L4 Data Analysis
% Data pre
clear all;
Data_load;
%%Check L4 Area
L4_Data={};
L4_probes={3,3,4};
L4_electrodes={20:40,20:30,2:48};
%Filter
Fs=625;%Sampling Rate
Fc_High=20;%Cutoff Frequency
Fc_Low=0.1;

Order=6;

[A,B,C,D]=butter(Order,[Fc_Low Fc_High]/(Fs/2));
sos=ss2sos(A,B,C,D);
% windowSize = 25; % smooth window

for i = 1:length(ALL_Data)
    LFP_ALL=load(ALL_Data{i});%Load data for each subject
    Resps=LFP_ALL.resps;
    Contrasts_Order=LFP_ALL.contrasts;
    TimeVector=LFP_ALL.timeVector;
    Con_Resps={};
    for j = 1:length(contrastValues)
        con_index = find(Contrasts_Order==contrastValues(j));
    
        %Pre process
        %1.Divide original Data into four parts(Visual Cortex)
        Visual_Cortex_Position={1:48,49:96,193:240,241:288};
        %1.1 Apply Filter
        LFP_filtered=zeros(size(Resps(:,:,con_index)));
        Pre_Resps_15=Resps(:,:,con_index);
        for m = 1:size(LFP_filtered,3)
            for n = 1:size(LFP_filtered,1)
%                 LFP_filtered(n,:,m)=filter(ones(1, windowSize) / windowSize, 1,filtfilt(b,a,Pre_Resps_15(n,:,m)));
                LFP_filtered(n,:,m)=sosfilt(sos,Pre_Resps_15(n,:,m));
            end
        end
        %2.Minus the mean LFP data of the -0.2s
        Pretimes=find(TimeVector>=-0.2 & TimeVector< 0);
        Pre_Resps_15=mean(LFP_filtered,3);
        Resps_Pretimes=mean(Pre_Resps_15(:,Pretimes),2);
        Pre_Resps_2=Pre_Resps_15-repmat(Resps_Pretimes,1,size(Pre_Resps_15,2));
        %Record Data
        L4_Data{i,j}=Pre_Resps_2(Visual_Cortex_Position{L4_probes{i}},:);
    end
end
save L4_Data.mat