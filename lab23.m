%Eliminando poss�veis lixos de mem�ria
close all;
clear all;

%Determinando pr�-condi��es para os gr�ficos
A = 5;          % Amplitude da onda 5[V]
p = 1;          % Contadores para gerar posi��es dos vetores
q = 1;          % (que representar�o coeficientes das s�ries de Fourier)
r = 1;

T  = 2;          % Primeiro caso para um per�odo de 2   (unidades de tempo)
TT = 200;        % Primeiro caso para um per�odo de 200 (unidades de tempo)

N1 = 1;         % Reconstru��o da onda para um harm�nico
N2 = 5;         % Reconstru��o da onda para 5 harm�nicos
N3 = 10;        % Reconstru��o da onda para 10 harm�nicos
N4 = 100;       % Reconstru��o da onda para 100 harm�nicos

x1 = -N1:N1;    % Representa��o das s�ries at� o 1� harm�nico
x2 = -N2:N2;    % Representa��o das s�ries at� o 5� harm�nico
x3 = -N3:N3;    % Representa��o das s�ries at� o 10� harm�nico
x4 = -N4:N4;    % Representa��o das s�ries at� o 100� harm�nico

ondaA = linspace(0, 0, 5002);      % Reconstru��o da meia onda senoidal para um per�odo T
ondaAA = linspace(0, 0, 2001);      % Reconstru��o da meia onda senoidal para um per�odo TT
ondaB = linspace(0, 0, 2001);      % Reconstru��o da onda quadrada para um per�odo T
ondaBB = linspace(0, 0, 2001);      % Reconstru��o da onda quadrada para um per�odo TT

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for n = -N4:N4    % 'n' determina o n�mero de elementos na s�rie de Fourier
    if (abs(n) == 1)
        cn(p) = 0;          % Meia onda senoidal
        p = p + 1;
    else
        cn(p) = (A/(2*pi))*((1+exp(-j*n*pi))/(1-n^2));  % Equa��o j� determinada
        p = p + 1;
    end
    
    for t = 1:0.001:3*T
         ondaA (r) = ondaA (r) + cn(p-1)*exp(j*n*2*pi*t/T);
         r = r + 1;
    end

    r = 1;
end


% Plotando os gr�ficos
figure(1)
plot(abs(ondaA));