%LAB07 - Modulacao ASK
%A = amplitude
%fc = frequencia da portadora
%t = vetor tempo
function [portadora] = geraPortadora(A, fc, t)
    wc = 2 * pi * fc;
    portadora = cos(wc*t);
end