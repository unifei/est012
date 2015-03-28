clear all;
close all;

t = 0.001:0.001:0.28;           % Vetor de tempo
fc = 40;                          % Frequência da portadora
mat = dec2bin(15800);   % Número de matrícula decodificado em binário
sig = linspace (0, 0, 56);
ASK = linspace (0, 0, 280);
PSK = linspace (0, 0, 280);
OOK = linspace (0, 0, 280);
FSK = linspace (0, 0, 280);

for i = 1:14
    sig(4*(i-1)+1) = str2double(mat(i));
    sig(4*(i-1)+2) = str2double(mat(i));
    sig(4*(i-1)+3) = str2double(mat(i));
    sig(4*i) = str2double(mat(i));
end

signal = cat (2, sig, sig, sig, sig, sig);

carrier1 = 1.5 * cos (2*pi*fc*t);
carrier2 = 1.5 * cos (2*pi*fc*t - pi);
carrier3 = 1.5 * cos (2*pi*(fc/2)*t);

for i = 1:length(t)
    if (signal(i) == 1)
        ASK(i) = carrier1(i);
        PSK(i) = carrier1(i);
        OOK(i) = carrier1(i);
        FSK(i) = carrier1(i);
    else
        ASK(i) = carrier1(i) / 2;
        PSK(i) = carrier2(i);
        OOK(i) = 0;
        FSK(i) = carrier3(i);
    end
end

figure(1)
stairs(signal);
axis([0 100 -2 2]);

figure(2)
plot(carrier1);
axis([0 100 -2 2]);

figure(3)
stem(ASK);
axis([0 100 -2 2]);
grid on;
set(gca, 'XTick', 1:4:100);

figure(4)
stem(OOK);
axis([0 100 -2 2]);
grid on;
set(gca, 'XTick', 1:4:100);

figure(5)
stem(PSK);
axis([0 100 -2 2]);
grid on;
set(gca, 'XTick', 1:4:100);

figure(6)
stem(FSK);
axis([0 100 -2 2]);
grid on;
set(gca, 'XTick', 1:4:100);

figure(7)
plot(fftshift(abs(fft(carrier1))));

figure(8)
plot(fftshift(abs(fft(ASK))));

figure(9)
plot(fftshift(abs(fft(OOK))));

figure(10)
plot(fftshift(abs(fft(PSK))));

figure(11)
plot(fftshift(abs(fft(FSK))));