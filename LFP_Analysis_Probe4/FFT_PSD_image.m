% %% Create FFT and PSD image
% % FFT image
% %contrast=0
% load FFT_PSD.mat
% figure;
% set(gcf,'InnerPosition',[0 0 3200 2000]);
% for i = 1:size(FFT_Data_0,1)
%     for j = 1:size(FFT_Data_0,2)
%         subplot(size(FFT_Data_0,1),size(FFT_Data_0,2),(i-1)*size(FFT_Data_0,2)+j);
%         imagesc(FFT_Data_0{i,j}(:,21:141));
%         xlabel('frequency(Hz)');
%         ylabel('electrode');
%         xticks(1:6:121);
%         xticklabels(round(f_fft(21:6:141),2));
%         colormap('jet');
%         pbaspect([1 1 1]);% adjust the ratio of picture frame
%         title_name=sprintf('FFT_0 %s probe%d',files(i).name(1:6),j);
%         title(title_name);
%     end
% end
% image_name=sprintf('FFT_0.png');
% exportgraphics(gcf, image_name, 'Resolution', 300);
% 
% %contrast=1
% figure;
% set(gcf,'InnerPosition',[0 0 3200 2000]);
% for i = 1:size(FFT_Data_1,1)
%     for j = 1:size(FFT_Data_1,2)
%         subplot(size(FFT_Data_1,1),size(FFT_Data_1,2),(i-1)*size(FFT_Data_1,2)+j);
%         imagesc(FFT_Data_1{i,j}(:,21:141));
%         xlabel('frequency(Hz)');
%         ylabel('electrode');
%         xticks(1:6:121);
%         xticklabels(round(f_fft(21:6:141),2));
%         colormap('jet');
%         pbaspect([1 1 1]);% adjust the ratio of picture frame
%         title_name=sprintf('FFT_1 %s probe%d',files(i).name(1:6),j);
%         title(title_name);
%     end
% end
% image_name=sprintf('FFT_1.png');
% exportgraphics(gcf, image_name, 'Resolution', 300);
% 
% %PSD image
% %contrast=0
% figure;
% set(gcf,'InnerPosition',[0 0 3200 2000]);
% for i = 1:size(PSD_Data_0,1)
%     for j = 1:size(PSD_Data_0,2)
%         subplot(size(PSD_Data_0,1),size(PSD_Data_0,2),(i-1)*size(PSD_Data_0,2)+j);
%         imagesc(PSD_Data_0{i,j}(:,21:141));
%         xlabel('frequency(Hz)');
%         ylabel('electrode');
%         xticks(1:6:121);
%         xticklabels(round(f_psd(21:6:141),2));
%         colormap('jet');
%         pbaspect([1 1 1]);% adjust the ratio of picture frame
%         title_name=sprintf('PSD_0 %s probe%d',files(i).name(1:6),j);
%         title(title_name);
%     end
% end
% image_name=sprintf('PSD_0.png');
% exportgraphics(gcf, image_name, 'Resolution', 300);
% 
% %contrast=1
% figure;
% set(gcf,'InnerPosition',[0 0 3200 2000]);
% for i = 1:size(PSD_Data_1,1)
%     for j = 1:size(PSD_Data_1,2)
%         subplot(size(PSD_Data_1,1),size(PSD_Data_1,2),(i-1)*size(PSD_Data_1,2)+j);
%         imagesc(PSD_Data_1{i,j}(:,21:141));
%         xlabel('frequency(Hz)');
%         ylabel('electrode');
%         xticks(1:6:121);
%         xticklabels(round(f_psd(21:6:141),2));
%         colormap('jet');
%         pbaspect([1 1 1]);% adjust the ratio of picture frame
%         title_name=sprintf('PSD_1 %s probe%d',files(i).name(1:6),j);
%         title(title_name);
%     end
% end
% image_name=sprintf('PSD_1.png');
% exportgraphics(gcf, image_name, 'Resolution', 300);
% 

%% Create FFT and PSD image
% FFT image
%contrast=0
load FFT_PSD.mat
figure;
set(gcf,'InnerPosition',[0 0 3200 2000]);
for i = 1:size(FFT_Data_0,1)
    for j = 1:size(FFT_Data_0,2)
        subplot(size(FFT_Data_0,1),size(FFT_Data_0,2),(i-1)*size(FFT_Data_0,2)+j);
        imagesc(FFT_Data_0{i,j});
        xlabel('frequency(Hz)');
        ylabel('electrode');
        xticks(1:50:size(FFT_Data_0{i,j},2));
        xticklabels(round(f_fft(1:50:end),2));
        colormap('jet');
        pbaspect([1 1 1]);% adjust the ratio of picture frame
        title_name=sprintf('FFT_0 %s probe%d',files(i).name(1:6),j);
        title(title_name);
    end
end
image_name=sprintf('FFT_0.png');
exportgraphics(gcf, image_name, 'Resolution', 300);

%contrast=1
figure;
set(gcf,'InnerPosition',[0 0 3200 2000]);
for i = 1:size(FFT_Data_1,1)
    for j = 1:size(FFT_Data_1,2)
        subplot(size(FFT_Data_1,1),size(FFT_Data_1,2),(i-1)*size(FFT_Data_1,2)+j);
        imagesc(FFT_Data_1{i,j});
        xlabel('frequency(Hz)');
        ylabel('electrode');
        xticks(1:50:size(FFT_Data_1{i,j},2));
        xticklabels(round(f_fft(1:50:end),2));
        colormap('jet');
        pbaspect([1 1 1]);% adjust the ratio of picture frame
        title_name=sprintf('FFT_1 %s probe%d',files(i).name(1:6),j);
        title(title_name);
    end
end
image_name=sprintf('FFT_1.png');
exportgraphics(gcf, image_name, 'Resolution', 300);

%PSD image
%contrast=0
figure;
set(gcf,'InnerPosition',[0 0 3200 2000]);
for i = 1:size(PSD_Data_0,1)
    for j = 1:size(PSD_Data_0,2)
        subplot(size(PSD_Data_0,1),size(PSD_Data_0,2),(i-1)*size(PSD_Data_0,2)+j);
        imagesc(PSD_Data_0{i,j});
        xlabel('frequency(Hz)');
        ylabel('electrode');
        xticks(1:50:size(PSD_Data_0{i,j},2));
        xticklabels(round(f_psd(1:50:end),2));
        colormap('jet');
        pbaspect([1 1 1]);% adjust the ratio of picture frame
        title_name=sprintf('PSD_0 %s probe%d',files(i).name(1:6),j);
        title(title_name);
    end
end
image_name=sprintf('PSD_0.png');
exportgraphics(gcf, image_name, 'Resolution', 300);

%contrast=1
figure;
set(gcf,'InnerPosition',[0 0 3200 2000]);
for i = 1:size(PSD_Data_1,1)
    for j = 1:size(PSD_Data_1,2)
        subplot(size(PSD_Data_1,1),size(PSD_Data_1,2),(i-1)*size(PSD_Data_1,2)+j);
        imagesc(PSD_Data_1{i,j});
        xlabel('frequency(Hz)');
        ylabel('electrode');
        xticks(1:50:size(PSD_Data_1{i,j},2));
        xticklabels(round(f_psd(1:50:end),2));
        colormap('jet');
        pbaspect([1 1 1]);% adjust the ratio of picture frame
        title_name=sprintf('PSD_1 %s probe%d',files(i).name(1:6),j);
        title(title_name);
    end
end
image_name=sprintf('PSD_1.png');
exportgraphics(gcf, image_name, 'Resolution', 300);

