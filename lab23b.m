%Eliminando possíveis lixos de memória
close all;
clear all;

%Determinando pré-condições para os gráficos
A = 5;          % Amplitude da onda 5[V]
p = 1;          % Contadores para gerar posições dos vetores
q = 1;          % (que representarão coeficientes das séries de Fourier)
r = 1;

T  = 2;         % Período igual a 2 (unidades de tempo)

N1 = 1;         % Reconstrução da onda para um harmônico
N2 = 5;         % Reconstrução da onda para 5 harmônicos
N3 = 10;        % Reconstrução da onda para 10 harmônicos
N4 = 100;       % Reconstrução da onda para 100 harmônicos

x1 = -N1:N1;    % Representação das séries até o 1º harmônico
x2 = -N2:N2;    % Representação das séries até o 5º harmônico
x3 = -N3:N3;    % Representação das séries até o 10º harmônico
x4 = -N4:N4;    % Representação das séries até o 100º harmônico

ondaA = linspace(0, 0, 5002);      % Reconstrução da meia onda senoidal para um período T
ondaB = linspace(0, 0, 5002);      % Reconstrução da onda quadrada para um período T

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for n = -N4:N4    % 'n' determina o número de elementos na série de Fourier
    if (abs(n) == 0)
        cn(p) = 0;
    else
        cn(p) = (A/(j*n*pi))*(1-exp(-j*n*pi));
    end
    
    for t = 1:0.001:3*T
         ondaA (r) = ondaA (r) + cn(p)*exp(j*n*(2*pi/T)*t);
         r = r + 1;
    end
    p = p + 1;
    r = 1;
end


% Plotando os gráficos
figure(1)
plot(abs(ondaA));