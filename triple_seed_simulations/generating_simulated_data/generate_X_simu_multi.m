function [X_simu,seed_indx] = generate_X_simu_multi(Locs,timepoints,sampling_freq,lambda,seed_freq,seed_amp,Category)
% e.g.
% timepoints=6*140;sampling_freq=140;lambda=0.003;
% seed_freq=[[0.2;0.7;3;5],[11;17;43;67],[0.2;0.7;43;67]];
% seed_amp=[20e-9*ones(4,1),10e-9*ones(4,1),[20e-9;20e-9;10e-9;10e-9]];
% Category='Deep','Middle','Superficial'
% [X_simu] = generate_X_simu(HeadModel.GridLoc,timepoints,sampling_freq,lambda,seed_freq,seed_amp,Category)
N = size(Locs,1); % num of available cortical sources (size of source space)
k = size(seed_freq,2);  % num of seed sources
X_simu = zeros(N,timepoints);

load source_mindistance_to_electrode.mat
load Desikan-Killiany_LeftRight_vertices.mat
switch Category
    case 'Deep'
        LeftRight_source_list = find(Min_Distance_to_Scalp>=0.07);
    case 'Middle'
        LeftRight_source_list = intersect(find(Min_Distance_to_Scalp<0.055),...
            find(Min_Distance_to_Scalp>=0.035));
    case 'Superficial'
        LeftRight_source_list = find(Min_Distance_to_Scalp<0.02);
end
Left_source_list = intersect(LeftRight_source_list,Left_vertices);
Right_source_list = intersect(LeftRight_source_list,Right_vertices);
LeftRight_source_list = [Left_source_list;Right_source_list];
seed_indx(1) = Left_source_list(randperm(length(Left_source_list),1));
seed_indx(2) = Right_source_list(randperm(length(Right_source_list),1));
LeftRight_source_list(LeftRight_source_list==seed_indx(1))=[];
LeftRight_source_list(LeftRight_source_list==seed_indx(2))=[];
seed_indx(3) = LeftRight_source_list(randperm(length(LeftRight_source_list),1));
% lambda: distance constant for spatially exponential decay (unit:m)
% freq unit: Hz
% amp unit: A*m


% timepoints=6*140;sampling_freq=140;lambda=0.003;
% seed_freq=[[0.2;0.7;3;5],[11;17;43;67],[0.2;0.7;43;67]];
% seed_amp=[20e-9*ones(4,1),10e-9*ones(4,1),[20e-9;20e-9;10e-9;10e-9]];

for i=1:k
    a=Locs-Locs(seed_indx(i),:);
    b=sqrt(a(:,1).^2+a(:,2).^2+a(:,3).^2);
    signal = zeros(1,timepoints);
    for kkk = 1:4
        signal = signal+ seed_amp(kkk,i)*sin(2*pi*seed_freq(kkk,i)*(1:timepoints)/sampling_freq+2*pi*rand);
    end
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