%%Locate L4
clear all
L4_position={320:329,320:329,310:319,320:329,335:344,367:376,347:356,342:351,327:336};

% %%LFP
% %% LFP Data Analysis
% % Data pre
% Data_Load;
% figure;
% for i = 1:length(ALL_Data)
%     LFP_ALL=load(ALL_Data{i});%Load data for each subject
%     Resps=LFP_ALL.resps;
%     Contrasts_Order=LFP_ALL.contrasts;
%     TimeVector=LFP_ALL.timeVector;
%     con_index = find(Contrasts_Order==contrastValues(5));
% 
%     %Pre process
%     %1.Delete Interference Electrode(you will find it after you check the LFP average image)
%     Pre_Resps_1=[Resps(1:191,:,:);Resps(191,:,:);Resps(193:end,:,:)];
%     %2.Minus the mean LFP data of the -0.2s
%     Pretimes=find(TimeVector>=-0.2 & TimeVector< 0);
%     Pre_Resps_15=mean(Pre_Resps_1(:,:,con_index),3);
%     Resps_Pretimes=mean(Pre_Resps_15(:,Pretimes),2);
%     Pre_Resps_2=Pre_Resps_15-repmat(Resps_Pretimes,1,size(Pre_Resps_15,2));
%     Pre_Resps_2=Pre_Resps_2(L4_position{i},:);
%     LFP_image;
% end

%%PSD
% %% CSD Analysis
% % Data pre
% Data_Load;
% figure;
% for i = 1:length(ALL_Data)
%     LFP_ALL=load(ALL_Data{i});%Load data for each subject
%     Resps=LFP_ALL.resps;
%     Contrasts_Order=LFP_ALL.contrasts;
%     TimeVector=LFP_ALL.timeVector;
%     con_index = find(Contrasts_Order==contrastValues(5));
% 
%     %Pre process
%     %1.Delete Interference Electrode(you will find it after you check the LFP average image)
%     Pre_Resps_1=[Resps(1:191,:,:);Resps(191,:,:);Resps(193:end,:,:)];
%     %2.Minus the mean LFP data of the -0.2s
%     Pretimes=find(TimeVector>=-0.2 & TimeVector< 0);
%     Pre_Resps_15=mean(Pre_Resps_1(:,:,con_index),3);
%     Resps_Pretimes=mean(Pre_Resps_15(:,Pretimes),2);
%     Pre_Resps_2=Pre_Resps_15-repmat(Resps_Pretimes,1,size(Pre_Resps_15,2));
%     %3.Calculate CSD
%     %There are 384 points on the probe, which are in pairs
%     CSD_Data_1=Pre_Resps_2(1:end-4,:)-2*Pre_Resps_2(3:end-2,:)+Pre_Resps_2(5:end,:);
%     %Add four column to the data
%     CSD_Data_2=[CSD_Data_1(3,:);CSD_Data_1(3,:);CSD_Data_1;CSD_Data_1(end,:);CSD_Data_1(end,:)];
%     %4.Calculate iCSD
%     % Perform iCSD reconstruction using Tikhonov regularization
%     lambda = 0.1; % Regularization parameter
%     I = eye(size(CSD_Data_2, 1)); % Identity matrix
%     CSD_inverse = (I + lambda^2 ) \ CSD_Data_2;
%     CSD_inverse=CSD_inverse(L4_position{i},:);
%     CSD_Data_2=CSD_Data_2(L4_position{i},:);
%     CSD_image;
% end


%%FFT

%%PSD

%%Amplitude
%% L4 Data Analysis
% Data pre
Data_Load;
%Filter
Fs=625;%Sampling Rate
Fc_High=25;%Cutoff Frequency
Fc_Low=0.1;

Order=6;

[A,B,C,D]=butter(Order,[Fc_Low Fc_High]/(Fs/2));
sos=ss2sos(A,B,C,D);
% windowSize = 25; % smooth window

Spike_max={};
Spike_min={};
Amp=[];
Con_Resps={};
for i = 1:length(ALL_Data)
    LFP_ALL=load(ALL_Data{i});%Load data for each subject
    Resps=LFP_ALL.resps;
    Contrasts_Order=LFP_ALL.contrasts;
    TimeVector=LFP_ALL.timeVector;
    
    for j = 1:length(contrastValues)
        con_index = find(Contrasts_Order==contrastValues(j));
    
        %Pre process
        %1.Delete Interference Electrode(you will find it after you check the LFP average image)
        Pre_Resps_1=[Resps(1:191,:,:);Resps(191,:,:);Resps(193:end,:,:)];
        %1.1 Apply Filter
        LFP_filtered=zeros(size(Pre_Resps_1(:,:,con_index)));
        Pre_Resps_15=Pre_Resps_1(:,:,con_index);
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
        Con_Resps{i,j}=Pre_Resps_2(L4_position{i},:);
    end
end
save Pre_L4_Data.mat
