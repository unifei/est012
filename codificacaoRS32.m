%LAB06 - Codificacao RS232

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

%Codifica o sinal TTL em RS232
rs232Code = zeros(1,length(y));
for i=1:(8*10*96),
	if y(i) == 0
		rs232Code(i) = -12;
	elseif y(i) == 1
		rs232Code(i) = 12;
	end
end

%Imagem do sinal TTL codificado em RS232
figure(1);
plot(rs232Code);
title('Codificacao RS232 - Tabela ASCII');

%Imagem da FFT do sinal TTL Codificado em RS232
figure(2);
plot(abs(fft(rs232Code)));
title('FFT Sinal TTL Codificado RS232 - Tabela ASCII');