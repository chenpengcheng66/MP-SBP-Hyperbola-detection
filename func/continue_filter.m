function [bw_cf] = continue_filter(bw,diagonal)

    info_elem = regionprops(bw,'BoundingBox','PixelList');
    
    boundingMatrix = zeros(numel(info_elem), 2); 
    
    for i = 1:numel(info_elem)
        width = info_elem(i).BoundingBox(3);
        height = info_elem(i).BoundingBox(4);
    
        boundingMatrix(i, :) = [width, height];
    end
    
    for i = 1:numel(info_elem)
        diag_size=sqrt(boundingMatrix(:,1).^2+boundingMatrix(:,2).^2);
    end
    
    [row, ~] = find(diag_size < diagonal);
    
    bw_cf=bw;
    
    for i = 1:numel(row)
        temp=row(i);
        
        pixels=info_elem(temp).PixelList;
        
        for j = 1:size(pixels, 1)
            x = pixels(j, 1);
            y = pixels(j, 2);
            bw_cf(y, x) = 0;
        end
    end

end
