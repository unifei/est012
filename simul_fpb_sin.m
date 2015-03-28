% Teste de Y(k)=0,9251.Y(k-1)+0,0375.U(k)+0,0375.U(k-1).

clear all;  %Zerar variáveis.

T = 0.01;    %Tempo de amostragem.
na = 200;    %Número de amostras.

Yk_1 = 0; Yk = 0; Uk_1 = 0; %Condições iniciais.

for n=0:na      %Loop de simulação.
   Uk = 0.85 + 0.25 * sin(2*pi*25*n*T);
   U(n+1) = Uk;
   t(n+1) = n*T;
   nn(n+1)=n;
   Yk = 0.9251 * Yk_1 + 0.0375 * Uk + 0.0375 * Uk_1; %Eq. dif.
   Yk_1 = Yk; Uk_1 = Uk; %Atualização das variáveis.
   Y(n+1) = Yk; %Armazenar valores.
end

plot(t,U); %Gráficos.
grid; xlabel('t [s]'); ylabel('Sinal CC com ruído em 25 [Hz]');
tit=input('Abrir outra figura e pressionar <Enter>');
stairs(t,Y);
grid; xlabel('t [s]'); ylabel('Sinal Filtrado');
