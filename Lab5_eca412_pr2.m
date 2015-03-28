% Programa de simula��o do observador de esatdo do sistema de posicionamento em vari�veis amostradas.

clear all;

% Inicializa��o das vari�veis.
X1=-4; X2=-5; X1e=0; X2e=0; t=0; T=0.1; Np = 40; 

for n=1:Np, % La�o dos processamentos da simula��o.
   
   un = 0.5*sin(2*pi*0.5*t); % Simula��o da entrada do sistema.
   t = t + T;
   
   % Vetores de armazenamento das vari�veis.
    vt(n) = (n-1)*T;
    vu(n) = un;
    vX1(n) = X1;
    vX2(n) = X2;
   vX1e(n) = X1e;
   vX2e(n) = X2e;
   
   % Equa��es de estado do sistema.
   X1p = X1 + 0.0199*X2 +  2.1957*un;
   X2p =      0.0067*X2 + 27.2154*un;
   
   % Equa��es de estado o observador.
   X1ep = 0.0067*X1e + 0.0199*X2e +  2.1957*un + 0.9933*X1;
   X2ep =              0.0067*X2e + 27.2154*un;
   
   % Atualiza��es de vari�veis.
   X1 = X1p;
   X2 = X2p;
   X1e = X1ep;
   X2e = X2ep;
   
end

% Gr�ficos das vari�veis armazenadas.
plot(vt,vu,'b',vt,vX1,'r'); grid;
xlabel('t [s]'); ylabel('u(t) = Azul  X1 = Vermelho');
title('Gr�fico da Entrada u(t) e Sa�da do Sistema y(t) = X1');
tit = input('Abrir outra figura e <Enter>');
plot(vt,vX1,'b',vt,vX1e,'r'); grid;
xlabel('t [s]'); ylabel('X1 = Azul  X1e = Vermelho');
title('Gr�fico da Vari�vel X1 e da sua Estima��o (X1e)');
tit = input('Abrir outra figura e <Enter>');
plot(vt,vX2,'b',vt,vX2e,'r'); grid;
xlabel('t [s]'); ylabel('X2 = Azul  X2e = Vermelho');
title('Gr�fico da Vari�vel X2 e da sua Estima��o (X2e)');

   