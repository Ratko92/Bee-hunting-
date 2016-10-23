# Conclusion 

After reviewing results, we came to these conclusions:

 1. Updating centroid values leads to less accurate results. When algorithm misclassifies bee in term of pollen bearing, update process 
 shifts, centroid in wrong direction of a*b*Ecc space. Here we have error accumulation. 

 2. Error accumulation, has greater impact on normalized feature, than on unnormalized. My opinion is that error accumulation, hits 
 eccentricity than other two features. In unnormalized case, eccentricity is smaller in compare to values of other two features, while 
 eccentricity has greater impact in normalized case, because it's comparable to other two features.
 
 3. We leave out update process
