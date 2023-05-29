for ii=1:30003
    dist_list=[];
    for jj=1:320
        dist_list(jj)=norm(Scalp_3D(jj,:)-Cortex_3D(ii,:));
    end
    Min_Distance_to_Scalp(ii) = min(dist_list);
end
Min_Distance_to_Scalp=Min_Distance_to_Scalp.';