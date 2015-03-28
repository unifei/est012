% Eliminando possíveis lixos de memória
close all;
clear all;

% Função original, sem filtros
%---------------------------------------
% Parâmetros da função
a = 2;      % Amplitude (em V)
f1 = 150;   % Frequência (em Hz)
f2 = 450;   % Frequência (em Hz)

% Por Nyquist, é necessario que a frequência de amostragem (utilizada para
% determinar o numero de amostras utilizadas - variável t) deve ser, ao
% menos, duas vezes maior que a maior frequência do sinal. Para melhorar o
% grafico, utilizam-se mais pontos
fs = 20 * f2;

% Determinando um vetor de instantes de tempo (número de amostras)
t = (0.01/fs) : 1/fs : 800/fs;

% Função dada
x = (a * sin(2 * pi * f1 * t)) + (a/3 * sin(2 * pi * f2 * t));
figure (1)
plot(x);

% Levando a função para o domínio da frequência
x1 = fft(x);                % Transformada Rápida de Fourier

figure (2)
plot(fftshift(abs(x1)));    % somente centrando o gráfico de frequências
%--------------------------------------

% Filtrando a função
%--------------------------------------
% Aplicando o filtro RLC
R = 4*pi;           % Resistência (em Ohm)
L = 0.1;            % Indutância (em Henry)
C = 253.3*10^(-6);  % Capacitância (em Farad)

% Calculando a função de transferência
f = -400:399 ;
H = 1./ ((1 - (2 * pi * f).^2 * L * C) + (j*2*pi*f.*R*C));

% Convoluindo a função H dada com o sinal original após FFT
h = abs(ifft(H));

y = conv(h, x);
y = y(1:600);

% Função filtrada no domínio do tempo
figure (3)
plot(y);

% Para o domínio da frequência
y2 = abs(fft(y));
y3 = fftshift(y2);

figure (4)
plot (y3);