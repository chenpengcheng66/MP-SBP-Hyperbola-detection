function [data_ahe,data_edge_ahe,flat] = attenu_SE_v1(data,svd_thres,depth)

    [data_flat,flat,level] = sbp_flatten(data);
    [U,S,V] = svd(data_flat);
    [m,~]=size(data);
    thres_svd=floor(svd_thres*m);
    
    for ubb=1:thres_svd
        S(ubb:ubb)=0;
    end
    data_flat_svd=U*S*V';

    data_edge=data_flat_svd;

    data_flat_svd(1:(level+depth),:)=0;


    data_ahe= sbp_flatten_inversion(data_flat_svd,flat,level);
    data_edge_ahe= sbp_flatten_inversion(data_edge,flat,level);

end

