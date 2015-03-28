% Simula��o do filtro de Kalman do sistema
% G(s)=Gzoh.Gp(s), onde Gp(s)=100/(s^2+2s+100) e T=0,01.

clear all; %Limpar vari�veis.

%Matrizes da representa��o em vari�veis de estado discretizadas.
A=[0.9753 -0.9884;0.0099 0.995]; B=[0.0099;0]; C=[0 100];

G = [0.0622;0.004]; %Matriz de ganho do filtro de Kalman.

x=[0.05;0]; q=[0;0];  %Condi��es iniciais.
T=0.01; np=200;    %Tempo de varredura e n�mero de amostras.

Rw = 1; %Informa��es de ru�dos.
Rv = 0.01;

%Informa��es de dimens�es.
dimB=size(B); nent=dimB(2); dimC=size(C); nsaid=dimC(1);

%Gera��o dos ru�dos na entrada e sa�da do sistema.
W=sqrt(Rw)*rand(np,nent); V=sqrt(Rv)*rand(np,nsaid);

for n=1:np      %Ciclo de simula��o.
   
   u=1+W(n);    %Entrada do sistema tipo degrau com ru�do.
   
   x1=A*x+B*u;  %Vari�veis de estado do sistema.
   y=C*x;       %Sa�da do sistema.
   x=x1;        %Atualiza��o de vari�veis.
   
   tt=n*T;      %Tempo de simula��o.
   
   yr=y+V(n);   %Sa�da do sistema com ru�do.
   
   q1=(A-G*C*A)*q+(B-G*C*B)*u+G*yr; %Equa��o do filtro de Kalman.
   q=q1;        %Atualiza��o de vari�veis.
   
   t(n+1)=tt;     %Vetor do tempo de simula��o.
   vr(n+1)=yr;    %Vetor da sa�da do sistema.
   vf(n+1)=C*q1;  %Vetor de sa�da do filtro de Kalman.
   vx(n+1)=x1(1); %Vetor de X com ru�do.
   ve(n+1)=q1(1); %Vetor de X estimado.
   
end

%Gr�ficos.
stairs(t,vr,'r');
hold on;
stairs(t,vf,'b');
grid; xlabel('t [s]'); ylabel('Y+ru�do (Vermelho) ; Yestimado (Azul)');
title('Sistema com ru�do e sua estima��o com filtro de Kalman');
tit=input('Abrir outra figura e depois pressionar uma tecla:');
stairs(t,vx,'r');
hold on;
stairs(t,ve,'b');
grid; xlabel('t [s]'); ylabel('X+ru�do (Vermelho) ; Xestimado (Azul)');
title('Sistema com ru�do e sua estima��o com filtro de Kalman');
