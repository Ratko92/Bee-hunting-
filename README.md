# ISPRS_version

Matlab scripts implent work that is presented in ISPRS conference that was held in June 2016. 

color_seg.m ---> *Function implents color segmentation that extract bee from background. Segmentation is based on HSV color space, using only HUE component and k-means with two cluster, background cluster and bee cluster. Segmentation property (H_bg > H_bee, yellow honey bee on blue background.);*

mi_gen.m ---> *calculates parameter \mi that is used for features *

extract_Features.m ---> *Function implents feature extract from region that implents feature extractions. Features are eccentricity and variation in L*a*b*  *color space. Variation is calculated compared to parametat \mi *


mi_gen.m ---> *calculates parameter \mi that is used for features*

truth_data.mat ---> *Contains data for ground truth. 1 for pollen bearing honey bee, 0 for honey bee without pollen.*

decide.m ---> *NMC classifier*


Training.m ---> *Feature extractions and training NMC.*

Feature_scaling.m ---> *Feature scaling. X^\hat = (x - min(X))/(max(X)- min(X))*

testing.m ---> *Testing and evaulating ISPRS approach.*

Beedata.7z ---> *Image Database of bees.*
