% Simulação do modelo do filtro digital IIR passa-baixas.

clear all;

%Valores de parâmetros e variáveis:
a1 = -0.8743; b1 = 0.1257; T=0.02; N=100; 
Yn=0; Yn_1=0; Xn_1=0; t=0;

for n = 1:N, %Laço de repetição:
   
   Xn = 1.5 + 0.5*sin(2*pi*10*t); %Simulação da entrada do filtro.
   Yn = b1*Xn_1 - a1*Yn_1; %Equação de diferenças do filtro digital.
   Yn_1 = Yn; Xn_1 = Xn;   %Atualização das variáveis.

   vx(n) = Xn;  %Armazena valor da variável X em um vetor.  
   vy(n) = Yn;  %Armazena valor da variável Y em um vetor. 
   vt(n) = t;   %Armazena valor da variável  t em um vetor.
   t = t + T;   %Incremento o valor de t.
end

%Gráfico da Simulação.
plot(vt,vx,'b'); hold %Traçar gráficos da simulação.
plot(vt,vy,'r'); grid
xlabel('t [s]'); ylabel('x(t) ; y(t)');
title('Simulação do Filtro Digital IIR')
