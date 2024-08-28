%% Create CSD and iCSD image
% CSD image
load Pre_CSD_Data.mat
figure
set(gcf,'InnerPosition',[0 0 3200 2000]);

for i = 1:size(CSD_val,1)
    for j = 1:size(CSD_val,2)
        subplot(size(CSD_val,1),size(CSD_val,2),(i-1)*size(CSD_val,2)+j);
        imagesc(imgaussfilt(CSD_val{i,j},2));
        xlabel('time(s)');
        ylabel('electrode');
        xticks(1:100:length(TimeVector));
        xticklabels(round(TimeVector(1:100:end),2));
        pbaspect([1 1 1]);% adjust the ratio of picture frame
        title_name=sprintf('CSD%s Probe%d',files(i).name(1:6),j);
        title(title_name);
    end
end
image_name=sprintf('CSD.png');
exportgraphics(gcf, image_name, 'Resolution', 300);

% %iCSD image
% figure
% for i = 1:size(iCSD_val,1)
%     for j = 1:size(iCSD_val,2)
%         subplot(size(CSD_val,1),size(CSD_val,2),(i-1)*size(CSD_val,2)+j);
%         imagesc(imgaussfilt(iCSD_val{i,j},2));
%         xlabel('time(s)');
%         ylabel('electrode');
%         xticks(1:100:length(TimeVector));
%         xticklabels(round(TimeVector(1:100:end),2));
%         pbaspect([1 1 1]);% adjust the ratio of picture frame
%         title('iCSD',files(i).name(1:6));
%     end
% end

