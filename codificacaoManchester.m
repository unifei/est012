%LAB06 - Codificacao Manchester

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

%Imagem do sinal TTL Codificado em Manchester
figure(3);
plot(y);
title('Sinal TTL');



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