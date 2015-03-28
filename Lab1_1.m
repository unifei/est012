%Eliminando possíveis lixos de memória
clear all;
close all;

%Constantes iniciais
f0 = 60;                            %Frequência do sinal de entrada
fs = 120;                           %Frequência de amostragem
T  = 1/fs;                          %Período do sinal amostrador

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Questão 1
t  = (1 + T/10):T/10:(4*T + 1);     %Intervalo de tempo de amostragem
x  = 5*sin(2*3.14*f0*t);            %Sinal original

for k = 1:40
    y(k) = 1;                       %Trem de impulsos, com 40 pontos
end;

for k = 1:20
    y(2*k) = 0;
end;

for k = 1:40
    z(k) = x(k) * y(k);             %Sinal amostrado
end;

%Exibindo as formas de onda
figure(1)
plot(t, x);
xlabel('Tempo [s]', 'color', 'blue');
ylabel('Amplitude [V]', 'color', 'blue');
title('Sinal original', 'color', 'red');

figure(2)
stem(t, y);
xlabel('Tempo [s]', 'color', 'blue');
ylabel('Amplitude [V]', 'color', 'blue');
title('Trem de Impulsos amostrador', 'color', 'red');

figure(3)
stem(t, z);
xlabel('Tempo [s]', 'color', 'blue');
ylabel('Amplitude [V]', 'color', 'blue');
title('Sinal amostrado', 'color', 'red');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Questão 2
tt = (1 + T/20):T/20:(4*T + 1);     %Intervalo de tempo 2 de amostragem
xx = 5*sin(2*3.14*f0*tt);           %Sinal original, com mais pontos

for k = 1:80
    yy(k) = 1;                      %Trem de impulsos, com 80 pontos
end;

for k = 1:40
    yy(2*k) = 0;
end;

for k = 1:80
    zz(k) = xx(k) * yy(k);          %Sinal amostrado com mais pontos
end;

%Exibindo o sinal amostrado e o sinal amostrado, com mais pontos
figure(4)
stem(tt, yy);
xlabel('Tempo [s]', 'color', 'blue');
ylabel('Amplitude [V]', 'color', 'blue');
title('Trem de Impulsos, com mais pontos', 'color', 'red');

figure(5)
stem(tt, zz);
xlabel('Tempo [s]', 'color', 'blue');
ylabel('Amplitude [V]', 'color', 'blue');
title('Sinal amostrado com 80 pontos', 'color', 'red');
