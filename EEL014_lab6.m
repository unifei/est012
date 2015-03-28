% Removendo poss�veis lixos de mem�ria
clear all;
close all;
clc;

% Vari�veis iniciais
numS = 1;                % Nenhum zero no dom�nio S
denS = [1 1 1];         % Dois p�los no dom�nio S
Tsample1 = 0.1;      % Tempo de amostragem do exerc�cio 1
Tsample2 = 0.01;    % Tempo de amostragem do exerc�cio 2

% Discretizando a fun��o de transfer�ncia
[numZ1, denZ1] = c2dm(numS, denS, Tsample1, 'zoh');     % Exerc�cio 1
[numZ2, denZ2] = c2dm(numS, denS, Tsample2, 'zoh');     % Exerc�cio 2

disp('Fun��o de Transfer�ncia em Z obtida para um intervalo de amostragem de 100 [ms]');
numZ1
denZ1
disp('Pressione ENTER para continuar.');
pause;

fprintf('\n\n');
disp('Fun��o de Transfer�ncia em Z obtida para um intervalo de amostragem de 10 [ms]');
numZ2
denZ2
disp('Pressione ENTER para continuar.');
pause;

% Definindo o intervalo de tempo de visualiza��o da resposta ao degrau
tempo1 = (0 :   100) * Tsample1;    % 10 segundos de amostragem
tempo2 = (0 : 1000) * Tsample2;    % 10 segundos de amostragem

% Gerando resposta ao degrau discreto
Y1 = dstep (numZ1, denZ1, 0 :   100);
Y2 = dstep (numZ2, denZ2, 0 : 1000);

figure(1)
plot (tempo1, Y1);
title ('Resposta da fun��o 1 ao degrau unit�rio discreto.', 'color', 'yellow');
xlabel ('Tempo [s]', 'color', 'blue');
ylabel ('Amplitude [V]', 'color', 'blue');
grid on;

figure(2)
plot (tempo2, Y2);
title ('Resposta da fun��o 2 ao degrau unit�rio discreto.', 'color', 'green');
xlabel ('Tempo [s]', 'color', 'red');
ylabel ('Amplitude [V]', 'color', 'red');
grid on;