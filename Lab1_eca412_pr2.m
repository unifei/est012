% Resposta de processo de 1a ordem usando equa��es no dom�nio Z.
% Gp(s)=1/(s + 1), Gzoh(s)=(1-exp(-sT))/s, G(s)=Gzoh(s).Gp(s),
% Y(s)/U(s)=G(s).

clear all;  %Zerar vari�veis.
cor =  'k'; %Cor preta nos gr�ficos.
tmax = 10;  %Tempo m�ximo de simula��o.

Ns = 1; Ds = [1 1]; %Fun��o do processo no dom�nio S.

T = input('T = '); %Tempo de amostragem.
na = tmax / T;     %N�mero de amostras.
n = 0:(na-1);      %Vari�vel amostra.
t = n*T;           %Valores de tempo de simula��o.

[Nz,Dz] = c2dm(Ns,Ds,T,'zoh'); %Obten��o de G(z).

Y = dstep(Nz,Dz,na); %Simula��o discreta do processo.

stairs(t,Y,cor); %Gr�fico da sa�da do processo.
xlabel('t [s]'); ylabel('Y(nT)'); grid;
title('Resposta do processo para entrada degrau');

Nz
Dz
