%% Create Average LFP and LFP Plot
%Average LFP
load Pre_LFP_Data.mat
figure
pic=gcf;
start_p=300;
end_p=384;
step=100;
set(pic,'InnerPosition',[0 0 3200 2000]);
for i = 1:length(LFP_Data)
    subplot(length(files)/3,length(files)/3,i);
    imagesc(LFP_Data{i}(strat_p:end_p,:));
    xlabel('time(s)');
    ylabel('electrode');
    xticks(1:step:length(TimeVector));
    xticklabels(round(TimeVector(1:step:end),2));
    pbaspect([1 1 1]);% adjust the ratio of picture frame
    title('LFP-Average',files(i).name(1:6));
end
% save image as PNG
exportgraphics(gcf, 'LFP-Average.png', 'Resolution', 300);
% 
% 
% %LFP Plot
% 
% 
% for i = 1:length(LFP_Data)
%     figure
%     hold on
%     for j = 1:size(LFP_Data{i},1)
%         plot(LFP_Data{i}(j,:)*3e4+j*6);
%     end
%     hold off
%     xlabel('time(s)');
%     ylabel('electrode');
%     xticks(1:100:length(TimeVector));
%     xticklabels(round(TimeVector(1:100:end),2));
%     yticks(0:600:(size(LFP_Data{i},1)-1)*6);
%     yticklabels(0:100:size(LFP_Data{i},1));
%     set(gca,'Ylim',[-100,(size(LFP_Data{i},1)-1)*6+20]);
% %     set(gca, 'YTick', []);
%     hLines = findall(gca, 'Type', 'Line');
%     set(hLines, 'Color', 'black');
%     pbaspect([1 1 1]);
%     title_name= sprintf('LFP-Plot%s',files(i).name(1:6));
%     title(title_name);
%     image_name=sprintf('LFP-Average-Plot%s.png',files(i).name(1:6));
%     exportgraphics(gcf, image_name, 'Resolution', 300);
%     set(gcf,'InnerPosition',[0 0 3200 2000]);
% end

