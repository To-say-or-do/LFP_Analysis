%% Create Average LFP and LFP Plot
%Average LFP
load Pre_LFP_Data.mat
figure
set(gcf,'InnerPosition',[0 0 3200 2000]);
for i = 1:size(LFP_Data,1)
    for j = 1:size(LFP_Data,2)
        subplot(size(LFP_Data,1),size(LFP_Data,2),size(LFP_Data,2)*(i-1)+j);
        imagesc(LFP_Data{i,j});
        xlabel('time(s)');
        ylabel('electrode');
        xticks(1:100:750);
        xticklabels(round(TimeVector(1:100:750),2));
        pbaspect([1 1 1]);% adjust the ratio of picture frame
        title_name=sprintf('LFP-Average%s Probe%d',files(i).name(1:6),j);
        title(title_name);
    end
end
image_name='LFP-Average.png';
exportgraphics(gcf, image_name, 'Resolution', 300);


figure
set(gcf,'InnerPosition',[0 0 3200 2000]);
for i = 1:size(LFP_Data,1)
    for j = 1:size(LFP_Data,2)
        %LFP Plot
        subplot(size(LFP_Data,1),size(LFP_Data,2),size(LFP_Data,2)*(i-1)+j);
        hold on
        for k = 1:size(LFP_Data{i,j},1)
            plot(LFP_Data{i,j}(k,:)*3e4+k*3);
        end
        hold off
        xlabel('time(s)');
        ylabel('electrode');
        xticks(1:100:length(TimeVector));
        xticklabels(round(TimeVector(1:100:end),2));
        yticks(0:150:(size(LFP_Data{i,j},1)-1)*3);
        yticklabels(0:1000:(size(LFP_Data{i,j},1)-1)*20);
        set(gca,'Ylim',[-100,(size(LFP_Data{i,j},1)-1)*3+20]);
        hLines = findall(gca, 'Type', 'Line');
        set(hLines, 'Color', 'black');
        pbaspect([1 1 1]);
        title_name=sprintf('LFP-Average-Plot%s Probe%d',files(i).name(1:6),j);
        title(title_name);
    end
end
image_name='LFP-Average-plot.png';
exportgraphics(gcf, image_name, 'Resolution', 300);

