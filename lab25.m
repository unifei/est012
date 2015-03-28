% Eliminando poss�veis lixos de mem�ria
close all;
clear all;

% Fun��o original, sem filtros
%---------------------------------------
% Par�metros da fun��o
a = 2;      % Amplitude (em V)
f1 = 150;   % Frequ�ncia (em Hz)
f2 = 450;   % Frequ�ncia (em Hz)

% Por Nyquist, � necessario que a frequ�ncia de amostragem (utilizada para
% determinar o numero de amostras utilizadas - vari�vel t) deve ser, ao
% menos, duas vezes maior que a maior frequ�ncia do sinal. Para melhorar o
% grafico, utilizam-se mais pontos
fs = 20 * f2;

% Determinando um vetor de instantes de tempo (n�mero de amostras)
t = (0.01/fs) : 1/fs : 800/fs;

% Fun��o dada
x = (a * sin(2 * pi * f1 * t)) + (a/3 * sin(2 * pi * f2 * t));
figure (1)
plot(x);

% Levando a fun��o para o dom�nio da frequ�ncia
x1 = fft(x);                % Transformada R�pida de Fourier

figure (2)
plot(fftshift(abs(x1)));    % somente centrando o gr�fico de frequ�ncias
%--------------------------------------

% Filtrando a fun��o
%--------------------------------------
% Aplicando o filtro RLC
R = 4*pi;           % Resist�ncia (em Ohm)
L = 0.1;            % Indut�ncia (em Henry)
C = 253.3*10^(-6);  % Capacit�ncia (em Farad)

% Calculando a fun��o de transfer�ncia
f = -400:399 ;
H = 1./ ((1 - (2 * pi * f).^2 * L * C) + (j*2*pi*f.*R*C));

% Convoluindo a fun��o H dada com o sinal original ap�s FFT
h = abs(ifft(H));

y = conv(h, x);
y = y(1:600);

% Fun��o filtrada no dom�nio do tempo
figure (3)
plot(y);

% Para o dom�nio da frequ�ncia
y2 = abs(fft(y));
y3 = fftshift(y2);

figure (4)
plot (y3);