figure
subplot(1,3,1)
for q = 1:size(Amp,1)
    hold on
    plot(contrastValues,Amp(q,:),".-",'DisplayName',files(q).name(1:6));
    xticks(contrastValues);
    hold off
end
lgd=legend;
lgd.FontSize=6;
lgd.Position = [0.9 0.9 0 0];
pbaspect([1 1 1]);
title('Contrast Responses');



subplot(1,3,2)
for q = 1:size(Amp,1)
    hold on
    plot(contrastValues,Amp(q,:)/Amp(q,5),".-",'DisplayName',files(q).name(1:6));
    xticks(contrastValues);
    hold off
end
lgd=legend;
lgd.FontSize=6;
lgd.Position = [0.9 0.9 0 0];
pbaspect([1 1 1]);
title('Normalised Contrast Responses');

subplot(1,3,3)
for q = 1:size(Amp,1)
    time_amp=[Spike_min{q,4}(3),Spike_min{q,5}(3)];
    hold on
    plot(contrastValues(4:end),time_amp,".-",'DisplayName',files(q).name(1:6))
    hold off
end
xticks(contrastValues);
lgd=legend;
lgd.FontSize=6;
lgd.Position = [0.9 0.9 0 0];
pbaspect([1 1 1]);
title('Negative Peak Time');