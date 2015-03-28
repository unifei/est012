% Obtenção de resposta em freqüência (modelo nao-parametrico) através de FFT.

cor = 'k'; %Cor dos gráficos.

t = ScopeData(:,1); %Amostras/tempo.
u = ScopeData(:,2); %Entrada do sistema.
y = ScopeData(:,3); %Saída do sistema.

%Gráficos da entrada e saída do sistema.
subplot(211); plot(t,u,cor); grid; ylabel('u(t)');
title('Resposta temporal da entrada u(t) e saída y(t) do sistema');
subplot(212); plot(t,y,cor); grid; ylabel('y(t)'); xlabel('t [s]'); 
figure

T = 0.01; %Tempo de amostragem.
ne = 2^14-2500+500; %Fator de expansão dos dados.

%Expansão das amostras a partir do início da excitação.
ue = [(u(1000:2500))' ones(1,ne)*0.0]; %0.0 = valor apos o puslo.
ye = [(y(1000:2500))' ones(1,ne)*0.0];

U = fft(ue); %FFT das amostras de entrada.
Y = fft(ye); %FFT das amostras de sáida. 

t = 0:T:T*(length(ye)-1);     %Intervalo de tempo das amostras.
f = 0:(1/t(length(t))):(1/T); %Faixa de freqüência.
w = 2*pi*f;

%Gráficos das FFTs.
subplot(211); semilogx(w,abs(U),cor); ylabel('/U(jW)/');
title('Gráficos dos modulos da entrada U(jW) e saída Y(jW) do sistema');
subplot(212); semilogx(w,abs(Y),cor); ylabel('/Y(jW)/'); xlabel('W [rd/s]'); 
figure

RF = Y ./ U;          %Dados da função de transferência.
Mod_RF = abs(RF);     %Módulo da RF.
Fas_RF = angle(RF);   %Fase da RF.

wmax = 20; %Valor da freqüência máxima de visualização.
busca = find(w >= wmax);
indice_w = busca(1);
RF_U = U(1:indice_w); %Resposta em freqüêcia de interesse de U.
RF_Y = Y(1:indice_w); %Resposta em freqüêcia de interesse de Y.
w = w(1:indice_w);    %Freqüências de interesse.

FT = RF_Y ./ RF_U;    %Dados da função de transferência.
Mod_FT = abs(FT);     %Módulo da FT.
Fas_FT = angle(FT);   %Fase da FT.

%Gráfico da resposta em freqüência do sistema.
subplot(211); semilogx(w,20*log10(Mod_FT),cor); ylabel('Modulo [dB]'); grid
title('Modelo não parametrico do sistema');
subplot(212); semilogx(w,(180/pi)*Fas_FT,cor); ylabel('Fase'); xlabel('W [rd/s]'); grid

