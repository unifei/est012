function [ saida ] = qpsk( sinal, n , t )
%QPSK Summary of this function goes here
%   Detailed explanation goes here

x = 1:1:(n+2)*100;

for i = 1:n
    if (sinal(i) == 0)
        u(i) = -1;
    else
        u(i) = 1;
    end

    for j = i:0.1:i+1
        bw(x(i*100:(i+1)*100)) = u(i);
        if (mod(i,2) == 0)
            bw_e(x(i*100:(i+1)*100)) = u(i);
            bw_e(x((i+1)*100:(i+2)*100)) = u(i);
        else
            bw_o(x(i*100:(i+1)*100)) = u(i);
            bw_o(x((i+1)*100:(i+2)*100)) = u(i);
        end
        if (mod(n,2)~= 0)
            bw_e(x(n*100:(n+1)*100)) = -1;
            bw_e(x((n+1)*100:(n+2)*100)) = -1;
        end
    end
end

bw = bw(100:end);

subplot(3,2,1);
plot(t,bw);

ylabel('Amplitude');
title('Sinal de entrada');

grid on ;

bw_o = bw_o(100:(n+1)*100);
bw_e = bw_e(200:(n+2)*100);
cost = cos(2*pi*t);
sint = sin(2*pi*t);

saida = bw_o.*cost + bw_e.*sint ;

subplot(3,2,2);
plot(t,saida);
xlabel('Time');
ylabel('Amplitude');
title('QPSK');
grid on ;
axis([0 n -2 +2]);






end

