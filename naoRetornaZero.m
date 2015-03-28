function [t,saida] = naoRetornaZero(bits, bitrate)
% Não Retorna para Zero

T = length(bits)/bitrate; 
n = 100;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
saida = zeros(1,length(t)); % sinal de saida

for i = 0:length(bits)-1
  if bits(i+1) == 1
    saida(i*n+1:(i+1)*n) = 1;
  else
    saida(i*n+1:(i+1)*n) = 0;
  end
end
