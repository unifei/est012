%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       EXERC�CIO 1     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all;
clear all;
clc;

% Dados prim�rios
fs = 11025;               % Frequ�ncia do sinal de �udio, dada em kHz
N = 5;                    % Tempo de amostragem do �udio
DTYPE = 'double';         % Tipo do dado, ap�s amostrado (neste caso, valores de ponto flutuante, com 16 bits)
tempoSom = 0:1/fs:5-1/fs; % Normalizando o vetor de amostras anal�gicas, para converter o eixo X em tempo


% Recebendo o sinal anal�gico
disp('Pressione ENTER para iniciar a grava��o.');
pause
som = wavrecord (N*fs, fs, DTYPE);

fprintf('\n\n');
disp('Sinal de entrada. Pressione ENTER para continuar.');
pause
wavplay (som, fs);

% Exibindo o sinal de entrada
figure(1)
plot(tempoSom, som);
xlabel('Tempo [s]', 'color', 'yellow');
ylabel('Amplitude [V]', 'color', 'yellow');
title('Onda sonora anal�gica de entrada', 'color', 'red');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       EXERC�CIO 2     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fss = 5*fs;
amostra = zeros(1, fss);     % Pr�-alocando um vetor na mem�ria, representando o sinal amostrado
tempo = 0:1/fs:5-1/fs;    % Normalizando o vetor de amostras, j� amostrado, para converter o eixo X em tempo
% A frequ�ncia de amostragem utilizada deve, no m�nimo, obedecer � taxa de Nyquist, ou seja, ser pelo menos duas vezes superior
% � frequ�ncia do sinal original. Para este exerc�cio, a taxa utilizada foi de 5*fs, igual a aproximadamente 55 [kHz].

% Frequ�ncia de amostragem � igual a 5*fs (a amostragem foi feita via algoritmo, sem a utiliza��o total dos conceitos de Sistemas de Comunica��o)
for i = 1:fss
    if mod(i,5) ~= 1;
        amostra(i) = 0;
    else
        amostra(i) = som(i);
    end;
end;

fprintf('\n\n');
disp('Sinal amostrado. Pressione ENTER para continuar.');
pause
wavplay (amostra, fs);

% Exibindo o sinal amostrado
figure(2)
plot(tempo, amostra);
title('Onda sonora amostrada', 'color', 'red');
xlabel('Tempo [s]', 'color', 'yellow');
ylabel('Amplitude [V]', 'color', 'yellow');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       EXERC�CIO 3     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Quantiza��o deve ser de 12 bits
valMax = max(amostra);
valMin = min(amostra);
intervalo = valMax - valMin;
passo = intervalo / 2^12;

% Pr�-alocando valores
temp = 0;
quantizado = zeros(length(amostra), 12);         % Gerando o vetor de valores quantizados
amostraQuant = zeros(1, fss);                          % Sinal com 12 bits, utilizado para compara��o de n�vel bin�rio
amostraQuant2 = zeros(1, fss);                        % Sinal com 12 bits, utilizado para a reprodu��o do som
% Tratando cada elemento do vetor quantizado como um vetor de n�meros bin�rios

% Quantizando o sinal
for i = 1:fss
    temp = amostra(i);
    k = 11;
    
    % Determinando o bit de sinal
    if temp < 0
        quantizado(i,1) = 1;
    end;
    
    % Checando os 11 bits de magnitude
    % Bit 10
    if abs(round(temp / (passo*2^k))) == 1
        quantizado(i, 2) = 1;
        amostraQuant(i) = amostraQuant(i) + 2^k;
    end;
    temp = mod(temp, passo*2^k);
    k = k - 1;
        
    % Bit 9
    if abs(round(temp / (passo*2^k))) == 1
            quantizado(i, 3) = 1;
            amostraQuant(i) = amostraQuant(i) + 2^k;
    end;
    temp = mod(temp, passo*2^k);
    k = k - 1;
      
    % Bit 8
    if abs(round(temp / (passo*2^k))) == 1
        quantizado(i, 4) = 1;
        amostraQuant(i) = amostraQuant(i) + 2^k;
    end;
    temp = mod(temp, passo*2^k);
    k = k - 1;
        
    % Bit 7
    if abs(round(temp / (passo*2^k))) == 1
        quantizado(i, 5) = 1;
        amostraQuant(i) = amostraQuant(i) + 2^k;
    end;
    temp = mod(temp, passo*2^k);
    k = k - 1;
        
    % Bit 6
    if abs(round(temp / (passo*2^k))) == 1
        quantizado(i, 6) = 1;
        amostraQuant(i) = amostraQuant(i) + 2^k;
    end;
    temp = mod(temp, passo*2^k);
    k = k - 1;
        
    % Bit 5
    if abs(round(temp / (passo*2^k))) == 1
        quantizado(i, 7) = 1;
        amostraQuant(i) = amostraQuant(i) + 2^k;
    end;
    temp = mod(temp, passo*2^k);
    k = k - 1;
        
    % Bit 4
    if abs(round(temp / (passo*2^k))) == 1
        quantizado(i, 8) = 1;
        amostraQuant(i) = amostraQuant(i) + 2^k;
    end;
    temp = mod(temp, passo*2^k);
    k = k - 1;
        
    % Bit 3
    if abs(floor(temp / (passo*2^k))) == 1
        quantizado(i, 9) = 1;
        amostraQuant(i) = amostraQuant(i) + 2^k;
    end;
    temp = mod(temp, passo*2^k);
    k = k - 1;
       
    % Bit 2
    if abs(floor(temp / (passo*2^k))) == 1
        quantizado(i, 10) = 1;
        amostraQuant(i) = amostraQuant(i) + 2^k;
    end;
    temp = mod(temp, passo*2^k);
    k = k - 1;
        
    % Bit 1
    if abs(floor(temp / (passo*2^k))) == 1
        quantizado(i, 11) = 1;
        amostraQuant(i) = amostraQuant(i) + 2^k;
    end;
    temp = mod(temp, passo*2^k);
    k = k - 1;
        
    % LSB
    if abs(floor(temp / (passo*2^k))) == 1
        quantizado(i, 12) = 1;
        amostraQuant(i) = amostraQuant(i) + 2^k;
    end;
    
    if quantizado(i,1) == 1
        amostraQuant(i) = (-1)*amostraQuant(i);
    end;
    
    amostraQuant2(i) = amostraQuant(i) / 2^11;
end;

fprintf('\n\n');
disp('Sinal Quantizado. Pressione ENTER para continuar.');
pause
wavplay (amostraQuant2, fs);

figure(3)
plot(tempo, amostraQuant);
title('Onda sonora quantizada - n�veis bin�rios', 'color', 'red');
xlabel('Tempo [s]', 'color', 'yellow');
ylabel('Amplitude [V]', 'color', 'yellow'); % TODO: como fazer para mudar a designa��o da escala??? Ao inv�s de 2, virar "0010", de 15 ser "1111", etc.

figure(4)
plot(tempo, amostraQuant2);
title('Onda sonora quantizada - anal�gica', 'color', 'red');
xlabel('Tempo [s]', 'color', 'yellow');
ylabel('Amplitude [V]', 'color', 'yellow');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       EXERC�CIO 4     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Codifica��o deve ser de 8 bits

PCM = zeros(length(amostra), 8);         % Vetor de bits, com compacta��o PCM

for i = 1 : fss
    PCM(i,1) = quantizado(i,1);          % Bit de sinal � sempre mantido
    
    if quantizado(i,2) == 1
        PCM(i,2) = 1;
        PCM(i,3) = 1;
        PCM(i,4) = 1;
        PCM(i,5) = quantizado(i,3);
        PCM(i,6) = quantizado(i,4);
        PCM(i,7) = quantizado(i,5);
        PCM(i,8) = quantizado(i,6);
    else
        if quantizado(i,3) == 1
            PCM(i,2) = 1;
            PCM(i,3) = 1;
            PCM(i,4) = 0;
            PCM(i,5) = quantizado(i,4);
            PCM(i,6) = quantizado(i,5);
            PCM(i,7) = quantizado(i,6);
            PCM(i,8) = quantizado(i,7);
        else
            if quantizado(i,4) == 1
                PCM(i,2) = 1;
                PCM(i,3) = 0;
                PCM(i,4) = 1;
                PCM(i,5) = quantizado(i,5);
                PCM(i,6) = quantizado(i,6);
                PCM(i,7) = quantizado(i,7);
                PCM(i,8) = quantizado(i,8);
            else
                if quantizado(i,5) == 1
                    PCM(i,2) = 1;
                    PCM(i,3) = 0;
                    PCM(i,4) = 0;
                    PCM(i,5) = quantizado(i,6);
                    PCM(i,6) = quantizado(i,7);
                    PCM(i,7) = quantizado(i,8);
                    PCM(i,8) = quantizado(i,9);
                else
                    if quantizado(i,6) == 1
                        PCM(i,2) = 0;
                        PCM(i,3) = 1;
                        PCM(i,4) = 1;
                        PCM(i,5) = quantizado(i,7);
                        PCM(i,6) = quantizado(i,8);
                        PCM(i,7) = quantizado(i,9);
                        PCM(i,8) = quantizado(i,10);
                    else
                        if quantizado(i,7) == 1
                            PCM(i,2) = 0;
                            PCM(i,3) = 1;
                            PCM(i,4) = 0;
                            PCM(i,5) = quantizado(i,8);
                            PCM(i,6) = quantizado(i,9);
                            PCM(i,7) = quantizado(i,10);
                            PCM(i,8) = quantizado(i,11);
                        else
                            if quantizado(i,8) == 1
                                PCM(i,2) = 0;
                                PCM(i,3) = 0;
                                PCM(i,4) = 1;
                                PCM(i,5) = quantizado(i,9);
                                PCM(i,6) = quantizado(i,10);
                                PCM(i,7) = quantizado(i,11);
                                PCM(i,8) = quantizado(i,12);
                            else                                            % �ltimo caso
                                PCM(i,2) = 0;
                                PCM(i,3) = 0;
                                PCM(i,4) = 0;
                                PCM(i,5) = quantizado(i,9);
                                PCM(i,6) = quantizado(i,10);
                                PCM(i,7) = quantizado(i,11);
                                PCM(i,8) = quantizado(i,12);
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;



% Decodificando o sinal novamente para 12 bits

decod = zeros (length(amostra), 12);     % Sinal de 12 bits, em formato bin�rio
amostraPCM = zeros(1, fss);                  % Sinal de 12 bits, para compara��o de n�vel bin�rio
amostraPCM2 = zeros(1, fss);                % Sinal de 12 bits, para a fun��o 'plot' e reprodu��o de som

for i = 1 : fss
    decod(i,1) = PCM(i,1);          % Bit de sinal � sempre mantido
    
    if PCM(i,2) == 1 && PCM(i,3) == 1 && PCM(i,4) == 1
        decod(i,2) = 1;
        decod(i,3) = PCM(i,5);
        decod(i,4) = PCM(i,6);
        decod(i,5) = PCM(i,7);
        decod(i,6) = PCM(i,8);
        decod(i,7) = 1;
        decod(i,8) = 0;
        decod(i,9) = 0;
        decod(i,10) = 0;
        decod(i,11) = 0;
        decod(i,12) = 0;
    else
        if PCM(i,2) == 1 && PCM(i,3) == 1 && PCM(i,4) == 0
            decod(i,2) = 0;
            decod(i,3) = 1;
            decod(i,4) = PCM(i,5);
            decod(i,5) = PCM(i,6);
            decod(i,6) = PCM(i,7);
            decod(i,7) = PCM(i,8);
            decod(i,8) = 1;
            decod(i,9) = 0;
            decod(i,10) = 0;
            decod(i,11) = 0;
            decod(i,12) = 0;
        else
            if PCM(i,2) == 1 && PCM(i,3) == 0 && PCM(i,4) == 1
                decod(i,2) = 0;
                decod(i,3) = 0;
                decod(i,4) = 1;
                decod(i,5) = PCM(i,5);
                decod(i,6) = PCM(i,6);
                decod(i,7) = PCM(i,7);
                decod(i,8) = PCM(i,8);
                decod(i,9) = 1;
                decod(i,10) = 0;
                decod(i,11) = 0;
                decod(i,12) = 0;
            else
                if PCM(i,2) == 1 && PCM(i,3) == 0 && PCM(i,4) == 0
                    decod(i,2) = 0;
                    decod(i,3) = 0;
                    decod(i,4) = 0;
                    decod(i,5) = 1;
                    decod(i,6) = PCM(i,5);
                    decod(i,7) = PCM(i,6);
                    decod(i,8) = PCM(i,7);
                    decod(i,9) = PCM(i,8);
                    decod(i,10) = 1;
                    decod(i,11) = 0;
                    decod(i,12) = 0;
                else
                    if PCM(i,2) == 0 && PCM(i,3) == 1 && PCM(i,4) == 1
                        decod(i,2) = 0;
                        decod(i,3) = 0;
                        decod(i,4) = 0;
                        decod(i,5) = 0;
                        decod(i,6) = 1;
                        decod(i,7) = PCM(i,5);
                        decod(i,8) = PCM(i,6);
                        decod(i,9) = PCM(i,7);
                        decod(i,10) = PCM(i,8);
                        decod(i,11) = 1;
                        decod(i,12) = 0;
                    else
                        if PCM(i,2) == 0 && PCM(i,3) == 1 && PCM(i,4) == 0
                            decod(i,2) = 0;
                            decod(i,3) = 0;
                            decod(i,4) = 0;
                            decod(i,5) = 0;
                            decod(i,6) = 0;
                            decod(i,7) = 1;
                            decod(i,8) = PCM(i,5);
                            decod(i,9) = PCM(i,6);
                            decod(i,10) = PCM(i,7);
                            decod(i,11) = PCM(i,8);
                            decod(i,12) = 1;
                        else
                            if PCM(i,2) == 0 && PCM(i,3) == 0 && PCM(i,4) == 1
                                decod(i,2) = 0;
                                decod(i,3) = 0;
                                decod(i,4) = 0;
                                decod(i,5) = 0;
                                decod(i,6) = 0;
                                decod(i,7) = 0;
                                decod(i,8) = 1;
                                decod(i,9) = PCM(i,5);
                                decod(i,10) = PCM(i,6);
                                decod(i,11) = PCM(i,7);
                                decod(i,12) = PCM(i,8);
                            else                                          % �ltimo caso
                                decod(i,2) = 0;
                                decod(i,3) = 0;
                                decod(i,4) = 0;
                                decod(i,5) = 0;
                                decod(i,6) = 0;
                                decod(i,7) = 0;
                                decod(i,8) = 0;
                                decod(i,9) = PCM(i,5);
                                decod(i,10) = PCM(i,6);
                                decod(i,11) = PCM(i,7);
                                decod(i,12) = PCM(i,8);
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;



% Convertendo o c�digo expandido em sinal de sa�da

for i = 1:fss
    k = 0;
    
    if decod(i, 12) == 1
        amostraPCM(i) = amostraPCM(i) + 2^k;
    end;
    k = k + 1;
    
    if decod(i, 11) == 1
        amostraPCM(i) = amostraPCM(i) + 2^k;
    end;
    k = k + 1;
    
    if decod(i, 10) == 1
        amostraPCM(i) = amostraPCM(i) + 2^k;
    end;
    k = k + 1;
    
    if decod(i, 9) == 1
        amostraPCM(i) = amostraPCM(i) + 2^k;
    end;
    k = k + 1;
    
    if decod(i, 8) == 1
        amostraPCM(i) = amostraPCM(i) + 2^k;
    end;
    k = k + 1;
    
    if decod(i, 7) == 1
        amostraPCM(i) = amostraPCM(i) + 2^k;
    end;
    k = k + 1;
    
    if decod(i, 6) == 1
        amostraPCM(i) = amostraPCM(i) + 2^k;
    end;
    k = k + 1;
    
    if decod(i, 5) == 1
        amostraPCM(i) = amostraPCM(i) + 2^k;
    end;
    k = k + 1;
    
    if decod(i, 4) == 1
        amostraPCM(i) = amostraPCM(i) + 2^k;
    end;
    k = k + 1;
    
    if decod(i, 3) == 1
        amostraPCM(i) = amostraPCM(i) + 2^k;
    end;
    k = k + 1;
    
    if decod(i, 2) == 1
        amostraPCM(i) = amostraPCM(i) + 2^k;
    end;
    k = k + 1;
    
    if decod(i, 1) == 1
        amostraPCM(i) = (-1) * amostraPCM(i);
    end;
    
    amostraPCM2(i) = amostraPCM(i) / 2^12;       % Restaurando o valor de tens�o do sinal decodificado
end;

fprintf('\n\n');
disp('Sinal Decodificado. Pressione ENTER para continuar.');
pause
wavplay (amostraPCM2, fs);

figure (5)
plot (tempo, amostraPCM);
title('Onda sonora restaurada - n�veis bin�rios', 'color', 'red');
xlabel('Tempo [s]', 'color', 'yellow');
ylabel('Amplitude [V]', 'color', 'yellow');

figure (6)
plot (tempo, amostraPCM2);
title('Onda sonora restaurada - anal�gica', 'color', 'red');
xlabel('Tempo [s]', 'color', 'yellow');
ylabel('Amplitude [V]', 'color', 'yellow');
