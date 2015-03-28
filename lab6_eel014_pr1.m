clear all; 
clc; 

sd=-0.15+j*0.07; 
md_sd=abs(sd); ag_sd=angle(sd); 
gs_sd=20/(150*sd+1); 
md_gs=abs(gs_sd); ag_gs=angle(gs_sd); 
a0=10; 
a1=(a0*md_gs*sin(ag_sd-ag_gs)+sin(ag_sd))/(md_gs*md_sd*sin(ag_gs)) 
b1=-(a0*md_gs*sin(ag_sd)+sin(ag_sd+ag_gs))/(md_sd*sin(ag_gs))