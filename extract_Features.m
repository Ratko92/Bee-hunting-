function [ HB_desc ] = extract_Features( image, mi )
%EXTRACT_FEATURES 
% Function extract features, described in work for ISPRS
% Features are: Eccentricity, variation for each component for La*b*
% mi represents mean value of desired descriptor for honey bees without
% pollen
 % Eccentricity calculation
 mask = sum(image,3) > 0 ;
 stats = regionprops(mask,'MajorAxisLength','MinorAxisLength','Area');
 [~,k]= max([ stats.Area]);
 
 eccentricity = stats(k).MajorAxisLength ./ stats(k).MinorAxisLength;
 % Lab variance
 [nrows, ncolumns] = size(image);
 cform = makecform('srgb2lab'); 
 lab_bee = applycform(image,cform);
 [nrows, ncolumns,~] = size(image);
 tmp = reshape(lab_bee,[nrows*ncolumns,3]);
 tmp(all(~tmp,2), :) = [] ;
 regions = tmp;
 reg_size = size(regions,1);
 sigma = sum((regions - repmat(mi,[reg_size,1])).^2)/(reg_size - 1);
 HB_desc = [eccentricity, sigma];

end

