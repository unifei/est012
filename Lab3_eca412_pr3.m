%Simulação de um Sistema de Controle Deadbeat

%Planta:
%G(s)=   1
%      -----
%      s + 1

%Função discreta da planta para T=0.1:
%G(z)=  0.0952
%     ----------
%      z-0.9048

%Parâmetros do controlador
%D(z)= Mo + (M1-Mo)z^-1
%     ------------------
%         1 - C1z^-1

clear all; %Zerar variáveis.

%Parâmetros do Sistema.
b1 = 0.0952;
a1 = -0.9048;
T=0.1;

%Cálculo dos parâmetros do controlador.
Mo=1/b1;
M1=Mo*a1+Mo;
C1=Mo*b1;

%Sinal de referência.
Na=100;
uc = 0.4*ones(1,Na );

%Valores iniciais.
e(1)=uc(1);
u(1)=Mo*e(1);
y(1)=0;
tt(1)=0;

%Laço de simulação da malha de controle.
for k=2:Na
   
   y(k) = b1*u(k-1)-a1*y(k-1); %Modelo da planta.
   
   e(k) = uc(k)-y(k); %Erro da malha de controle.
   
   if k > Na/3   %Variação da referência de entrada.
      e(k) = (uc(k) + 0.4) - y(k);
   end
   
   if k > 2*Na/3 %Variação da referência de entrada.
      e(k) = (uc(k) - 0.4) - y(k);
   end
   
   u(k) = Mo*e(k)+(M1-Mo)*e(k-1)+C1*u(k-1); %Equação do controlador.
   
   tt(k) = tt(k-1) + T; %Tempo de simulação.
   
end

%Gráficos resultantes da simulação.
subplot(211);
plot(tt,u,'b.'); grid;
xlabel('t [s]'); ylabel('u');
subplot(212);
plot(tt,y,'r.'); grid;
xlabel('t [s]'); ylabel('y');
