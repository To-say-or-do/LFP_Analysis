folderPath = 'D:/SA/Third-Phase/Data'; % The path of the Data folder
filePattern = fullfile(folderPath, '*.mat'); 
files = dir(filePattern); % Select *.mat document


%Create an environment to prevent duplicate data loading
ALL_Data={};
for a = 1:length(files)
    fullFileName = fullfile(folderPath, files(a).name);
    ALL_Data(a) = {fullFileName};
end
contrastValues = [0, 0.06, 0.12, 0.25, 1];
save Pre_Data.mat