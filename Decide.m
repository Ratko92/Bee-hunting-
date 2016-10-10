function [ y ] = Decide( HB_desc, centroid_pollen, centroid_without_pollen )
    
   pollen_diff = HB_desc - centroid_pollen;
   without_pollen_diff = HB_desc - centroid_without_pollen;
   
   if (sqrt(pollen_diff * pollen_diff')) > (sqrt(without_pollen_diff * without_pollen_diff')) 
        y = 1;
   else 
        y = 0;
   end
end

