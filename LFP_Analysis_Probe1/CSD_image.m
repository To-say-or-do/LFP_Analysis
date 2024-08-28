%% Create CSD and iCSD image
% CSD image
clear all
load Pre_CSD_Data.mat
figure
set(gcf,'InnerPosition',[0 0 3200 2000]);%set figure size

    
for i = 1:size(CSD_Data,2)
    subplot(length(files)/3,length(files)/3,i);
    imagesc(imgaussfilt(CSD_Data{i},5));
    xlabel('time(s)');
    ylabel('electrode');
    xticks(1:100:length(TimeVector));
    xticklabels(round(TimeVector(1:100:end),2));
    pbaspect([1 1 1]);% adjust the ratio of picture frame
    title('CSD',files(i).name(1:6));
end
image_name=sprintf('CSD.png');
exportgraphics(gcf, image_name, 'Resolution', 300);
% %iCSD image
% subplot(2,9,i+9);
% imagesc(imgaussfilt(CSD_inverse,2));
% xlabel('time(s)');
% ylabel('electrode');
% xticks(1:100:length(TimeVector));
% xticklabels(round(TimeVector(1:100:end),2));
% pbaspect([1 1 1]);% adjust the ratio of picture frame
% title('iCSD',files(i).name(1:6));
start_p=300;
end_p=375;
time_s=50;
time_e=350;
for i = 1:size(CSD_Data,2)
    subplot(length(files)/3,length(files)/3,i);
    imagesc(imgaussfilt(CSD_Data{i}(start_p:end_p,time_s:time_e),2));
    xlabel('time(s)');
    ylabel('electrode');
    xticks(1:100:time_e-time_s+1);
    xticklabels(round(TimeVector(time_s:100:time_e),2));
    pbaspect([1 1 1]);% adjust the ratio of picture frame
    title('CSD',files(i).name(1:6));
end
image_name=sprintf('CSD_300.png');
exportgraphics(gcf, image_name, 'Resolution', 300);

