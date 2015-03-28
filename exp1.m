%Eliminando possíveis lixos de memória
clear all;
close all;

%Determinando pré-condições para os gráficos
    A = 1 ;                      %Amplitude da mensagem (V)
    fs = 25 ;                    %Frequência da mensagem (Hz)  
    fc = 10 * fs ;               %Frequência da portadora (Hz)
    %Índices de modulação:
        m1 = 0.3 ;
        m2 = 0.7 ;
        m3 = 1 ;
        m4 = 1.4 ;
    %Amplitudes das portadoras (moduladores)
        A1 = 1/m1;
        A2 = 1/m2;
        A3 = 1/m3;
        A4 = 1/m4;

% Determinando um vetor de instantes de tempo (número de amostras)
    t = 0.01 : 0.0001 : 0.1 ; 

%Sinal modulante:
    x = A * sin(2 * pi * fs * t) ;

%Gráfico de x(t)
    figure(1)
    plot(0:900, x, 'color', 'red') ;
    xlabel('Tempo [s]') ;
    ylabel('Amplitude [V]') ;
    title('Sinal Modulante') ;
    grid on

%Sinal da portadora:
    c1 = A1 * cos(2 * pi * fc * t) ;
    c2 = A2 * cos(2 * pi * fc * t)
    c3 = A3 * cos(2 * pi * fc * t)
    c4 = A4 * cos(2 * pi * fc * t)

%Gráfico de c(t)
    figure(2)
    plot(0:900, c1) ;
    xlabel('Tempo [s]') ;
    ylabel('Amplitude [V]') ;
    title('Sinal da Portadora - índice de modulação 0.3') ;
    grid on

    figure(3)
    plot(0:900, c2) ;
    xlabel('Tempo [s]') ;
    ylabel('Amplitude [V]') ;
    title('Sinal da Portadora - índice de modulação 0.7') ;
    grid on
    
    figure(4)
    plot(0:900, c3) ;
    xlabel('Tempo [s]') ;
    ylabel('Amplitude [V]') ;
    title('Sinal da Portadora - índice de modulação 1') ;
    grid on

    figure(5)
    plot(0:900, c4) ;
    xlabel('Tempo [s]') ;
    ylabel('Amplitude [V]') ;
    title('Sinal da Portadora - índice de modulação 1.4') ;
    grid on

%Sinal modulado com portadora:
    s1 = (1 + (x.*m1)).* c1 ;
    s2 = (1 + (x.*m2)).* c2 ;
    s3 = (1 + (x.*m3)).* c3 ;
    s4 = (1 + (x.*m4)).* c4 ;

%Gráfico de s(t)
    figure(6)
    hold on
    plot(0:900, x+A1, '-.', 'color', 'red') ;
    plot(0:900, -x-A1, '-.', 'color', 'red') ;
    plot(0:900, s1) ;
    ylabel('Amplitude [V]') ;
    xlabel('Tempo [s]') ;
    title('Sinal Modulado, limitado pela mensagem - índice de modulação 0.3') ;
    hold off

    figure(7)
    hold on
    plot(0:900, x+A2, '-.', 'color', 'red') ;
    plot(0:900, -x-A2, '-.', 'color', 'red') ;
    plot(0:900, s2) ;
    ylabel('Amplitude [V]') ;
    xlabel('Tempo [s]') ;
    title('Sinal Modulado, limitado pela mensagem - índice de modulação 0.7') ;
    hold off

    figure(8)
    hold on
    plot(0:900, x+A3, '-.', 'color', 'red') ;
    plot(0:900, -x-A3, '-.', 'color', 'red') ;
    plot(0:900, s3) ;
    ylabel('Amplitude [V]') ;
    xlabel('Tempo [s]') ;
    title('Sinal Modulado, limitado pela mensagem - índice de modulação 1') ;
    hold off
    
    figure(9)
    hold on
    plot(0:900, x+A4, '-.', 'color', 'red') ;
    plot(0:900, -x-A4, '-.', 'color', 'red') ;
    plot(0:900, s4) ;
    ylabel('Amplitude [V]') ;
    xlabel('Tempo [s]') ;
    title('Sinal Modulado, limitado pela mensagem - índice de modulação 1.4') ;
    hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Espectros de Amplitude
    % Mensagem no domínio da frequência
        xx = fftshift(abs(fft(x))) ;

    % Portadora no domínio da frequência
        c11 = fftshift(abs(fft(c1))) ;
        c22 = fftshift(abs(fft(c2))) ;
        c33 = fftshift(abs(fft(c3))) ;
        c44 = fftshift(abs(fft(c4))) ;

    % Sinal modulado no domínio da frequência
        s11 = fftshift(abs(fft(s1))) ;
        s22 = fftshift(abs(fft(s2))) ;
        s33 = fftshift(abs(fft(s3))) ;
        s44 = fftshift(abs(fft(s4))) ;

    % Plotando os espectros
        figure(10)
        plot(0:900, xx) ;
        xlabel('Frequência [rad/s]');
        ylabel('Amplitude [V]')
        title('Espectro de Amplitude do sinal modulante');

        figure(11)
        plot(0:900, c11) ;
        xlabel('Frequência [rad/s]');
        ylabel('Amplitude [V]')
        title('Espectro de Amplitude da portadora - índice de modulação 0.3');
        
        figure(12)
        plot(0:900, c22) ;
        xlabel('Frequência [rad/s]');
        ylabel('Amplitude [V]')
        title('Espectro de Amplitude da portadora - índice de modulação 0.7');

        figure(13)
        plot(0:900, c33) ;
        xlabel('Frequência [rad/s]');
        ylabel('Amplitude [V]')
        title('Espectro de Amplitude da portadora - índice de modulação 1');
        
        figure(14)
        plot(0:900, c44) ;
        xlabel('Frequência [rad/s]');
        ylabel('Amplitude [V]')
        title('Espectro de Amplitude da portadora - índice de modulação 1.4');
        
        figure(15)
        plot(0:900, s11) ;
        xlabel('Frequência [rad/s]');
        ylabel('Amplitude [V]')
        title('Espectro de Amplitude do sinal modulado - índice de modulação 0.3');

        figure(16)
        plot(0:900, s22) ;
        xlabel('Frequência [rad/s]');
        ylabel('Amplitude [V]')
        title('Espectro de Amplitude do sinal modulado - índice de modulação 0.7');
        
        figure(17)
        plot(0:900, s33) ;
        xlabel('Frequência [rad/s]');
        ylabel('Amplitude [V]')
        title('Espectro de Amplitude do sinal modulado - índice de modulação 1');
        
        figure(18)
        plot(0:900, s44) ;
        xlabel('Frequência [rad/s]');
        ylabel('Amplitude [V]')
        title('Espectro de Amplitude do sinal modulado - índice de modulação 1.4');