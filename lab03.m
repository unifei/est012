clear all;
close all;

k = 8;
H = 0;
% y = open('peso_simbolos.mat');
% disp(y);

% a =0.22;
% c= 0.15;
% d =0.15;
% e =0.145;
% f =0.155;
% b =0.075;
% g =0.0625;
% h =0.0625;

% calculo da entropia
vet = [0.22,0.15,0.15,0.145,0.135,0.075,0.0625,0.0625];
for i=1:k,
    H = H - (vet(i) * log2(vet(i)));
end
disp('Entropia: ');
disp(H);

%algoritmo de shannon
sh = zeros(1,k);
comp = 0;
for i=1:(k-1),
    sh(i) = sh(i) * 10;
    for j=(i+1):(k-1),
        sh(j) = (sh(j) * 10) + 1;
    end
end
sh(k) = sh(k-1) + 1;
disp(sh);
%comp medio do alg. shannon
for i=1:(k-1),
 comp = comp + vet(i)*i;
end
comp = comp + vet(k)*(k-1);
disp('Comprimento medio: ');
disp(comp);
disp('Eficiencia: ');
disp(1/comp);

