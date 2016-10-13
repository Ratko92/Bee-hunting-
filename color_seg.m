function [ mask] = color_seg(image)
    % This function conducts color segmentation
    % in HSV color space using K-means 
    image = im2double(image);
    [nrows, ncolumns, ~] = size(image);

%     mi = [39.8297, 21.9687, 41.9242];
%     bg = [13.8502, 3.264,  4.1876];
    % Prebacujemo u HSI prostor
    tmp = rgb2hsv(image);
    I = ( image(:,:,1) + image(:,:,2) + image(:,:,3))/3; % Ovako se definise HSI komponenta
    bee_hsv(:,:,1) = tmp(:,:,1);
    bee_hsv(:,:,2) = tmp(:,:,2);
    bee_hsv(:,:,3) = I;

     % Ekvivalizacija

    
    bee_hsv_eq = bee_hsv;

    nColors = 2;
    hsv_bee_eq = reshape(bee_hsv_eq(:,:,1),[nrows*ncolumns,1]);
    [cluster_idx , cluster_center] = kmeans(hsv_bee_eq,nColors,'distance','sqEuclidean', ...
                                              'Replicates', nColors);
    if cluster_center(1,1) < cluster_center(2,1) 
               num_ord = 1;
    else 
               num_ord = 2;
    end

    bm_hsv = cluster_idx == num_ord;
    bm_hsv = reshape(bm_hsv,size(image,1), size(image,2));
    mask = repmat(bm_hsv,[1,1,3]);
end

