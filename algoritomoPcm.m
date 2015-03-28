%Trabalho 2
%Modular uma sequencia de dados digitalizada do primeiro relatório e fazer 
%uma modulação em banda base utilizando os codigos retorna para zero ( RZ),
%não retorna para zero (NRZ) e Manchester. Implementar o transmissor e receptor.

clear all;
close all;
clc;

t = 2; %1s de gravacao, 

%dados utilizados no primeiro relatório
[trash, fs] = wavread('teste.wav');
nAmostras = fs*t;
fid = fopen('teste.wav','r');
y = fread(fid,'int16');
sound(y,(fs/1));


%Codigo Manchester

for i=1:96,
    for j=1:7,
        bitsTabela(i,j) = y;
    end
    bitsTabela(i,8) = 0;
end
for i=1:32,
    bitsTabela(i,1) = 0;
end
for i=1:96,
    for j=8:-1:2,
        bitsTabela(i,j) = bitsTabela(i,j-1);
    end
    bitsTabela(i,1) = 0;
end

%Cria sinal TTL para 96 caracteres
y = 1:(8*10*96);
for i=1:96,
    for j=1:8,
        for k=1:10,
            y((((j-1)*10)+k) + (i-1)*8*10) = bitsTabela(i,j);
        end
    end
end

%Codifica sinal TTL em Manchester
t = 0:(1/7680):(1+(1/768));
manchesterCode = zeros(1, length(t));
bit1 = ones(1,5);
for i=1:(96*8)
	if y(i) == 1
		manchesterCode(1, i*10-9:i*10-5) = bit1;
		manchesterCode(1,i*10-4:i*10) = -1*bit1;
	else
		manchesterCode(1, i*10-9:i*10-5) = -1*bit1;
		manchesterCode(1, i*10-4:i*10) = bit1;
	end
end

%Imagem do sinal TTL Codificado em Manchester
figure(1);
plot(manchesterCode);
title('Sinal TTL Codificado em Manchester - Tabela ASCII');

%Imagem da FFT do sinal TTL Codificado em Manchester
figure(2);
plot(abs(fft(manchesterCode)));
title('FFT Sinal TTL - Tabela ASCII');



% %codificacao
% for i=1:nAmostras,
%     disp(i)
%     x = y(i);
%     if x<0
%        s = 1;
%        x = -x;
%     else
%        s = bitget(x, 16);
%     end
%     if bitget(x, 15) == 1
%         saida = strcat( num2str(s), '111', num2str(bitget(x,14)), num2str(bitget(x,13)), num2str(bitget(x,12)), num2str(bitget(x,11)) );
%     elseif bitget(x, 14) == 1
%         saida = strcat( num2str(s), '110', num2str(bitget(x,13)), num2str(bitget(x,12)), num2str(bitget(x,11)), num2str(bitget(x,10)) );
%     elseif bitget(x, 13) == 1
%         saida = strcat( num2str(s), '101', num2str(bitget(x,12)), num2str(bitget(x,11)), num2str(bitget(x,10)), num2str(bitget(x,9)) );
%     elseif bitget(x, 12) == 1
%         saida = strcat( num2str(s), '100', num2str(bitget(x,11)), num2str(bitget(x,10)), num2str(bitget(x,9)), num2str(bitget(x,8)) );
%     elseif bitget(x, 11) == 1
%         saida = strcat( num2str(s), '011', num2str(bitget(x,10)), num2str(bitget(x,9)), num2str(bitget(x,8)), num2str(bitget(x,7)) );
%     elseif bitget(x, 10) == 1
%         saida = strcat( num2str(s), '010', num2str(bitget(x,9)), num2str(bitget(x,8)), num2str(bitget(x,7)), num2str(bitget(x,6)) );
%     elseif bitget(x, 9) == 1
%         saida = strcat( num2str(s), '001', num2str(bitget(x,8)), num2str(bitget(x,7)), num2str(bitget(x,6)), num2str(bitget(x,5)) );
%     elseif bitget(x, 9) == 0
%         saida = strcat( num2str(s), '000', num2str(bitget(x,8)), num2str(bitget(x,7)), num2str(bitget(x,6)), num2str(bitget(x,5)) );    
%     end
%     pcm(i) = str2Integer(saida, 8);
% end
% wavwrite(pcm, fs, 8, 'pcm.wav');
% 
% 
% %Decodificao
% y2 = zeros(nAmostras, 1);
% for i=1:nAmostras,
%     if pcm(i)<0
%         s2 = 1;
%         str = uint8(-pcm(i));
%     else
%         s2 = 0;
%         str = uint8(pcm(i));
%     end
%     


%     b7 = bitget(str,7); b6 = bitget(str,6);
%     b5 = bitget(str,5); b4 = bitget(str,4);
%     b3 = bitget(str,3); b2 = bitget(str,2);
%     b1 = bitget(str,1);
%     if b7 == 1
%         if b6 == 1
%             if b5 == 1 %111
%                 saida = strcat(num2str(s2), '1', num2str(b4), num2str(b3), num2str(b2), num2str(b1), '1000000000' );
%             else %110
%                 saida = strcat(num2str(s2), '01', num2str(b4), num2str(b3), num2str(b2), num2str(b1), '100000000' );
%             end
%         else
%             if b5 == 1 %101
%                 saida = strcat(num2str(s2), '001', num2str(b4), num2str(b3), num2str(b2), num2str(b1), '100000000' );
%             else %100
%                 saida = strcat(num2str(s2), '0001', num2str(b4), num2str(b3), num2str(b2), num2str(b1), '10000000' );
%             end
%         end
%     else
%         if b6 == 1
%             if b5 == 1 %011
%                 saida = strcat(num2str(s2), '00001', num2str(b4), num2str(b3), num2str(b2), num2str(b1), '100000' );
%             else %010
%                 saida = strcat(num2str(s2), '000001', num2str(b4), num2str(b3), num2str(b2), num2str(b1), '10000' );
%             end
%         else
%             if b5 == 1 %001
%                 saida = strcat(num2str(s2), '0000001', num2str(b4), num2str(b3), num2str(b2), num2str(b1), '1000' );
%             else %000
%                 saida = strcat(num2str(s2), '00000000', num2str(b4), num2str(b3), num2str(b2), num2str(b1), '100' );
%             end
%         end
%     end        
%     y2(i) = str2Integer(saida, 16);
% end
% wavwrite(y2, fs, 16, 'pos_pcm.wav');
% 
% subplot(3,1,1);
% plot(y);
% 
% title('Sinal original'); ylabel('Amplitude'); xlabel('tempo');
% pcm = zeros(nAmostras, 1);
% 
% 
% subplot(3,1,2);
% plot(pcm);
% title('Sinal PCM codificado'); ylabel('Amplitude'); xlabel('tempo');
% 
% subplot(3,1,3);
% plot(y2);
% title('Sinal decodificado'); ylabel('Amplitude'); xlabel('tempo');
