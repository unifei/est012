% tabelaASCII = importdata('tabelaASCII.txt');
% tabelaASCIIStr = num2str (tabelaASCII);
% 
% %Normaliza codificacao em 8 bits
% for i=1:96,
%     for j=1:7,
%         bitsTabela(i,j) = str2double(tabelaASCIIStr(i,j));
%     end
%     bitsTabela(i,8) = 0;
% end
% for i=1:32,
%     bitsTabela(i,1) = 0;
% end
% for i=1:96,
%     for j=8:-1:2,
%         bitsTabela(i,j) = bitsTabela(i,j-1);
%     end
%     bitsTabela(i,1) = 0;
% end
% 
% %Cria sinal TTL para 96 caracteres
% y = 1:(8*10*96);
% for i=1:96,
%     for j=1:8,
%         for k=1:10,
%             y((((j-1)*10)+k) + (i-1)*8*10) = bitsTabela(i,j);
%         end
%     end
% end
% 
fc = 1;
% t = 1:1:7680;
% portadora = geraPortadora(1, fc, t);
% figure(1);
% plot(portadora);
% title('Portadora');

clear;
clc;
b = input('Enter the bit stream = ');
n = length(b);
t = 0:0.01:n;
x = 1:1:(n+2)*100;
for i = 1:n
if (b(i) == 0)
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
bw_o = bw_o(100:(n+1)*100);
bw_e = bw_e(200:(n+2)*100);
cost = cos(2*pi*t);
sint = sin(2*pi*t);
x = bw_o.*cost;
y = bw_e.*sint;
z = x+y;
subplot(3,2,1);
plot(t,bw);
xlabel('n ---->');
ylabel('Amplitude ---->');
title('Input Bit Stream');
grid on ;
axis([0 n -2 +2]);
subplot(3,2,5);
plot(t,bw_o);
xlabel('n ---->');
ylabel('Amplitude ---->');
title('Odd Sequence');
grid on ;
axis([0 n -2 +2]);
subplot(3,2,3);
plot(t,bw_e);
xlabel('n ---->');
ylabel('Amplitude ---->');
title('Even Sequence');
grid on ;
axis([0 n -2 +2]);
subplot(3,2,4);
plot(t,x);
xlabel('Time ---->');
ylabel('Amplitude ---->');
title('Odd Sequence BPSK Modulated Wave');
grid on ;
axis([0 n -2 +2]);
subplot(3,2,2);
plot(t,y);
xlabel('Time ---->');
ylabel('Amplitude ---->');
title('Even Sequence BPSK Modulated Wave');
grid on ;
axis([0 n -2 +2]);
subplot(3,2,6);
plot(t,z);
xlabel('Time ---->');
ylabel('Amplitude ---->');
title('QPSK Modulated Wave');
grid on ;
axis([0 n -2 +2]);

%psk([1 1 1 1 0 0 1 0 1 0 1 0 1],fc) 