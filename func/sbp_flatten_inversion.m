function [data] = sbp_flatten_inversion(data_flat,flat,level)

    [m,n]=size(data_flat);
    data=zeros(m,n);
    for raw=1:n
        ss=flat(raw,1)-level;
        padding=data_flat(:,raw);
        sig=[zeros(ss,1);padding];
    
        data(:,raw)=sig(1:m);
    end
end

