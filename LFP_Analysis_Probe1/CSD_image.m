%% Create CSD and iCSD image
% CSD image
figure
set(gcf,'InnerPosition',[0 0 3200 2000]);

    
for i = 1:size(CSD_Data,2)
    subplot(3,3,i);
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
for i = 1:size(CSD_Data,2)
    subplot(3,3,i);
    imagesc(imgaussfilt(CSD_Data{i}(300:375,50:350),2));
    xlabel('time(s)');
    ylabel('electrode');
    xticks(1:100:length(TimeVector));
    xticklabels(round(TimeVector(1:100:end),2));
    pbaspect([1 1 1]);% adjust the ratio of picture frame
    title('CSD',files(i).name(1:6));
end
image_name=sprintf('CSD_300.png');
exportgraphics(gcf, image_name, 'Resolution', 300);

