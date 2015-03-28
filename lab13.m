clc
clear all
close all
x = 0:0.0000001:0.00001;
y = sin(2*pi*10e4*x);
stem(y);