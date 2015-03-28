%Eliminando poss�veis lixos de mem�ria
close all;
clear all;

%Determinando pr�-condi��es para os gr�ficos
A = 5;          % Amplitude da onda 5[V]
p = 1;          % Contadores para gerar posi��es dos vetores
q = 1;          % (que representar�o coeficientes das s�ries de Fourier)
r = 1;

T  = 2;         % Per�odo igual a 2 (unidades de tempo)

N1 = 1;         % Reconstru��o da onda para um harm�nico
N2 = 5;         % Reconstru��o da onda para 5 harm�nicos
N3 = 10;        % Reconstru��o da onda para 10 harm�nicos
N4 = 100;       % Reconstru��o da onda para 100 harm�nicos

x1 = -N1:N1;    % Representa��o das s�ries at� o 1� harm�nico
x2 = -N2:N2;    % Representa��o das s�ries at� o 5� harm�nico
x3 = -N3:N3;    % Representa��o das s�ries at� o 10� harm�nico
x4 = -N4:N4;    % Representa��o das s�ries at� o 100� harm�nico

ondaA = linspace(0, 0, 5002);      % Reconstru��o da meia onda senoidal para um per�odo T
ondaB = linspace(0, 0, 5002);      % Reconstru��o da onda quadrada para um per�odo T

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for n = -N4:N4    % 'n' determina o n�mero de elementos na s�rie de Fourier
    if (abs(n) == 0)
        cn(p) = 0;
    else
        cn(p) = (A/(j*n*pi))*(1-exp(-j*n*pi));
    end
    
    for t = 1:0.001:3*T
         ondaA (r) = ondaA (r) + cn(p)*exp(j*n*(2*pi/T)*t);
         r = r + 1;
    end
    p = p + 1;
    r = 1;
end


% Plotando os gr�ficos
figure(1)
plot(abs(ondaA));