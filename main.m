%Terceiro relatório
clc;
clear all;
close all;


%sinal = input('Enter the bit stream = ');
sinal = [ 1 0 0 1 1 1 0 1 0 1 0 1 1 1 0 ]

n = length(sinal);
t = 0:0.01:n;

saida = psk(sinal, n, t)

filtro = filtroCosseno(8, 0.5)


subplot(3,2,3);
plot(filtro);

ylabel('Amplitude');
title('filtro Cosseno');
grid on;

subplot(3,2,4);

sinalFiltrado = stem(conv(saida,filtro));
plot(sinalFiltrado);

ylabel('Amplitude');
title('Sinal Filtrado');
grid on;






