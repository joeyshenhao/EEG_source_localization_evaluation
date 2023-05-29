load ..\HeadModel_000_sci.mat
Locs=HeadModel.GridLoc;
for i=1:30003
    a=Locs-Locs(i,:);
    b=sqrt(a(:,1).^2+a(:,2).^2+a(:,3).^2);
    b=b(b~=min(b));
    b_min(i)=min(b);
end
fprintf(['Average spacing of cortical sources is ',num2str(1000*mean(b_min)),' mm.\n']);
% unit:m
