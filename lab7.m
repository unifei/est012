%%%%%%%%%%%%%%%%%%%%%
%%%% EXERCÍCIO 1 %%%%
%%%%%%%%%%%%%%%%%%%%%
Ns = 1;
Ds = [1 1];
T = 0.1;
[Nz, Dz] = c2dm (Ns, Ds, T, 'zoh');

Nz
Dz
rlocus (Ns, Ds)

Kp = 0 : 0.1 : 25;
raizes = rlocus (Nz, Dz, Kp);
ang = linspace (0, 2*pi, 100);
expAng = exp(j * ang);
re = real (expAng);
im = imag (expAng);
plot (real (raizes), imag (raizes), 'k', re, im, 'k:');
xlabel ('Real');
ylabel ('Imaginário');
title ('Lugar das Raízes de 1 + Kp*G(z) = 0');

[k, polos] = rlocfind (Nz, Dz);
k



Ns = 1;
Ds = [1 1];
T = 0.2;
[Nz, Dz] = c2dm (Ns, Ds, T, 'zoh');

Nz
Dz

Kp = 0 : 0.1 : 25;
raizes = rlocus (Nz, Dz, Kp);
ang = linspace (0, 2*pi, 100);
expAng = exp(j * ang);
re = real (expAng);
im = imag (expAng);
plot (real (raizes), imag (raizes), 'k', re, im, 'k:');
xlabel ('Real');
ylabel ('Imaginário');
title ('Lugar das Raízes de 1 + Kp*G(z) = 0');

[k, polos] = rlocfind (Nz, Dz);
k



W = 0.1 : 0.1 : 10;
[Nw, Dw] = d2cm (Nz, Dz, T, 'tustin');
Nw
Dw
bode (Ns, Ds, W);
hold
bode (Nw, Dw, W);

%%%%%%%%%%%%%%%%%%%%%
%%%% EXERCÍCIO 2 %%%%
%%%%%%%%%%%%%%%%%%%%%
Ns = 1370;
Ds = [1 50 0];
T = 0.02;
[Nz, Dz] = c2dm (Ns, Ds, T, 'zoh');
Nz
Dz

roots (Dz)


%%%%%%%%%%%%%%%%%
%%%% PARTE 2 %%%%
%%%%%%%%%%%%%%%%%
Kp = 4;
Ki = 10;
Ns = [Kp Ki];
Ds = [1 0];
T = 0.1;
[NCz, DCz] = c2dm (Ns, Ds, T, 'tustin');
NCz
DCz

freqz (Nz, Dz);



% Resposta de processo de 1a ordem usando equações no domínio Z.
% Gp(s)=1/(s + 1), Gzoh(s)=(1-exp(-sT))/s, G(s)=Gzoh(s).Gp(s),
% Y(s)/U(s)=G(s).

clear all;  %Zerar variáveis.
cor =  'k'; %Cor preta nos gráficos.
tmax = 10;  %Tempo máximo de simulação.

Ns = 1; Ds = [1 1]; %Função do processo no domínio S.

T = input('T = '); %Tempo de amostragem.
na = tmax / T;     %Número de amostras.
n = 0:(na-1);      %Variável amostra.
t = n*T;           %Valores de tempo de simulação.

[Nz,Dz] = c2dm(Ns,Ds,T,'zoh'); %Obtenção de G(z).

Y = dstep(Nz,Dz,na); %Simulação discreta do processo.

stairs(t,Y,cor); %Gráfico da saída do processo.
xlabel('t [s]'); ylabel('Y(nT)'); grid;
title('Resposta do processo para entrada degrau');

Nz
Dz



%%%%%%%%%%%%%%%%%
%%%% PARTE 3 %%%%
%%%%%%%%%%%%%%%%%
load _________\ensaio.xls % por exemplo: \home\chnet\ensaio.xls
t = ensaio (:, 1);
y = ensaio (:, 2);
u = ensaio (:, 4);
subplot(211);
stairs(t,u,'b');
grid;
xlabel('t [s]');
ylabel('u(t)');

subplot(212);
stairs(t,y,'r');
grid;
xlabel('t [s]');
ylabel('y(t)');

