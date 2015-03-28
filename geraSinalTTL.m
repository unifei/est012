%LAB02 - Sinal TTL Caracteres Tabela ASCII

%Abre Arquivo com caracteres ASCII codificados em binario
tabelaASCII = importdata('tabelaASCII.txt');
tabelaASCIIStr = num2str (tabelaASCII);

%Normaliza codificacao em 8 bits
for i=1:96,
    for j=1:7,
        aux(i,j) = str2double(tabelaASCIIStr(i,j));
    end
    aux(i,8) = 0;
end
for i=1:32,
    aux (i,1) = 0;
end
for i=1:96,
    for j=8:-1:2,
        aux(i,j) = aux(i,j-1);
    end
    aux(i,1) = 0;
end

%Cria sinal TTL para 96 caracteres
y = 1:(8*10*96);
for i=1:96,
    for j=1:8,
        for k=1:10,
            y((((j-1)*10)+k) + (i-1)*8*10) = aux(i,j);
        end
    end
end

%Imagem do sinal TTL
figure(1);
plot((y*5));
title('Sinal TTL - Tabela ASCII');

%Imagem da FFT do sinal TTL
figure(2);
plot(abs(fft(y*5)));
title('FFT Sinal TTL - Tabela ASCII');