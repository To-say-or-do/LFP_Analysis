% folderPath = 'D:/SA/Data'; % The path of the Data folder
% filePattern = fullfile(folderPath, '*.mat'); 
% files = dir(filePattern); % Select *.mat document
% 
% 
% %Create an environment to prevent duplicate data loading
% ALL_Data={};
% for a = 1:length(files)
%     fullFileName = fullfile(folderPath, files(a).name);
%     ALL_Data(a) = {fullFileName};
% end
% save Pre_Data.mat

%% Data Check
load Pre_Data.mat
% % check No.1 Data
% Data_1=load(ALL_Data{1});
% % main thing
% Response_LFP=Data_1.resps;% LFP Data
contrastValues = [0, 0.06, 0.12, 0.25, 1];
% Contrasts_Order=Data_1.contrasts;% Contrast Order
% TimeVector=Data_1.timeVector;% TimeVector
% % Take a brief look at the Contrast=1 LFP
% con_index = find(Contrasts_Order==contrastValues(5));%find position of contrast=1 trials
% LFP1=mean(Response_LFP(:,:,con_index),3);% mean the data by the third dimension
% % paint LFP(Depth/Electrode)
% figure;
% imagesc(flipud(LFP1));%  Reverse the Data
% xlabel('time(s)');
% ylabel('depth(μm)');
% xticks(1:100:750);
% xticklabels(round(TimeVector(1:100:750),2));
% yticks(1:25:384);
% yticklabels(0:500:7660)
% set(gca, 'YDir', 'reverse');% Reverse the Y axis
% figure;
% imagesc(LFP1);
% xlabel('time(s)');
% ylabel('electrode');
% xticks(1:100:750);
% xticklabels(round(TimeVector(1:100:750),2));

