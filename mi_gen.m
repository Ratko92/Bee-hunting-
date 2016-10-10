clear all;
load('truth_data.mat');
training_number = 50;
% 29 slika daje cudne rezultate
% Nema pcele na njoj
no(29) = no(28);
mi_i = zeros(training_number,3);
for i = 1: training_number
   s = sprintf('image_%d.jpg',no(i));
   a = imread(s);
   a = im2double(a);
   mask = color_seg(a);
   b = a .* mask;
   image = b;
   [nrows, ncolumns] = size(image);
   cform = makecform('srgb2lab'); 
   lab_bee = applycform(image,cform);
   [nrows, ncolumns,~] = size(image);
   tmp = reshape(lab_bee,[nrows*ncolumns,3]);
   tmp(all(~tmp,2), :) = [] ;
   mi_i(i,:) = mean(tmp);
  
end

mi = mean(mi_i);
save('mi.mat','mi');
