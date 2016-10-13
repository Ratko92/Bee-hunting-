function [ y ] = Decide( HB_desc, centroid_pollen, centroid_without_pollen )
    
   pollen_diff = HB_desc - centroid_pollen;
   without_pollen_diff = HB_desc - centroid_without_pollen;
   tmp1 = [pollen_diff(1), pollen_diff(3:4)];
   tmp2 = [without_pollen_diff(1), without_pollen_diff(3:4)];

   if (sqrt(tmp1* tmp1')) < (sqrt(tmp2 * tmp2')) 
        y = 1;
   else 
        y = 0;
   end
end

