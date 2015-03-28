% Simulação do filtro de Kalman do sistema
% G(s)=Gzoh.Gp(s), onde Gp(s)=100/(s^2+2s+100) e T=0,01.

clear all; %Limpar variáveis.

%Matrizes da representação em variáveis de estado discretizadas.
A=[0.9753 -0.9884;0.0099 0.995]; B=[0.0099;0]; C=[0 100];

G = [0.0622;0.004]; %Matriz de ganho do filtro de Kalman.

x=[0.05;0]; q=[0;0];  %Condições iniciais.
T=0.01; np=200;    %Tempo de varredura e número de amostras.

Rw = 1; %Informações de ruídos.
Rv = 0.01;

%Informações de dimensões.
dimB=size(B); nent=dimB(2); dimC=size(C); nsaid=dimC(1);

%Geração dos ruídos na entrada e saída do sistema.
W=sqrt(Rw)*rand(np,nent); V=sqrt(Rv)*rand(np,nsaid);

for n=1:np      %Ciclo de simulação.
   
   u=1+W(n);    %Entrada do sistema tipo degrau com ruído.
   
   x1=A*x+B*u;  %Variáveis de estado do sistema.
   y=C*x;       %Saída do sistema.
   x=x1;        %Atualização de variáveis.
   
   tt=n*T;      %Tempo de simulação.
   
   yr=y+V(n);   %Saída do sistema com ruído.
   
   q1=(A-G*C*A)*q+(B-G*C*B)*u+G*yr; %Equação do filtro de Kalman.
   q=q1;        %Atualização de variáveis.
   
   t(n+1)=tt;     %Vetor do tempo de simulação.
   vr(n+1)=yr;    %Vetor da saída do sistema.
   vf(n+1)=C*q1;  %Vetor de saída do filtro de Kalman.
   vx(n+1)=x1(1); %Vetor de X com ruído.
   ve(n+1)=q1(1); %Vetor de X estimado.
   
end

%Gráficos.
stairs(t,vr,'r');
hold on;
stairs(t,vf,'b');
grid; xlabel('t [s]'); ylabel('Y+ruído (Vermelho) ; Yestimado (Azul)');
title('Sistema com ruído e sua estimação com filtro de Kalman');
tit=input('Abrir outra figura e depois pressionar uma tecla:');
stairs(t,vx,'r');
hold on;
stairs(t,ve,'b');
grid; xlabel('t [s]'); ylabel('X+ruído (Vermelho) ; Xestimado (Azul)');
title('Sistema com ruído e sua estimação com filtro de Kalman');
