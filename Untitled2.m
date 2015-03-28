%% -------------------------------------------------------------------------
 
% UNOESC - Universidade do Oeste de Santa Catarina
 
% Disciplina: Princípios de Telecomunicação
 
% Professor: Daiana Nascimento Muniz
 
% Acadêmico: Cícero Ticiani Nicodem - 164151
 
clear all
 
close all
 
clc
 
%% Variaveis globais
 
t = 0:0.001:8; % Vetor tempo
 
numeroDeAmostras = 8; M = 4; SNR = 10;
 
StringConfiguracao = RandStream('mt19937ar', 'Seed', 123456);
 
%Sinal Binário
 
sinal_binario= zeros(1,length(t));
 
%% for
 
for x=1: length(t)
 
%-------------------------------
 
if t(x)>1
 
sinal_binario(x)= 1;
 
end
 
%-------------------------------
 
if t(x)>2 sinal_binario(x)= 0;
 
end
 
%-------------------------------
 
if t(x)>3
 
sinal_binario(x)= 1;
 
end
 
%-------------------------------
 
if t(x)>4
 
sinal_binario(x)= 0;
 
end
 
%-------------------------------
 
if t(x)>5
 
sinal_binario(x)= 1;
 
end
 
%-------------------------------
 
if t(x)>6
 
sinal_binario(x)= 0;
 
end
 
%-------------------------------
 
if t(x)>7
 
sinal_binario(x)= 1;
 
end
 
%-------------------------------
 
if t(x)>8
 
sinal_binario(x)= 0;
 
end
 
%-------------------------------
 
if t(x)>9
 
sinal_binario(x)= 1;
 
end
 
end



 
 %% Algoritmo de Resolução
 
%% Modulação QPSK
 
% %%Gerando a equação de probabilidade
 
tx_databits = round(rand(1,8));
 
% % symbol_alphabet = [ 1+1j, -1+1j, 1-1j, -1-1j]/sqrt(2);
 
M = log2(length(symbol_alphabet));
 
symbols_int = 2.^[0:M-1]*reshape(tx_databits, M, []);
 
tx_symbols = symbol_alphabet(symbols_int+1);
 
hMod = modem.pskmod('M', M, 'PhaseOffset', pi/4, 'SymbolOrder', 'Gray');
 
mens_envia = modulate(hMod, sinal_binario);
 
rx_databits_temp = [real(rx_symbols)<0; imag(rx_symbols)<0];
 
rx_databits2 = reshape(rx_databits_temp, 1, []);
 
% mens_envia = rectpulse(mens_envia,numeroDeAmostras);
 
test1 = scatterplot(mens_envia);
 
%Aplicando ruído ao canal
 
SNR = 20; % an example: SNR = 20 dB
 
sigma_v = 10^(-SNR/100);
 
noise = sigma_v*(randn(size(tx_symbols))+j*randn(size(tx_symbols)))/sqrt(2);
 
msg_rx = awgn(mens_envia, SNR, 'measured', StringConfiguracao, 'dB');
 
h2 = scatterplot(msg_rx);
 
figure (2)
 
subplot 311
 
plot(tx_databits);
 
% figure (2)
 
subplot 312
 
plot(tx_symbols);
 
% figure (2)
 
subplot 313
 
% % plot(tx_symbols);
 
% %Definindo o canal awgn
 
rx_symbols = abs(tx_symbols) + abs(noise);
 
% % % % % %Calculando o Faixa de erro
 
bit_errors = sum(tx_databits ~= rx_databits);
 
ber = bit_errors/length(rx_databits);
 
% % Demodulação
 
rx_databits_temp = [real(rx_symbols)<0; imag(rx_symbols)<0];
 
rx_databits = reshape(rx_databits_temp, 1, []);
 
hDemod = modem.pskdemod('M', M, 'PhaseOffset', pi/4, 'SymbolOrder', 'Gray');
 
close(test1(ishghandle(test1)), h2(ishghandle(h2)));
 
mensagem_Mod = intdump(msg_rx,numeroDeAmostras);
 
sinal_demodulado = demodulate(hDemod, mensagem_Mod); % %Calculo do Bit de Ruído
 
SNR_vec = 0:1:10;
 
ber = nan(1,length(SNR_vec));
 


 
%%Loop de Calculo do Bit de Ruído
 
for ii = 1:length(SNR_vec) % Attention: do not use i,j as loop index!
 
SNR = SNR_vec(ii);
 
ber(ii) = bit_errors/length(rx_databits);
 
end
 
%% Criando a curva com ruido de 0 a 10 dB
 
simbasebandex(0:10);
 
figure (3)
 
semilogy(SNR_vec, ber, 'b')
 
xlabel('SNR [dB]')
 
ylabel('Bit Error Ratio')
 
title('QPSK AWGN')
 
grid on