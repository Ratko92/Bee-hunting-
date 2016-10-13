clear all
load('HB_desc_lab');
HB_desc_no = HB_desc_no_i;
HB_desc_yes = HB_desc_yes_i;
m = cat(1,HB_desc_yes,HB_desc_no);
mi_norm = min(m);
sigma_norm = max(m) - min(m);
HB_desc_neg_norm = ( HB_desc_no - repmat(mi_norm,[size(HB_desc_no,1),1])) ./  repmat(sigma_norm,[size(HB_desc_no,1),1]);
HB_desc_pos_norm = ( HB_desc_yes - repmat(mi_norm,[size(HB_desc_yes,1),1]) ) ./ repmat(sigma_norm,[size(HB_desc_yes,1),1]);
HB_desc_norm_yes =  mean(HB_desc_pos_norm);
HB_desc_norm_neg = mean(HB_desc_neg_norm);

save('HB_desc_norm_lab','HB_desc_norm_neg','HB_desc_norm_yes','mi_norm','sigma_norm');
