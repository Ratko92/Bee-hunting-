
clear all;
%%
load('truth_data.mat');
load('mi.mat');
load('HB_desc_lab.mat');
load('HB_desc_norm_lab.mat');

% Feature matrix
Feat_mat = zeros([length(no) + length(yes) - 2*training_number,size(HB_desc_no_i,2)]);
% Regularized matrix
Feat_mat_reg = zeros([length(no) + length(yes) - 2*training_number,size(HB_desc_no_i,2)]);

% Response
y_true = zeros([length(no) + length(yes) - 2*training_number,1]);
y_test = zeros([length(no) + length(yes) - 2*training_number,1]);

for i = 1 : length(yes) - training_number
   s = sprintf('image_%d.jpg',yes(i + training_number));
   a = imread(s);
   a = im2double(a);
   mask = color_seg(a);
   b = a .* mask;
   image = b;
   Feat_mat(i,:) = extract_Features(image,mi);
   y_true(i) = 1;
end

for i = [1 : length(no) - training_number] + length(yes) - training_number
   s = sprintf('image_%d.jpg',no(i + training_number - (length(yes) - training_number)));
   a = imread(s);
   a = im2double(a);
   mask = color_seg(a);
   b = a .* mask;
   image = b;
   Feat_mat(i,:) = extract_Features(image,mi);
   y_true(i) = 0;
end
save('Features','Feat_mat','y_true');

%%
% Normalization 
Feat_mat_reg =  ( Feat_mat - repmat(mi_norm,[size(Feat_mat,1),1])) ./  repmat(sigma_norm,[size(Feat_mat,1),1]);
    
% Decision part
% Without normalization
centroid_yes = HB_desc_yes_mean;
centroid_no = HB_desc_no_mean;

KN = 1;
KP = 1;
for i = 1:size(Feat_mat)
    y_test(i) = Decide(Feat_mat(i,:),centroid_yes,centroid_no);
    if  y_test(i) 
        centroid_yes = (KP*(centroid_yes) + Feat_mat(i,:))/(KP+1);
        KP = KP + 1;
    else
        centroid_no = (KN*(centroid_no) + Feat_mat(i,:))/(KN+1);
        KN = KN + 1;
    end
end

% Decision part
% With normalization
centroid_yes = HB_desc_norm_yes;
centroid_no = HB_desc_norm_neg;

KN = 1;
KP = 1;
for i = 1:size(Feat_mat)
    y_test_reg(i) = Decide(Feat_mat_reg(i,:),centroid_yes,centroid_no);
    if  y_test(i) 
        centroid_yes = (KP*(centroid_yes) + Feat_mat_reg(i,:))/(KP+1);
        KP = KP + 1;
    else
        centroid_no = (KN*(centroid_no) + Feat_mat_reg(i,:))/(KN+1);
        KN = KN + 1;
    end
end

acc = sum(y_true == y_test_reg')/size(Feat_mat,1);
disp(acc)

