% Obten��o de resposta em freq��ncia (modelo nao-parametrico) atrav�s de FFT.

cor = 'k'; %Cor dos gr�ficos.

t = ScopeData(:,1); %Amostras/tempo.
u = ScopeData(:,2); %Entrada do sistema.
y = ScopeData(:,3); %Sa�da do sistema.

%Gr�ficos da entrada e sa�da do sistema.
subplot(211); plot(t,u,cor); grid; ylabel('u(t)');
title('Resposta temporal da entrada u(t) e sa�da y(t) do sistema');
subplot(212); plot(t,y,cor); grid; ylabel('y(t)'); xlabel('t [s]'); 
figure

T = 0.01; %Tempo de amostragem.
ne = 2^14-2500+500; %Fator de expans�o dos dados.

%Expans�o das amostras a partir do in�cio da excita��o.
ue = [(u(1000:2500))' ones(1,ne)*0.0]; %0.0 = valor apos o puslo.
ye = [(y(1000:2500))' ones(1,ne)*0.0];

U = fft(ue); %FFT das amostras de entrada.
Y = fft(ye); %FFT das amostras de s�ida. 

t = 0:T:T*(length(ye)-1);     %Intervalo de tempo das amostras.
f = 0:(1/t(length(t))):(1/T); %Faixa de freq��ncia.
w = 2*pi*f;

%Gr�ficos das FFTs.
subplot(211); semilogx(w,abs(U),cor); ylabel('/U(jW)/');
title('Gr�ficos dos modulos da entrada U(jW) e sa�da Y(jW) do sistema');
subplot(212); semilogx(w,abs(Y),cor); ylabel('/Y(jW)/'); xlabel('W [rd/s]'); 
figure

RF = Y ./ U;          %Dados da fun��o de transfer�ncia.
Mod_RF = abs(RF);     %M�dulo da RF.
Fas_RF = angle(RF);   %Fase da RF.

wmax = 20; %Valor da freq��ncia m�xima de visualiza��o.
busca = find(w >= wmax);
indice_w = busca(1);
RF_U = U(1:indice_w); %Resposta em freq��cia de interesse de U.
RF_Y = Y(1:indice_w); %Resposta em freq��cia de interesse de Y.
w = w(1:indice_w);    %Freq��ncias de interesse.

FT = RF_Y ./ RF_U;    %Dados da fun��o de transfer�ncia.
Mod_FT = abs(FT);     %M�dulo da FT.
Fas_FT = angle(FT);   %Fase da FT.

%Gr�fico da resposta em freq��ncia do sistema.
subplot(211); semilogx(w,20*log10(Mod_FT),cor); ylabel('Modulo [dB]'); grid
title('Modelo n�o parametrico do sistema');
subplot(212); semilogx(w,(180/pi)*Fas_FT,cor); ylabel('Fase'); xlabel('W [rd/s]'); grid

