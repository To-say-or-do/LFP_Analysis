Spike_range_index=126:281;

%range of spike
Spike=Mean(Spike_range_index);


% Find the minimum value and its position
[minValue, linearIndexMin] = min(Spike);
time_min=TimeVector(linearIndexMin+125);
Spike_min{ac,k}=[minValue,linearIndexMin,time_min];

% Find the maximum value and its position
[maxValue, linearIndexMax] = max(Spike(linearIndexMin:end));
time_max=TimeVector(linearIndexMax+124+linearIndexMin);
Spike_max{ac,k}=[maxValue,linearIndexMax+linearIndexMin-1,time_max];

%Amplitude Calulation
Amp(ac,k)=Spike_max{ac,k}(1)-Spike_min{ac,k}(1);
