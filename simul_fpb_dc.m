% Teste de Y(k)=0,9251.Y(k-1)+0,0375.U(k)+0,0375.U(k-1).

clear all;  %Zerar vari�veis.

T = 0.01;    %Tempo de amostragem.
na = 4;      %N�mero de amostras.

Yk_1 = 0; Yk = 0; Uk_1 = 0; %Condi��es iniciais.

for n=0:na      %Loop de simula��o.
   Uk = 0.85;   %Sinal de entrada.
   U(n+1) = Uk;
   t(n+1) = n*T;
   nn(n+1)=n+1;
   Yk = 0.9251 * Yk_1 + 0.0375 * Uk + 0.0375 * Uk_1; %Eq. dif.
   Yk_1 = Yk; Uk_1 = Uk; %Atualiza��o das vari�veis.
   Y(n+1) = Yk; %Armazenar valores.
 end

plot(nn,Y); %Gr�ficos.
grid; xlabel('N�mero de computa��es da equa��o recursiva do filtro.'); ylabel('Y(kT)');
title('Resposta a um degrau de amplitude de 0,85.');