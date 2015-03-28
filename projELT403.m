%Desenvolver um programa de forma que o projetista entre com a frequência
%de corte, ordem do filtro e um dos componentes passivos. O resultado será
%apresentar na tela o circuito desejado completo.

%Eliminando possíveis lixos de memória e limpando a tela
clear all;
close all;
clc;

%Variáveis de entrada do usuário
filtro = input('Qual o tipo de filtro ativo? (digitar o nome entre aspas simples)(baixa/alta/rejeita): ');
if strcmp(filtro, 'rejeita') == 0
    ordem = input('Ordem do filtro(1, 2, 3 ou 4): ');
end
frequencia = input('Frequência de corte(em Hz): ');
componente = input('Componente fornecido(digitar o nome entre aspas simples)(resistor/capacitor): ');
val = input('Valor do componente selecionado (em kiloOhm/em microFarad): ');

%Calculando o valor do outro componente discreto
val2 = 1 / (2000 * pi * frequencia * val);

%Gerando as strings de saída ao usuário
if strcmp(componente, 'resistor') == 1
    comp  = sprintf('\nR = %d kOhm', val);
    comp2 = sprintf('C = %d uF', val2);
    if strcmp(filtro, 'rejeita') == 1
        comp3 = sprintf('R/2 = %d kOhm', val/2);
        comp4 = sprintf('2C = %d kOhm\n', 2*val2);
    end
end

if strcmp(componente, 'capacitor') == 1
    comp  = sprintf('\nC = %d uF', val);
    comp2 = sprintf('R = %d kOhm', val2);
    if strcmp(filtro, 'rejeita') == 1
        comp3 = sprintf('R/2 = %d kOhm', val2);
        comp4 = sprintf('2C = %d kOhm', 2*val);
    end
end

%Cálculos de saída
disp(comp);
disp(comp2);
if strcmp(filtro, 'rejeita') == 1
    disp(comp3);
    disp(comp4);
end

temp = input('\nDigite ''ok'' para continuar: ');

%Selecionando a imagem do filtro selecionado, com suas corretas especificações
figure(1)
if strcmp(filtro, 'baixa') == 1
    if ordem == 1
       imagem = imread('baixaOrdem1.jpg');
    end
    if ordem == 2
       imagem = imread('baixaOrdem2.jpg');
    end
    if ordem == 3
        imagem = imread('baixaOrdem3.jpg');
    end
    if ordem == 4
        imagem = imread('baixaOrdem4.jpg');
    end
else
    if strcmp(filtro, 'alta') == 1
        if ordem == 1
            imagem = imread('altaOrdem1.jpg');
        end
        if ordem == 2
            imagem = imread('altaOrdem2.jpg');
        end
        if ordem == 3
            imagem = imread('altaOrdem3.jpg');
        end
        if ordem == 4
            imagem = imread('altaOrdem4.jpg');
        end
    else
        if strcmp(filtro, 'rejeita') == 1
            imagem = imread('filtroNotch.jpg');
        end
    end
end

%Mostrando a imagem do filtro selecionado
screen_size = get(0, 'ScreenSize');
image(imagem);
set(figure(1), 'Position', [0 0 screen_size(3) screen_size(4) ] );
set(gca, 'Visible', 'off');