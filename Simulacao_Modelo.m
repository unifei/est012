%Exemplo de simula��o/valida��o do modelo resultante com estima��o de par�metros.

clear all;

%Valores de par�metros e vari�veis:
a1=0.9032;  b1=0.0954; T=0.1; N=100; 
yk=0; yk_1=0; uk_1=0; t=0;

for n = 1:N, %La�o de repeti��o:
   uk=1; %Entrada de excita��o do sistema: degrau unit�rio.
   yk = a1*yk_1 + b1*uk_1; %Modelo.
   yk_1 = yk; uk_1 = uk;   %Atualiza��o das vari�veis.

   vy(n) = yk;  %Armazena valor da vari�vel y em um vetor.  
   vt(n) = t;   %Armazena valor da vari�vel  t em um vetor.
   t = t + T;   %Incremento o valor da vari�vel independente.
end

%Gr�fico da Simula��o.
plot(vt,vy,'rx'); grid %Tra�ar gr�fico de y(t).
xlabel('t [s]'); ylabel('y(t)');
title('Simula��o do Modelo para Entrada Degrau Unit�rio');
