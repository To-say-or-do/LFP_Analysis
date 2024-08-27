% %% Create FFT and PSD image
% % FFT image
% %contrast=0
% L4_electrodes={300:350,300:350,300:350,300:350,320:360,300:384,300:384,310:384,300:384};
% figure;
% set(gcf,'InnerPosition',[0 0 3200 2000]);
% for i = 1:size(FFT_Data_0,2)
%     subplot(3,3,i)
%     imagesc(FFT_Data_0{i}(L4_electrodes{i},21:141));
%     xlabel('frequency(Hz)');
%     ylabel('electrode');
%     xticks(1:6:121);
%     xticklabels(round(f_fft(21:6:141),2));
%     colormap('jet');
%     pbaspect([1 1 1]);% adjust the ratio of picture frame
%     title('FFT_0',files(i).name(1:6));
% end
% image_name=sprintf('FFT-0.png');
% exportgraphics(gcf, image_name, 'Resolution', 300);
% 
% %contrast=1
% figure;
% set(gcf,'InnerPosition',[0 0 3200 2000]);
% for i = 1:size(FFT_Data_1,2)
%     subplot(3,3,i)
%     imagesc(FFT_Data_1{i}(L4_electrodes{i},21:141));
%     xlabel('frequency(Hz)');
%     ylabel('electrode');
%     xticks(1:6:121);
%     xticklabels(round(f_fft(21:6:141),2));
%     colormap('jet');
%     pbaspect([1 1 1]);% adjust the ratio of picture frame
%     title('FFT_1',files(i).name(1:6));
% end
% image_name=sprintf('FFT-1.png');
% exportgraphics(gcf, image_name, 'Resolution', 300);
% 
% 
% %PSD image
% %contrast=0
% figure;
% set(gcf,'InnerPosition',[0 0 3200 2000]);
% for i = 1:size(PSD_Data_0,2)
%     subplot(3,3,i)
%     imagesc(PSD_Data_0{i}(L4_electrodes{i},21:141));
%     xlabel('frequency(Hz)');
%     ylabel('electrode');
%     xticks(1:6:121);
%     xticklabels(round(f_psd(21:6:141),2));
%     colormap('jet');
%     pbaspect([1 1 1]);% adjust the ratio of picture frame
%     title('PSD_0',files(i).name(1:6));
% end
% image_name=sprintf('PSD-0.png');
% exportgraphics(gcf, image_name, 'Resolution', 300);
% 
% %contrast=1
% figure;
% set(gcf,'InnerPosition',[0 0 3200 2000]);
% for i = 1:size(PSD_Data_0,2)
%     subplot(3,3,i)
%     imagesc(PSD_Data_1{i}(L4_electrodes{i},21:141));
%     xlabel('frequency(Hz)');
%     ylabel('electrode');
%     xticks(1:6:121);
%     xticklabels(round(f_psd(21:6:141),2));
%     colormap('jet');
%     pbaspect([1 1 1]);% adjust the ratio of picture frame
%     title('PSD_1',files(i).name(1:6));
% end
% image_name=sprintf('PSD-1.png');
% exportgraphics(gcf, image_name, 'Resolution', 300);
% 

%% Create FFT and PSD image
% FFT image
%contrast=0
L4_electrodes={300:350,300:350,300:350,300:350,320:360,300:384,300:384,310:384,300:384};
figure;
set(gcf,'InnerPosition',[0 0 3200 2000]);
for i = 1:size(FFT_Data_0,2)
    subplot(3,3,i)
    imagesc(FFT_Data_0{i});
    xlabel('frequency(Hz)');
    ylabel('electrode');
    xticks(1:60:length(f_fft));
    xticklabels(round(f_fft(1:60:end),2));
    colormap('jet');
    pbaspect([1 1 1]);% adjust the ratio of picture frame
    title('FFT_0',files(i).name(1:6));
end
image_name=sprintf('FFT-0.png');
exportgraphics(gcf, image_name, 'Resolution', 300);

%contrast=1
figure;
set(gcf,'InnerPosition',[0 0 3200 2000]);
for i = 1:size(FFT_Data_1,2)
    subplot(3,3,i)
    imagesc(FFT_Data_1{i});
    xlabel('frequency(Hz)');
    ylabel('electrode');
    xticks(1:60:length(f_fft));
    xticklabels(round(f_fft(1:60:end),2));
    colormap('jet');
    pbaspect([1 1 1]);% adjust the ratio of picture frame
    title('FFT_1',files(i).name(1:6));
end
image_name=sprintf('FFT-1.png');
exportgraphics(gcf, image_name, 'Resolution', 300);


%PSD image
%contrast=0
figure;
set(gcf,'InnerPosition',[0 0 3200 2000]);
for i = 1:size(PSD_Data_0,2)
    subplot(3,3,i)
    imagesc(PSD_Data_0{i});
    xlabel('frequency(Hz)');
    ylabel('electrode');
    xticks(1:60:length(f_psd));
    xticklabels(round(f_psd(1:60:end),2));
    colormap('jet');
    pbaspect([1 1 1]);% adjust the ratio of picture frame
    title('PSD_0',files(i).name(1:6));
end
image_name=sprintf('PSD-0.png');
exportgraphics(gcf, image_name, 'Resolution', 300);

%contrast=1
figure;
set(gcf,'InnerPosition',[0 0 3200 2000]);
for i = 1:size(PSD_Data_0,2)
    subplot(3,3,i)
    imagesc(PSD_Data_1{i});
    xlabel('frequency(Hz)');
    ylabel('electrode');
    xticks(1:60:length(f_psd));
    xticklabels(round(f_psd(1:60:end),2));
    colormap('jet');
    pbaspect([1 1 1]);% adjust the ratio of picture frame
    title('PSD_1',files(i).name(1:6));
end
image_name=sprintf('PSD-1.png');
exportgraphics(gcf, image_name, 'Resolution', 300);






