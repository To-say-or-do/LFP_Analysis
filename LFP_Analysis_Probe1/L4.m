%% L4 Data Analysis
% Data pre
Data_Load;
%%Check L4 Area
L4_electrodes={300:350,300:350,300:350,300:350,320:360,300:384,300:384,310:384,300:384};
%Filter
Fs=625;%Sampling Rate
Fc_High=25;%Cutoff Frequency
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
        %1.Delete Interference Electrode(you will find it after you check the LFP average image)
        reference=192;
        Pre_Resps_1=[Resps(1:reference-1,:,:);Resps(reference-1,:,:);Resps(reference+1:end,:,:)];
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
        Con_Resps{j}=Pre_Resps_2;
    end

    L4_image;
end
