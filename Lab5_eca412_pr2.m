% Programa de simulação do observador de esatdo do sistema de posicionamento em variáveis amostradas.

clear all;

% Inicialização das variáveis.
X1=-4; X2=-5; X1e=0; X2e=0; t=0; T=0.1; Np = 40; 

for n=1:Np, % Laço dos processamentos da simulação.
   
   un = 0.5*sin(2*pi*0.5*t); % Simulação da entrada do sistema.
   t = t + T;
   
   % Vetores de armazenamento das variáveis.
    vt(n) = (n-1)*T;
    vu(n) = un;
    vX1(n) = X1;
    vX2(n) = X2;
   vX1e(n) = X1e;
   vX2e(n) = X2e;
   
   % Equações de estado do sistema.
   X1p = X1 + 0.0199*X2 +  2.1957*un;
   X2p =      0.0067*X2 + 27.2154*un;
   
   % Equações de estado o observador.
   X1ep = 0.0067*X1e + 0.0199*X2e +  2.1957*un + 0.9933*X1;
   X2ep =              0.0067*X2e + 27.2154*un;
   
   % Atualizações de variáveis.
   X1 = X1p;
   X2 = X2p;
   X1e = X1ep;
   X2e = X2ep;
   
end

% Gráficos das variáveis armazenadas.
plot(vt,vu,'b',vt,vX1,'r'); grid;
xlabel('t [s]'); ylabel('u(t) = Azul  X1 = Vermelho');
title('Gráfico da Entrada u(t) e Saída do Sistema y(t) = X1');
tit = input('Abrir outra figura e <Enter>');
plot(vt,vX1,'b',vt,vX1e,'r'); grid;
xlabel('t [s]'); ylabel('X1 = Azul  X1e = Vermelho');
title('Gráfico da Variável X1 e da sua Estimação (X1e)');
tit = input('Abrir outra figura e <Enter>');
plot(vt,vX2,'b',vt,vX2e,'r'); grid;
xlabel('t [s]'); ylabel('X2 = Azul  X2e = Vermelho');
title('Gráfico da Variável X2 e da sua Estimação (X2e)');

   