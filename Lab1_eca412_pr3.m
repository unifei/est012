% Resposta de processo de 1a ordem usando equa��es a diferen�as.
% Gp(s)=1/(s + 1), Gzoh(s)=(1-exp(-sT))/s, G(s)=Gzoh(s).Gp(s),
% Y(s)/U(s)=G(s), para T=0,1s => G(Z)=0,0952/(Z-0,9048),
% para T=0,1s => Y(k)=0,9048.Y(k-1)+0,0952.U(k-1).

clear all;  %Zerar vari�veis.
cor =  'k'; %Cor preta nos gr�ficos.

T = 0.1;    %Tempo de amostragem.
na = 100;   %N�mero de amostras.

Yk_1 = 0; Yk = 0; Uk_1 = 0; Uk = 1; %Condi��es iniciais.
for n=0:na      %Loop de simula��o.
   Y(n+1) = Yk; %Armazenar valores.
   t(n+1) = n*T;
   Yk = 0.9048 * Yk_1 + 0.0952 * Uk; %Equa��o a diferen�as.
   Yk_1 = Yk; Uk_1 = Uk; %Atualiza��o das vari�veis.
end

stairs(t,Y,cor); %Gr�fico da sa�da do processo.
xlabel('t [s]'); ylabel('Y(nT)'); grid;
title('Resposta do processo para entrada degrau');
