%Exemplo de simulação/validação do modelo resultante com estimação de parâmetros.

clear all;

%Valores de parâmetros e variáveis:
a1=0.9032;  b1=0.0954; T=0.1; N=100; 
yk=0; yk_1=0; uk_1=0; t=0;

for n = 1:N, %Laço de repetição:
   uk=1; %Entrada de excitação do sistema: degrau unitário.
   yk = a1*yk_1 + b1*uk_1; %Modelo.
   yk_1 = yk; uk_1 = uk;   %Atualização das variáveis.

   vy(n) = yk;  %Armazena valor da variável y em um vetor.  
   vt(n) = t;   %Armazena valor da variável  t em um vetor.
   t = t + T;   %Incremento o valor da variável independente.
end

%Gráfico da Simulação.
plot(vt,vy,'rx'); grid %Traçar gráfico de y(t).
xlabel('t [s]'); ylabel('y(t)');
title('Simulação do Modelo para Entrada Degrau Unitário');
