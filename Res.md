Results for ISPRS version:

Dvije promjene: 

  Prva je promjena u funkciji Extract_features.m. Kada se izvrši kolor segmentacija, dobije se još malih odvojenih regiona. Modifikacija 
se sastoji u uklananju tih regiona. 

  Druga promjena je pogreška je u klasifikatoru. Obrnuili smo znak nejednakosti. 
   
  Sa ažuriranjem: 
    1. Bez normalizacije -) 0.5606 
    2. Sa normalizacijom -) 0.7270
    
  Bez ažuriranja:
  
    1. Bez normalizacije -) 0.5509
    2. Sa normalizacijom -)  0.7544
