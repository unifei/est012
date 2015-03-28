%Eliminando poss�veis lixos de mem�ria
close all;
clear all;

%Determinando pr�-condi��es para os gr�ficos
N = 11;         % Valor limitador de itera��es
A = 5;          % Amplitude da onda 5[V]
p = 1;          % Contadores para gerar posi��es dos vetores
q = 1;          % (que representar�o coeficientes das s�ries de Fourier)
x = -N:N;       % Representa��o das s�ries at� o 11� harm�nico

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Caso a)

% Calculando os valores de amplitude da onda
for n = -N:N    % 'n' determina o n�mero de elementos na s�rie de Fourier
    if (abs(n) == 1)
        cn(p) = 0;          % Meia onda senoidal
        p = p + 1;
    else
        cn(p) = (A/(2*pi))*((1+exp(-j*n*pi))/(1-n^2));  % Equa��o j� determinada
        p = p + 1;
    end
end

% Plotando os gr�ficos de espectros
figure(1)
stem(x, abs(cn));       % Espectro de amplitude
xlabel('�ndice');
ylabel('Amplitude [V]');
title('Espectro de Amplitude de uma meia onda senoidal');
grid on;

figure(2)
stem(x, angle(cn));     % Espectro de fase
xlabel('�ndice');
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
        dn(q) = (A/(j*n*pi)*(1-exp(-j*n*pi)));      % Equa��o j� determinada
        q = q + 1;
    end
end

% Plotando os gr�ficos de espectros
figure(3)
stem(x, abs(dn));       % Espectro de amplitude
xlabel('�ndice');
ylabel('Amplitude [V]');
title('Espectro de Amplitude de uma onda quadrada');
grid on;

figure(4)
stem(x, angle(dn));     % Espectro de fase
xlabel('�ndice');
ylabel('Fase [rad]');
title('Espectro de Fase de uma onda quadrada');
grid on;