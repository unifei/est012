% Demo of using different line codings

clear all;
close all;
clc;

t = 1; %1s de gravacao, 

%dados utilizados no primeiro relatório

fid = fopen('teste6.wav','r');
y = fread(fid,'int8');

bits = transpose(y)
bitrate = 1; % bits per second


figure;
[t,s] = nrz(bits,bitrate);
plot(t,s);
axis([0 t(end) -0.1 1.1])
grid on;
title(['Não retorna para zero:']);

figure;
[t,s] = rz(bits,bitrate);
plot(t,s,'LineWidth',3);
axis([0 t(end) -0.1 1.1])
grid on;
title(['Retorna para Zero:']);

figure;
[t,s] = manchester(bits,bitrate);
plot(t,s,'LineWidth',3);
axis([0 t(end) -1.1 1.1])
grid on;
title(['Manchester:']);
