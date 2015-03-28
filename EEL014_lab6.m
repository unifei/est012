% Removendo possíveis lixos de memória
clear all;
close all;
clc;

% Variáveis iniciais
numS = 1;                % Nenhum zero no domínio S
denS = [1 1 1];         % Dois pólos no domínio S
Tsample1 = 0.1;      % Tempo de amostragem do exercício 1
Tsample2 = 0.01;    % Tempo de amostragem do exercício 2

% Discretizando a função de transferência
[numZ1, denZ1] = c2dm(numS, denS, Tsample1, 'zoh');     % Exercício 1
[numZ2, denZ2] = c2dm(numS, denS, Tsample2, 'zoh');     % Exercício 2

disp('Função de Transferência em Z obtida para um intervalo de amostragem de 100 [ms]');
numZ1
denZ1
disp('Pressione ENTER para continuar.');
pause;

fprintf('\n\n');
disp('Função de Transferência em Z obtida para um intervalo de amostragem de 10 [ms]');
numZ2
denZ2
disp('Pressione ENTER para continuar.');
pause;

% Definindo o intervalo de tempo de visualização da resposta ao degrau
tempo1 = (0 :   100) * Tsample1;    % 10 segundos de amostragem
tempo2 = (0 : 1000) * Tsample2;    % 10 segundos de amostragem

% Gerando resposta ao degrau discreto
Y1 = dstep (numZ1, denZ1, 0 :   100);
Y2 = dstep (numZ2, denZ2, 0 : 1000);

figure(1)
plot (tempo1, Y1);
title ('Resposta da função 1 ao degrau unitário discreto.', 'color', 'yellow');
xlabel ('Tempo [s]', 'color', 'blue');
ylabel ('Amplitude [V]', 'color', 'blue');
grid on;

figure(2)
plot (tempo2, Y2);
title ('Resposta da função 2 ao degrau unitário discreto.', 'color', 'green');
xlabel ('Tempo [s]', 'color', 'red');
ylabel ('Amplitude [V]', 'color', 'red');
grid on;