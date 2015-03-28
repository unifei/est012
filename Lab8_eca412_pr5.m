% Exemplo de aplicação de filtro adaptativo em atenuação de ruídos.

clear all; % Zerar variaveis.

f = input('Entrar com a freqüência do ruído = ');
ar = input('Entrar com a amplitude do ruído acoplado = ');

t_max = 0.5; % Tempo de simulação.
N = 4;   % Número de amostras por período.
s = N*f; % Amostras por segundo.
na = s * t_max + 1; % Número de amostra total.

sinal = 0.25 * rands(1,na); % Simulação aleatória de um sinal (original s/ ruído).

i = 1:na; % Índice.
ruido = sin(2*pi*(i-1)/N); % Simulação do ruído ambiente.
prop_ruido = ar * sin(2*pi*(i-1)/N + pi/2); % Simulação do ruído acoplado. 
delay_ruido = [ruido; 0 ruido(1:length(ruido)-1)]; % Delay das amostras do ruído.

sinal_ruido = sinal + prop_ruido; % Sinal + ruído.

w = [0.04 -0.2]; % Valores iniciais dos coeficientes do filtro.

X = delay_ruido; % Vetor da variável de ruído.
m = sinal_ruido(1:na); % Vetor da variável do mix do sinal + ruído.

q = size(X,2); % Dimensão do vetor de entrada.

ts = [1:q]/(q * t_max); % Tempo de simulação.

fat = 0.1; % Fator de adaptação do filtro.
for i=1:q  % Rotina de adaptação dos coeficientes do filtro.
   x = X(:,i);   % Entrada do filtro.
   y(i) = w * x; % Saída do filtro adaptativo.
   e(i) = m(i) - y(i); % Sinal com ruído filtrado = Erro de adaptação.
   dw = fat * e(i) * x'; % Variação dos coeficientes do filtro.
   w = w + dw; % Atualização/adaptação dos coeficientes.
end

% Gráficos.
plot(ts,sinal,'b',ts,m,'r'); grid;
xlabel('t [s]'); ylabel('Sinal Original = Cor Azul; Sinal com Ruído = Cor Vermelha');
Tit = input('Abrir outra figura e pressionar <Enter>');
plot(ts,sinal,'b',ts,e,'r'); grid;
xlabel('t [s]'); ylabel('Sinal Original = Cor Azul; Sinal Filtrado = Cor Vermelha');

