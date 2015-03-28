%Eliminando possíveis lixos de memória
clear all;
close all;

%Determinando pré-condições para os gráficos
    t = 150 ;               %Período do sinal
    fs = 1/t ;              %Frequência da mensagem (Hz)  
    fc = 200 ;              %Frequência da portadora (Hz)
    Kf = 50 ;
    Ac = 10 ;               %Amplitude da portadora (V)
    temp = 0;
    temp2 = 0;
    time = 1:300;
    I(1) = 0;
    I2(1) = 0;
    
for i = 1:50
    m(i) = 1;
    m(i+50) = -2;
    m(i+100) = 0;
end

for k = 1:149
    temp = temp + Kf*m(k);
    I(k+1) = I(k) + m(k) * cos (2*pi*fc + 2*pi*temp);
    temp = 0;
end

for j = 1:150
    m(j+150) = m(j);
    I(j+150) = I(j);
    s(j) = Ac*cos (I(j));
    s(j+150) = Ac*cos (I(j));
end

figure(1)
plot(time, m);

figure(2)
plot(fftshift(abs(fft(m))));

figure(3)
plot(time, I);

figure(4)
plot(fftshift(abs(fft(I))));

figure(5)
plot(time, s);

figure(6)
plot(fftshift(abs(fft(s))));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Exercicio 2: variar a Sensibilidade
b1 = 0.5;
b2 = 1;
b3 = 2;
b4 = 5;

for i = 1:50
    m2(i) = sin(8*pi*fs*i);
    m2(i+50) = -2*sin(8*pi*fs*i);
    m2(i+100) = 0;
end

for k = 1:149
    if k <= 50
        temp2 = temp2 + b1*fs*m2(k);
    end
    if k >= 51 & k <= 100
        temp2 = temp2 - b1*fs/2*m2(k);
    end
    if k >= 101 & k <= 150
        temp2 = 0;
    end
    I2(k+1) = I2(k) + m2(k)*cos (2*pi*fc + 2*pi*temp2);
    temp2 = 0;
end

for j = 1:150
    m2(j+150) = m2(j);
    s2(j) = Ac*cos (I2(j));
    s2(j+150) = s2(j);
end

figure(7)
plot(time, m2);

figure(8)
plot(time, s2);

figure(9)
stem(fftshift(abs(fft(m))));

figure(10)
stem(fftshift(abs(fft(s))));