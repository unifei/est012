% Simulação do observador de estado discreto do sistema com ruído
% onde G(s)=Gzoh.Gp(s), Gp(s)=100/(s^2+2s+100) e T=0,01.

clear all; %Limpar variáveis.

%Matrizes das variáveis de estado em representação discretizada.
A=[0.9753 -0.9884;0.0099 0.995]; B=[0.0099;0]; C=[0 100];

G=[0.3748;0.0077]; %Matriz de ganho do observador de estado.

T=0.01; np = 200; %Tempo de varredura e número de amostras.

Rw = 1; Rv = 0.01; %Informações sobre ruídos.

% Informações de dimensões.
dimB=size(B); nent=dimB(2); dimC=size(C); nsaid=dimC(1);

% Valores para simulação das amplitudes de entrada de ruídos.
Aw = input('Aw = ');
Av = input('Av = ');

% Geração dos ruídos na entrada e saída do sistema.
W = Aw*sqrt(Rw)*rand(np,nent); V = Av*sqrt(Rv)*rand(np,nsaid);

x=[0.05;0]; q=[0;0]; %Condições iniciais.

for n=1:np               %Ciclo de simulação.

   u=1+W(n);    %Entrada do sistema tipo degrau com ruído.

   x1=A*x+B*u;            %Variavéis de estado do sistema.
   y=C*x;                 %Cálculo da saída do sistema.
   x=x1;                  %Atualização das variáveis.

   yr=y+V(n);   %Saída do sistema com ruído.
   
   q1=(A-G*C)*q+G*yr+B*u; %Estimação das variáveis de estado.
   q=q1;                  %Atualização das variáveis.
   
   t(n+1)=n*T;            %Vetor do tempo de simulação.
   vx1(n+1)=x1(1);        %Vetor das variáveis de estado do sistema.
   vx2(n+1)=C*x1;         %Vetor das variáveis de estado do sistema.
   ve1(n+1)=q1(1);        %Vetor das variáveis de estado do sistema.
   ve2(n+1)=C*q1;         %Vetor das variáveis de estado do sistema.
  
end

%Gráficos.
stairs(t,vx2,'r'); grid; 
xlabel('t [s]'); ylabel('x2 (Vermelho) ; x2e (Azul)');
title('Informação Original e sua Estimação com Observador');
hold on;
stairs(t,ve2,'b');  
tit=input('Abrir outra figura e depois pressionar uma tecla para continuar:');
stairs(t,vx1,'r'); grid; 
xlabel('t [s]'); ylabel('x1 (Vermelho) ; x1e (Azul)');
title('Informação Original e sua Estimação com Observador');
hold on;
stairs(t,ve1,'b');  

