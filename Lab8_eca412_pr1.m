% Simula��o do modelo do filtro digital IIR passa-baixas.

clear all;

%Valores de par�metros e vari�veis:
a1 = -0.8743; b1 = 0.1257; T=0.02; N=100; 
Yn=0; Yn_1=0; Xn_1=0; t=0;

for n = 1:N, %La�o de repeti��o:
   
   Xn = 1.5 + 0.5*sin(2*pi*10*t); %Simula��o da entrada do filtro.
   Yn = b1*Xn_1 - a1*Yn_1; %Equa��o de diferen�as do filtro digital.
   Yn_1 = Yn; Xn_1 = Xn;   %Atualiza��o das vari�veis.

   vx(n) = Xn;  %Armazena valor da vari�vel X em um vetor.  
   vy(n) = Yn;  %Armazena valor da vari�vel Y em um vetor. 
   vt(n) = t;   %Armazena valor da vari�vel  t em um vetor.
   t = t + T;   %Incremento o valor de t.
end

%Gr�fico da Simula��o.
plot(vt,vx,'b'); hold %Tra�ar gr�ficos da simula��o.
plot(vt,vy,'r'); grid
xlabel('t [s]'); ylabel('x(t) ; y(t)');
title('Simula��o do Filtro Digital IIR')
