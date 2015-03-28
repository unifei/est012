clear all;
close all;

%EXERCÍCIO 1
r = 20e3;
c = 33e-9;
n = 1;
d = [r*c 1];

figure(1)
step(n, d);
grid on;

%Utiliza a variável do Scope do Simulink
% figure(2)
% plot(ScopeData(:,1), ScopeData(:,2));
% xlabel('t [s]');
% ylabel('y [V]');
% title('Resposta ao degrau');
% grid on;

figure(3)
bode(n, d);
grid on;

%EXERCÍCIO 2
r   = 10;
c   = 33e-9;
l   = 27e-6;
eta = (r/2)*sqrt(c/l);
wn  = l/sqrt(l*c);
nn  = wn^2;
d   = [1 2*eta*wn wn^2];

figure(4)
step(nn, d);
grid on;

[t, y] = ginput(1);
roots(d);

rr   = 2e3;
etaa = (rr/2)*sqrt(c/l);
dd   = [1 2*etaa*wn wn^2];

figure(5)
step(nn, dd);
grid on;

[tt, yy] = ginput(1);
roots(dd);