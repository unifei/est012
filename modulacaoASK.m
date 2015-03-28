%LAB07 - Sinal TTL Modulado ASK

%Abre Arquivo com caracteres ASCII codificados em binario
tabelaASCII = importdata('tabelaASCII.txt');
tabelaASCIIStr = num2str (tabelaASCII);

%Normaliza codificacao em 8 bits
for i=1:96,
    for j=1:7,
        bitsTabela(i,j) = str2double(tabelaASCIIStr(i,j));
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

%Gera portadora
fc = 1/10;
t = 1:1:7680;
portadora = geraPortadora(1, fc, t);
figure(1);
plot(portadora);
title('Portadora');

%Modula em ASK
sinalModulado = y.*portadora;

%Imagem do sinal TTL
figure(2);
plot(sinalModulado);
title('Sinal TTL Modulado ASK');

%Imagem da FFT do sinal TTL
figure(3);
plot(abs(fft(sinalModulado)));
title('FFT Sinal TTL Modulado ASK');