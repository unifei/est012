function [t,saida] = manchester(bits, bitrate)
% Codificação Manchester

T = length(bits)/bitrate;
n = 100;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
saida = zeros(1,length(t)); % Sinal de saída

for i = 0:length(bits)-1
  if bits(i+1) == 1
    saida(i*n+1:(i+0.5)*n) = 1;
    saida((i+0.5)*n+1:(i+1)*n) = -1;
  else
    saida(i*n+1:(i+0.5)*n) = -1;
    saida((i+0.5)*n+1:(i+1)*n) = 1;
  end
end
