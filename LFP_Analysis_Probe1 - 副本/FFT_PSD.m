%%FFT/PSD Analysis
%Data Pre
clear all
Data_Load;
FFT_Data_0={};
FFT_Data_1={};
PSD_Data_0={};
PSD_Data_1={};
for i = 1:length(ALL_Data)
    FFT_ALL=load(ALL_Data{i});%Load data for each subject
    Resps=FFT_ALL.resps;
    Contrasts_Order=FFT_ALL.contrasts;
    TimeVector=FFT_ALL.timeVector;
    con_index_0 = find(Contrasts_Order==contrastValues(1));% contrast=0 trials
    con_index_1 = find(Contrasts_Order==contrastValues(5));% contrast=1 trials
    
    Pretimes=find(TimeVector>=-0.2 & TimeVector< 0);
    FFT_LFP_0_Pre = Resps(:,:,con_index_0);% contrast=0 LFP data
    FFT_LFP_1_Pre = Resps(:,:,con_index_1);% contrast=1 LFP data
    %Minus the mean LFP data of the -0.2s
    FFT_Pretimes_0 = mean(FFT_LFP_0_Pre(:,Pretimes,:),2);
    FFT_Pretimes_1 = mean(FFT_LFP_1_Pre(:,Pretimes,:),2);
    
    FFT_LFP_0=FFT_LFP_0_Pre-repmat(FFT_Pretimes_0,1,size(FFT_LFP_0_Pre,2),1);
    FFT_LFP_1=FFT_LFP_1_Pre-repmat(FFT_Pretimes_1,1,size(FFT_LFP_1_Pre,2),1);

    %FFT Analysis
    % trials contrast=0
    FFT_result_0_Pre = [];
    fs=625;% Sample rate
    L=750;% Length of the LFP data
    for j = 1:length(con_index_0)
        for k = 1:size(FFT_LFP_0,1)
            Y=fft(FFT_LFP_0(k,:,j));
            P2 = abs(Y/L);% Two-sided spectrum
            P1 = P2(1:L/2+1);% Single-sided spectrum
            P1(2:end-1) = 2*P1(2:end-1); % Convert to single-sided spectrum
            f_fft = fs*(0:(L/2))/L;% Define the frequency domain
            FFT_result_0_Pre(k,:,j)=P1;
        end
    end
    FFT_result_0=mean(FFT_result_0_Pre,3);
    %Delete Interference Electrode(you will find it after you check the LFP average image)
    FFT_result_0=[FFT_result_0(1:191,:);FFT_result_0(191,:);FFT_result_0(193:end,:)];
    
    %Minus mean of each channel
%     FFT_result_0=FFT_result_0-repmat(mean(FFT_result_0,1),size(FFT_result_0,1),1);
    %Remove the Interference of 50Hz
    FFT_result_0=[FFT_result_0(:,1:60),FFT_result_0(:,60),FFT_result_0(:,62:180),FFT_result_0(:,180)...
        ,FFT_result_0(:,182:300),FFT_result_0(:,300),FFT_result_0(:,302:end)];
    
    FFT_Data_0{i}=FFT_result_0;

    % trials contrast=1
    FFT_result_1_Pre = [];
    fs=625;% Sample rate
    L=750;% Length of the LFP data
    for j = 1:length(con_index_1)
        for k = 1:size(FFT_LFP_1,1)
            Y=fft(FFT_LFP_1(k,:,j));
            P2 = abs(Y/L);% Two-sided spectrum
            P1 = P2(1:L/2+1);% Single-sided spectrum
            P1(2:end-1) = 2*P1(2:end-1); % Convert to single-sided spectrum
            f_fft = fs*(0:(L/2))/L;% Define the frequency domain
            FFT_result_1_Pre(k,:,j)=P1;
        end
    end
    FFT_result_1=mean(FFT_result_1_Pre,3);
    %Delete Interference Electrode(you will find it after you check the LFP average image)
    FFT_result_1=[FFT_result_1(1:191,:);FFT_result_1(191,:);FFT_result_1(193:end,:)];
    
%     FFT_result_1=FFT_result_1-repmat(mean(FFT_result_1,1),size(FFT_result_1,1),1);
    FFT_result_1=[FFT_result_1(:,1:60),FFT_result_1(:,60),FFT_result_1(:,62:180),FFT_result_1(:,180)...
        ,FFT_result_1(:,182:300),FFT_result_1(:,300),FFT_result_1(:,302:end)];

    FFT_Data_1{i}=FFT_result_1;

    %PSD Analysis
    %trials contrast=0
    PSD_result_0_Pre=[];
    fs=625;
    L=750;
    for j = 1:length(con_index_0)
        for k = 1:size(FFT_LFP_0)
            [pxx,f_psd]=pwelch(FFT_LFP_0(k,:,j),L,L/2,L,fs);% 50% overlap
            PSD_result_0_Pre(k,:,j)=pxx;
        end
    end
    PSD_result_0=mean(PSD_result_0_Pre,3);
    PSD_result_0=[PSD_result_0(1:191,:);PSD_result_0(191,:);PSD_result_0(193:end,:)];
%     PSD_result_0=PSD_result_0-repmat(mean(PSD_result_0,1),size(PSD_result_0,1),1);
    PSD_result_0=[PSD_result_0(:,1:59),PSD_result_0(:,59),PSD_result_0(:,59),PSD_result_0(:,63),PSD_result_0(:,63:end)];
    PSD_Data_0{i}=PSD_result_0;
    %trials contrast=1
    PSD_result_1_Pre=[];
    fs=625;
    L=750;
    for j = 1:length(con_index_1)
        for k = 1:size(FFT_LFP_1)
            [pxx,f_psd]=pwelch(FFT_LFP_1(k,:,j),L,L/2,L,fs);% 50% overlap
            PSD_result_1_Pre(k,:,j)=pxx;
        end
    end
    PSD_result_1=mean(PSD_result_1_Pre,3);
    PSD_result_1=[PSD_result_1(1:191,:);PSD_result_1(191,:);PSD_result_1(193:end,:)];
%     PSD_result_1=PSD_result_1-repmat(mean(PSD_result_1,1),size(PSD_result_1,1),1);
    PSD_result_1=[PSD_result_1(:,1:59),PSD_result_1(:,59),PSD_result_1(:,59),PSD_result_1(:,63),PSD_result_1(:,63:end)];
    PSD_Data_1{i}=PSD_result_1;
end
save Pre_FFT_Data.mat


