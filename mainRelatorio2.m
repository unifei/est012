%Segunda Parte
bits = [0 1 1 0 1 0 1 0 1];
bitrate = 1; % bits per second

figure(1);

subplot(3,1,1);
[t,saida] = retornaZero(bits,bitrate);
plot(t,saida);
title(['Retorna  para Zero:']);

subplot(3,1,2);
[t,saida] = naoRetornaZero(bits,bitrate);
plot(t,saida);
title(['Nao Retorna para Zero:']);

subplot(3,1,3);
[t,saida] = manchester(bits,bitrate);
plot(t,saida);
title(['Manchester:']);