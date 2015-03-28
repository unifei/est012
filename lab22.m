%Eliminando possíveis lixos de memória
close all;
clear all;

%Determinando pré-condições para os gráficos
N = 11;         % Valor limitador de iterações
A = 5;          % Amplitude da onda 5[V]
p = 1;          % Contadores para gerar posições dos vetores
q = 1;          % (que representarão coeficientes das séries de Fourier)
x = -N:N;       % Representação das séries até o 11º harmônico

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Caso a)

% Calculando os valores de amplitude da onda
for n = -N:N    % 'n' determina o número de elementos na série de Fourier
    if (abs(n) == 1)
        cn(p) = 0;          % Meia onda senoidal
        p = p + 1;
    else
        cn(p) = (A/(2*pi))*((1+exp(-j*n*pi))/(1-n^2));  % Equação já determinada
        p = p + 1;
    end
end

% Plotando os gráficos de espectros
figure(1)
stem(x, abs(cn));       % Espectro de amplitude
xlabel('Índice');
ylabel('Amplitude [V]');
title('Espectro de Amplitude de uma meia onda senoidal');
grid on;

figure(2)
stem(x, angle(cn));     % Espectro de fase
xlabel('Índice');
ylabel('Fase [rad]');
title('Espectro de Fase de uma meia onda senoidal');
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Caso b)

% Calculando os valores de amplitude da onda
for n = -N:N
    if (abs(n) == 0)
        dn(q) = 0;          % Onda quadrada
        q = q + 1;
    else
        dn(q) = (A/(j*n*pi)*(1-exp(-j*n*pi)));      % Equação já determinada
        q = q + 1;
    end
end

% Plotando os gráficos de espectros
figure(3)
stem(x, abs(dn));       % Espectro de amplitude
xlabel('Índice');
ylabel('Amplitude [V]');
title('Espectro de Amplitude de uma onda quadrada');
grid on;

figure(4)
stem(x, angle(dn));     % Espectro de fase
xlabel('Índice');
ylabel('Fase [rad]');
title('Espectro de Fase de uma onda quadrada');
grid on;