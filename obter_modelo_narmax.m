%Estimaçao de modelo NARMAX

n=1947; %Número de amostras
m=n+3;  %Indexador

%Dados para Identificaçao
load Z:\ECA412\Pratica6\dados_ident
in=ScopeData(1:m,2);    %Entrada
out=ScopeData(1:m,3);   %Saida

%Regressores
F(1:n,1)=out(3:n+2);    %y(k-1)
F(1:n,2)=out(2:n+1);    %y(k-2)  
F(1:n,3)=in(2:n+1);     %u(k-2)
F(1:n,4)=in(3:n+2);     %u(k-1)
for i=1:n
    F(i,5)=out(i+2)^2 * in(i+2);    %y(k-1)^2*u(k-1)
    F(i,6)=in(i+2)^2 * in(i);       %u(k-1)^2*u(k-3)
end
F(1:n,7)=out(1:n).^3;   %y(k-3)^3
for j=1:n
    F(j,8)=out(j+1)*in(j+1);    %y(k-2)*u(k-2)
    F(j,9)=out(j)^2*in(j);      %y(k-3)^2*u(k-3)
end
Y=out(4:n+3);   %y(k)

%Estimaçao de Parametros por MQ
P = inv(F'*F);
Q = F'*Y;
T = P*Q;      %Vetor de Parametros Estimados
Teta = T;
'Vetor de Parametros Estimados'
format short g
Teta

%Dados para Validaçao
load Z:\ECA412\Pratica6\dados_valid
iv=ScopeData(1:m,2);    %Entrada
ov=ScopeData(1:m,3);    %Saida

%Validaçao
S1(1)=0; S1(2)=0; S1(3)=0;
for k=4:m
   S1(k)=T(1)*S1(k-1) + T(2)*S1(k-2) + T(3)*iv(k-2) + T(4)*iv(k-1) + T(5)*(S1(k-1)^2)*iv(k-1) + T(6)*(iv(k-1)^2)*iv(k-3) + T(7)*S1(k-3)^3 + T(8)*S1(k-2)*iv(k-2) + T(9)*(S1(k-3)^2)*iv(k-3);
end
S1=S1';     %Dados de saida simulado
plot(1:m,S1,'b',1:m,ov,'k'); grid; xlabel('Numero de Amostras'); ylabel('y'); legend('Modelo NARMAX','Dados Medidos');
title('Dados Simulados e Medidos');

%Autocorrelaçao do sinal simulado com as medidas de saida
rr=xcorr(S1,ov); %AutoCorrelaçao dos dados simulados e medidas de saida
Crr=corrcoef(S1,ov);
crr=Crr(1,2)*100;       %Coeficiente de correlaçao entre os dados simulados e os medidos
'Coeficiente de Correlaçao do Modelo NARMAX'
crr
figure;
plot(-1949:1949,rr); grid; xlabel('Numero de Amostras'); ylabel('AutoCorrelaçao do sinal medido com modelo NARMAX');
title('Autocorrelaçao');
