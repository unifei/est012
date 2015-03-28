% Exemplo de aplica��o de filtro adaptativo em atenua��o de ru�dos.

clear all; % Zerar variaveis.

f = input('Entrar com a freq��ncia do ru�do = ');
ar = input('Entrar com a amplitude do ru�do acoplado = ');

t_max = 0.5; % Tempo de simula��o.
N = 4;   % N�mero de amostras por per�odo.
s = N*f; % Amostras por segundo.
na = s * t_max + 1; % N�mero de amostra total.

sinal = 0.25 * rands(1,na); % Simula��o aleat�ria de um sinal (original s/ ru�do).

i = 1:na; % �ndice.
ruido = sin(2*pi*(i-1)/N); % Simula��o do ru�do ambiente.
prop_ruido = ar * sin(2*pi*(i-1)/N + pi/2); % Simula��o do ru�do acoplado. 
delay_ruido = [ruido; 0 ruido(1:length(ruido)-1)]; % Delay das amostras do ru�do.

sinal_ruido = sinal + prop_ruido; % Sinal + ru�do.

w = [0.04 -0.2]; % Valores iniciais dos coeficientes do filtro.

X = delay_ruido; % Vetor da vari�vel de ru�do.
m = sinal_ruido(1:na); % Vetor da vari�vel do mix do sinal + ru�do.

q = size(X,2); % Dimens�o do vetor de entrada.

ts = [1:q]/(q * t_max); % Tempo de simula��o.

fat = 0.1; % Fator de adapta��o do filtro.
for i=1:q  % Rotina de adapta��o dos coeficientes do filtro.
   x = X(:,i);   % Entrada do filtro.
   y(i) = w * x; % Sa�da do filtro adaptativo.
   e(i) = m(i) - y(i); % Sinal com ru�do filtrado = Erro de adapta��o.
   dw = fat * e(i) * x'; % Varia��o dos coeficientes do filtro.
   w = w + dw; % Atualiza��o/adapta��o dos coeficientes.
end

% Gr�ficos.
plot(ts,sinal,'b',ts,m,'r'); grid;
xlabel('t [s]'); ylabel('Sinal Original = Cor Azul; Sinal com Ru�do = Cor Vermelha');
Tit = input('Abrir outra figura e pressionar <Enter>');
plot(ts,sinal,'b',ts,e,'r'); grid;
xlabel('t [s]'); ylabel('Sinal Original = Cor Azul; Sinal Filtrado = Cor Vermelha');

