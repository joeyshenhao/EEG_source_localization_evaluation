function [X_simu,indx] = generate_X_simu(Locs,timepoints,sampling_freq,lambda,signal_freq,maxamp)
% e.g. timepoints=200;sampling_freq=200;lambda=0.003;signal_freq=[20,45];maxamp=[10e-9,10e-9];
% [X_simu] = generate_X_simu(HeadModel.GridLoc,timepoints,sampling_freq,lambda,signal_freq,maxamp)
N = size(Locs,1); %num of sources
k = max(size(signal_freq));  % num of seed sources
X_simu = zeros(N,timepoints);
indx = randperm(N,k);
% lambda: distance constant for spatially exponential decay (unit:m)
% freq unit: Hz
% amp unit: A*m
for i=1:k
a=Locs-Locs(indx(i),:);
b=sqrt(a(:,1).^2+a(:,2).^2+a(:,3).^2);
signal = maxamp(i)*sin(2*pi*signal_freq(i)*(1:timepoints)/sampling_freq+2*pi*rand);
    X=zeros(N,timepoints);
    for j=1:N
        X(j,:)=signal*exp(-b(j)/lambda);
    end
X_simu = X_simu + X;
end
X_simu(abs(X_simu)<200e-15)=0;
% A single pyramidal cell is believed to possibly generate a 20 fA-m signal
% along its presumed 2 mm (Hamalainen 1993), but more recent modeling
% suggests it may be as high as 200 fA-m (Okada 2006).
end