%% Amplitude Analysis
%Average LFP with Standard Deviation
contrast={'0','0.06','0.12','0.25','1'};
figure
set(gcf,'InnerPosition',[0 0 3200 2000]);
for i = 1:3
    for k=1:5
        subplot(3,5,k+5*(i-1))
        L4_filtered_LFP=Con_Resps{i,k};
        SD=std(L4_filtered_LFP,0);
        Mean=mean(L4_filtered_LFP,1);
        Mean_up=Mean+SD;
        Mean_down=Mean-SD;
        x=1:750;
        % Draw SD
        hold on
        fill([x, fliplr(x)], [Mean_up, fliplr(Mean_down)], 'b', 'FaceAlpha', 0.2, 'EdgeColor', 'none');
        plot(Mean);
        hold off
        xlabel('time(s)');
        ylabel('electrode');
        xticks(1:100:length(TimeVector));
        xticklabels(round(TimeVector(1:100:end),2));
        title_name=sprintf('L4 Contrast%s %s',contrast{k},files(i).name(1:6));
        title(title_name);
        ac=i;
        Amplitude_cal;
    end
end
image_name=sprintf('L4_1.png');
exportgraphics(gcf, image_name, 'Resolution', 300);

figure
set(gcf,'InnerPosition',[0 0 3200 2000]);
for i = 1:3
    for k=1:5
        subplot(3,5,k+5*(i-1))
        L4_filtered_LFP=Con_Resps{i+3,k};
        SD=std(L4_filtered_LFP,0);
        Mean=mean(L4_filtered_LFP,1);
        Mean_up=Mean+SD;
        Mean_down=Mean-SD;
        x=1:750;
        % Draw SD
        hold on
        fill([x, fliplr(x)], [Mean_up, fliplr(Mean_down)], 'b', 'FaceAlpha', 0.2, 'EdgeColor', 'none');
        plot(Mean);
        hold off
        xlabel('time(s)');
        ylabel('electrode');
        xticks(1:100:length(TimeVector));
        xticklabels(round(TimeVector(1:100:end),2));
        title_name=sprintf('L4 Contrast%s %s',contrast{k},files(i+3).name(1:6));
        title(title_name);
        ac=i+3;
        Amplitude_cal;
    end
end
image_name=sprintf('L4_2.png');
exportgraphics(gcf, image_name, 'Resolution', 300);

figure
set(gcf,'InnerPosition',[0 0 3200 2000]);
for i = 1:3
    for k=1:5
        subplot(3,5,k+5*(i-1))
        L4_filtered_LFP=Con_Resps{i+6,k};
        SD=std(L4_filtered_LFP,0);
        Mean=mean(L4_filtered_LFP,1);
        Mean_up=Mean+SD;
        Mean_down=Mean-SD;
        x=1:750;
        % Draw SD
        hold on
        fill([x, fliplr(x)], [Mean_up, fliplr(Mean_down)], 'b', 'FaceAlpha', 0.2, 'EdgeColor', 'none');
        plot(Mean);
        hold off
        xlabel('time(s)');
        ylabel('electrode');
        xticks(1:100:length(TimeVector));
        xticklabels(round(TimeVector(1:100:end),2));
        title_name=sprintf('L4 Contrast%s %s',contrast{k},files(i+6).name(1:6));
        ac=i+6;
        Amplitude_cal;
        title(title_name);
    end
end
image_name=sprintf('L4_3.png');
exportgraphics(gcf, image_name, 'Resolution', 300);