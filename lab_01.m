%LAB01 - Processamento de Audio

%Tempo de Gravacao [s]
t = 5;

%Quantidade de Bits
nBits = 24;

%Frequencia de Amostragem (Hz)
fs = 44100;

%Tipo do Canal (1-Mono ou 2-Stereo)
channel = 1;

%Capturar Audio
audioCapturado = audiorecorder(fs, nBits, channel);
disp('Pronuncie uma frase:')
recordblocking(audioCapturado, t);
disp('Audio Capturado.');

%Reproduzir audio gravado
play(audioCapturado);

%Inserir pontos do audio em um vetor
pontosGravacao = getaudiodata(audioCapturado);

%Plotar grafico do audio capturado
plot(pontosGravacao);
grid;