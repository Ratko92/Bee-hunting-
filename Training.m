
clear all;
load('truth_data.mat');
load('mi.mat');
training_number = 100;
% 29 slika daje cudne rezultate
% Nema pcele na njoj
no(29) = no(28);
HB_desc_no_i = zeros(training_number, 4);
HB_desc_yes_i = zeros(training_number, 4);
for i = 1 : training_number
   s = sprintf('image_%d.jpg',no(i));
   a = imread(s);
   a = im2double(a);
   mask = color_seg(a);
   b = a .* mask;
   image = b;
   HB_desc_no_i(i,:) = extract_Features(image,mi);
   y_train(i) = 2;
end

for i = 1 : training_number
   s = sprintf('image_%d.jpg',yes(i));
   a = imread(s);
   a = im2double(a);
   mask = color_seg(a);
   b = a .* mask;
   image = b;
   HB_desc_yes_i(i,:) = extract_Features(image,mi);
   y_train(i + training_number) = 1;

end

HB_desc_yes_mean = mean(HB_desc_yes_i);
HB_desc_no_mean = mean(HB_desc_no_i);
save('HB_desc_lab','HB_desc_yes_i','HB_desc_no_i','HB_desc_yes_mean', 'HB_desc_no_mean','training_number','y_train');

