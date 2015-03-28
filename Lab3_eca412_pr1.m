% Simulação de um controle DeadBeat

%G(s)=      100
%      --------------
%      s^2 + 4s + 100

%Função amostrada no tempo para T=0.1 [s]
%G(z)=  0.405z+0.3529
%     -------------------
%      z^2-0.9124+0.6703

%Parametros do controlador
%D(z)= Mo + (M1-Mo)z^-1 + (M2-M1)z^-2
%     --------------------------------
%      1 - C1z^-1 -(1-C1)z^-2

clear all;

%Parametros do Sistema
b1 = 0.405;
b2 = 0.3529;
a1 = -0.9124;
a2 = 0.6702;
T=0.1;
Na=100;

%Cálculo dos parametros do controlador
Mo=1/(b1+b2);
M1=Mo*a1+Mo;
M2=Mo*a2+M1;
C1=Mo*b1;

%Sinal de referencia
uc = ones(1,Na );

%Valores iniciais
e(1)=uc(1);
u(1)=Mo*e(1);
y(1)=0;
tt(1)=0;

y(2) = b1*u(1)-a1*y(1);
e(2) = uc(2)-y(2);
u(2) = Mo*e(2) +(M1-Mo)*e(1) +C1*u(1);
tt(2)=T;

%Simulação do Controle
for k=3:Na
   y(k) = b1*u(k-1)+b2*u(k-2)-a1*y(k-1)-a2*y(k-2); %Planta
   e(k) = uc(k)-y(k); %Erro da malha
    if k > Na/2 %Modificaçao da referência
      e(k) = (uc(k) + 1) - y(k); %Erro
   end   
   %Equação do Controlador
   u(k) = Mo*e(k) +(M1-Mo)*e(k-1) +(M2-M1)*e(k-2) +C1*u(k-1) +(1-C1)*u(k-2);
   
   tt(k) = tt(k-1) + T;
end

%Gráficos
subplot(211);
plot(tt,u,'b.'); xlabel('t [s]'); ylabel('u'); grid;
subplot(212);
plot(tt,y,'r.'); xlabel('t [s]'); ylabel('y');grid;

