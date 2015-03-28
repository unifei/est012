clear all; 
clc; 

sd=-5+j*9; 
md_sd=abs(sd); ag_sd=angle(sd); 
gs_sd=40/(0.25*sd^2+3.75*sd+14); 
md_gs=abs(gs_sd); ag_gs=angle(gs_sd); 
kp=-sin(ag_sd-ag_gs)/(md_gs*sin(ag_sd))
ki=-md_sd*sin(ag_gs)/(md_gs*sin(ag_sd)) 
