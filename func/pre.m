function pre_img = pre(img)

    data_mid = medfilt2(img, [7, 7]);
    data_mean=filter2(fspecial('average',7),data_mid);
    
    bw = edge(data_mean,'Roberts',30);
    
    se = strel('disk', 15, 0);
    
    bw2 = imclose(bw, se);
    
    obj = regionprops(bw2,'BoundingBox');

    area=obj(1).BoundingBox(3)*obj(1).BoundingBox(4);
    for i=1:numel(obj)
        flag=1;
        temp=obj(i).BoundingBox(3)*obj(i).BoundingBox(4);
        if area<temp
            flag=i;
        end
    end
    depth=obj(flag).BoundingBox(4);

    [data_ahe,~,~] = attenu_SE_v1(img,0.95,depth);
    
    pre_img = medfilt2(data_ahe, [5, 5]);

end

