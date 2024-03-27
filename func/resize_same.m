function [cropped_image1,cropped_image2] = resize_same(image1,image2)

size1 = size(image1);
size2 = size(image2);


min_width = min(size1(2), size2(2));
min_height = min(size1(1), size2(1));
cropped_image1 = imcrop(image1, [1, 1, min_width - 1, min_height - 1]);
cropped_image2 = imcrop(image2, [1, 1, min_width - 1, min_height - 1]);

end

