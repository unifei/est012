% Resposta de processo de 1a ordem usando equações no domínio Z.
% Gp(s)=1/(s + 1), Gzoh(s)=(1-exp(-sT))/s, G(s)=Gzoh(s).Gp(s),
% Y(s)/U(s)=G(s).

clear all;  %Zerar variáveis.
cor =  'k'; %Cor preta nos gráficos.
tmax = 10;  %Tempo máximo de simulação.

Ns = 1; Ds = [1 1]; %Função do processo no domínio S.

T = input('T = '); %Tempo de amostragem.
na = tmax / T;     %Número de amostras.
n = 0:(na-1);      %Variável amostra.
t = n*T;           %Valores de tempo de simulação.

[Nz,Dz] = c2dm(Ns,Ds,T,'zoh'); %Obtenção de G(z).

Y = dstep(Nz,Dz,na); %Simulação discreta do processo.

stairs(t,Y,cor); %Gráfico da saída do processo.
xlabel('t [s]'); ylabel('Y(nT)'); grid;
title('Resposta do processo para entrada degrau');

Nz
Dz
