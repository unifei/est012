function [ m , ss ] = moduladorPsk( x , A , bitRange )
%MODULADORPSK Summary of this function goes here

br=1/bitRange;                                                         
f=br*2;                                                
t2=bitRange/99:bitRange/99:bitRange;                 
ss=length(t2);
m=[];
for (i=1:1:length(x))
    if (x(i)==1)
        y=A*cos(2*pi*f*t2);
    else
        y=A*cos(2*pi*f*t2+pi);   %A*cos(2*pi*f*t+pi) = -A*cos(2*pi*f*t)
    end
    m=[m y];
end
t3=bitRange/99:bitRange/99:bitRange*length(x);
subplot(4,2,2);
plot(t3,m);
xlabel('tempo(s)');
ylabel('Amplitude(V)');
title('Onda PSK com a informação');

end