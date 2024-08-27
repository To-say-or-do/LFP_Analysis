%L4 Plot
load L4_Data.mat
k_t=3;%definiten search times
Label_L4={'0','0.06','0.12','0.25','1'};
Color_L4={'#E3716E','#ECA680','#7AC7E2','#F7DF87','#54BEAA'};
for i = 1:size(L4_Data,1)
    figure
    for k = 1:k_t 
        S_Area=mean(L4_electrodes{i})-10*(k-(k_t+1)/2)-5:mean(L4_electrodes{i})-10*(k-(k_t+1)/2)+4;
        
        subplot(1,3,k);
        hold on
        for l = 1:length(contrastValues)
            plot(mean(L4_Data{i,l}(S_Area,:)*3e04,1),'Color',Color_L4{l},'DisplayName',Label_L4{l},'LineWidth',1);
        end
        hold off
        xlabel('time(s)');
        ylabel('electrode');
        xticks(1:100:length(TimeVector));
        xticklabels(round(TimeVector(1:100:end),2));
    %     yticks(0:150:(size(Pre_Resps_2f,1)-1)*3);
    %     yticklabels(0:1000:(size(Pre_Resps_2f,1)-1)*20);
        set(gca,'Ylim',[-10,6]);
    %     set(gca,'YDir','reverse');
        hold on 
        plot([126 126],[-6 6],'k--','LineWidth',1,'Color','r');% time=0s
        hold off
        lgd=legend;
        lgd.FontSize=6;
        lgd.Position = [0.9 0.9 0 0];
        pbaspect([1 1 1]);
        title_name=sprintf('L4-Plot %s %d %d',files(i).name(1:6),mean(L4_electrodes{i})-10*(k-(k_t+1)/2)-5,mean(L4_electrodes{i})-5*(k-(k_t+1)/2)+4);
        title(title_name);
        
    end
end