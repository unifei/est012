%Eliminando possíveis lixos de memória
close all;
clear all;

%Determinando pré-condições para os gráficos
A = 5;          % Amplitude da onda 5[V]
p = 1;          % Contadores para gerar posições dos vetores
q = 1;          % (que representarão coeficientes das séries de Fourier)
r = 1;

T  = 2;          % Primeiro caso para um período de 2   (unidades de tempo)
TT = 200;        % Primeiro caso para um período de 200 (unidades de tempo)

N1 = 1;         % Reconstrução da onda para um harmônico
N2 = 5;         % Reconstrução da onda para 5 harmônicos
N3 = 10;        % Reconstrução da onda para 10 harmônicos
N4 = 100;       % Reconstrução da onda para 100 harmônicos

x1 = -N1:N1;    % Representação das séries até o 1º harmônico
x2 = -N2:N2;    % Representação das séries até o 5º harmônico
x3 = -N3:N3;    % Representação das séries até o 10º harmônico
x4 = -N4:N4;    % Representação das séries até o 100º harmônico

ondaA = linspace(0, 0, 5002);      % Reconstrução da meia onda senoidal para um período T
ondaAA = linspace(0, 0, 2001);      % Reconstrução da meia onda senoidal para um período TT
ondaB = linspace(0, 0, 2001);      % Reconstrução da onda quadrada para um período T
ondaBB = linspace(0, 0, 2001);      % Reconstrução da onda quadrada para um período TT

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for n = -N4:N4    % 'n' determina o número de elementos na série de Fourier
    if (abs(n) == 1)
        cn(p) = 0;          % Meia onda senoidal
        p = p + 1;
    else
        cn(p) = (A/(2*pi))*((1+exp(-j*n*pi))/(1-n^2));  % Equação já determinada
        p = p + 1;
    end
    
    for t = 1:0.001:3*T
         ondaA (r) = ondaA (r) + cn(p-1)*exp(j*n*2*pi*t/T);
         r = r + 1;
    end

    r = 1;
end


% Plotando os gráficos
figure(1)
plot(abs(ondaA));