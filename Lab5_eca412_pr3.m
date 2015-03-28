% Simula��o do observador de estado discreto do sistema com ru�do
% onde G(s)=Gzoh.Gp(s), Gp(s)=100/(s^2+2s+100) e T=0,01.

clear all; %Limpar vari�veis.

%Matrizes das vari�veis de estado em representa��o discretizada.
A=[0.9753 -0.9884;0.0099 0.995]; B=[0.0099;0]; C=[0 100];

G=[0.3748;0.0077]; %Matriz de ganho do observador de estado.

T=0.01; np = 200; %Tempo de varredura e n�mero de amostras.

Rw = 1; Rv = 0.01; %Informa��es sobre ru�dos.

% Informa��es de dimens�es.
dimB=size(B); nent=dimB(2); dimC=size(C); nsaid=dimC(1);

% Valores para simula��o das amplitudes de entrada de ru�dos.
Aw = input('Aw = ');
Av = input('Av = ');

% Gera��o dos ru�dos na entrada e sa�da do sistema.
W = Aw*sqrt(Rw)*rand(np,nent); V = Av*sqrt(Rv)*rand(np,nsaid);

x=[0.05;0]; q=[0;0]; %Condi��es iniciais.

for n=1:np               %Ciclo de simula��o.

   u=1+W(n);    %Entrada do sistema tipo degrau com ru�do.

   x1=A*x+B*u;            %Variav�is de estado do sistema.
   y=C*x;                 %C�lculo da sa�da do sistema.
   x=x1;                  %Atualiza��o das vari�veis.

   yr=y+V(n);   %Sa�da do sistema com ru�do.
   
   q1=(A-G*C)*q+G*yr+B*u; %Estima��o das vari�veis de estado.
   q=q1;                  %Atualiza��o das vari�veis.
   
   t(n+1)=n*T;            %Vetor do tempo de simula��o.
   vx1(n+1)=x1(1);        %Vetor das vari�veis de estado do sistema.
   vx2(n+1)=C*x1;         %Vetor das vari�veis de estado do sistema.
   ve1(n+1)=q1(1);        %Vetor das vari�veis de estado do sistema.
   ve2(n+1)=C*q1;         %Vetor das vari�veis de estado do sistema.
  
end

%Gr�ficos.
stairs(t,vx2,'r'); grid; 
xlabel('t [s]'); ylabel('x2 (Vermelho) ; x2e (Azul)');
title('Informa��o Original e sua Estima��o com Observador');
hold on;
stairs(t,ve2,'b');  
tit=input('Abrir outra figura e depois pressionar uma tecla para continuar:');
stairs(t,vx1,'r'); grid; 
xlabel('t [s]'); ylabel('x1 (Vermelho) ; x1e (Azul)');
title('Informa��o Original e sua Estima��o com Observador');
hold on;
stairs(t,ve1,'b');  

