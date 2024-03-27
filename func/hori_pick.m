function [top_strata,btm_strata] = hori_pick(data,win,diagonal)
    
    data_mid = medfilt2(data, [win, win]);
    data_mean=filter2(fspecial('average',win),data_mid);
    
    bw = edge(data_mean,'Roberts');
    strata = continue_filter(bw,diagonal);
    
    [~,n]=size(data_mean);
    
    top_strata=zeros(1,n);
    btm_strata=zeros(1,n);
    
    point=find(strata(:,1)==1);
    top_strata(1,1)=point(1);
    btm_strata(1,1)=point(length(point));
    
    for i=2:n
        point=find(strata(:,i)==1);
        if isempty(point)
            top_strata(1,i)=top_strata(1,i-1);
            btm_strata(1,i)=btm_strata(1,i-1);
        else
            top_strata(1,i)=point(1);
            btm_strata(1,i)=point(length(point));
        end
    end
    
    top_strata=mean_1D(top_strata,3);
    btm_strata=mean_1D(btm_strata,3);

end

