%Scrip que simula el c�digo miller.
%Por: Diego Barrag�n Guerrero
%diegokillemall@yahoo.com
%h-->vector de bits a codificar
%est_inicial-->estado inicial de la se�al (puede ser 1 � -1)
%-------------------------------------------------------------------
h=[1 1 0 0 1 0 1 1 0 0 0 1 1 1 1 0];%Se�al
est_inicial=-1;%Estado inicial
%-------------------------------------------------------------------
clc;%Limpia el command window
close all;%Cierra todas las figuras.
con=est_inicial;%Puede ser 1 � -1
long=length(h);%N�mero de bits de la se�al
n=1;%Estado inicial para el ciclo "while"
ac=[];%Matriz vac�a que contendr� la se�al codificada.
bits=[];%Matriz vac�a que contendr� la se�al original.
h(long+1)=0;%Valor de extensi�n de la se�al
while n<=long%Codifica hasta terminar los bits de la se�al.
    if h(n)==1 %Si el bit es 1
        bit=[ones(1,100)];
        s=[con*ones(1,50) -con*ones(1,50)];
        con=con*-1;%Conmuta el estado de la se�al.
    else %Si el bit es 0
        bit=[zeros(1,100)];
        s=[con*ones(1,100)];
        if h(n+1)==0%Si el siguiente bit es 0
            con=con*-1;%Conmuta el estado de la se�al
        end
    end
    ac=[ac s];%Acumulador de la se�al miller.
    bits=[bits bit];%Acumulador de la se�al original.
    n=n+1;%Incremento del contador del loop
    s=[];%Reset de la matriz temporal s.
end
subplot(2,1,1);plot(bits,'LineWidth',2);
title('Se�al de entrada');
set(gca,'xtick',0:100:100*long)%Grid solo para espacios de 100
axis([0 100*(length(h)-1) -2 2])%Seteo de los ejes
grid on %Activa el grid
%*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
subplot(2,1,2);plot(ac,'LineWidth',2)%Grafica la se�al.
title('Se�al Codificada MILLER')
set(gca,'xtick',0:100:100*long)%Grid solo para espacios de 100
axis([0 100*(length(h)-1) -2 2])%Seteo de los ejes
grid on %Activa el grid
