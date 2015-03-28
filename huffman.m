function [C,lengths,L,H,n] = huffman(p)

[r , c] = size(p);
if (r~=1)&(c~=1)
   disp('Erro: p não é um vetor de probabilidades');
   C = {''};
   return
else
   nn = max(r,c);
end

if (min(p)<0)
   disp('Erro: probabilidade negativa');
   C = {''};
   return
end

if (abs(sum(p) - 1.0) > eps)
   disp('Probabilidades não somam 1!')
   disp('Normalização automática pelo programa')
   p = p/sum(p);
end

C = huff(p);

for i=1:length(C)
    lengths(i) = length(char(C(i)));
end

L = sum(p(:).*lengths(:));

H = -sum(log2(p).*p);

n = H/L;