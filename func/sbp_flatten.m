function [data_flat,flat,level] = sbp_flatten(data)
    [m,n]=size(data);
    data_flat=zeros(m,n);
    flat=zeros(n,1);    
    for raw=1:n
        sig=data(:,raw);
        peak=max(sig);
        lot=find(sig==peak);
        flat(raw,1)=lot(1,1);
    end

    level=min(flat);

    for raw=1:n
        ss=flat(raw,1)-level;
        sig=data(:,raw);
        padding=sig(ss+1:m);
        flatten_sig=[padding;zeros(ss,1)];
        data_flat(:,raw)=flatten_sig;
    end

end

