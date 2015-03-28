%LAB03 - Codificacao de Shannon
%Parametro de entrada: vetor de probabilidade
%Parametro de saida: vetor com palavras codigo
%Parametro de saida: tamanho medio da palavra

function [palavrasCodigo, entropia, tamanhoMedio, eficiencia] = shannonCode(vetProbabilidade)
    %vetProbabilidade = vetProbabilidade./sum(vetProbabilidade); %if occurrences are inputted, probabilities are gained
    % Ordena o vetor de probabilidades em ordem decrescente
    vetProbabilidade = sort(vetProbabilidade,'descend');
    % Calcula tamanho inicial
    siling = ceil(log2(1/vetProbabilidade(1)));
    sf = 0; 
    fano = 0; 
    % Calculo Entropia
    n = 1;
    Hs = 0; 
    for iii=1:length(vetProbabilidade)
        Hs = Hs + vetProbabilidade(iii)*log2(1/vetProbabilidade(iii));
    end

    for o=1:length(vetProbabilidade)-1
        fano = fano + vetProbabilidade(o);
        % Calculando as probabilidades acumuladas para cada palavra codigo
        sf=[sf 0] + [zeros(1,o) fano]; 
        % Calculando o tamanho de cada palavra codigo
        siling = [siling 0] + [zeros(1,o) ceil(log2(1/vetProbabilidade(o+1)))];
    end

    for r=1:length(sf)
        esf = sf(r);
        for p=1:siling(r)    
            esf = mod(esf,1)*2;
            % Converte a probabilidade acumulada em um numero binario
            h(p) = esf-mod(esf,1);
        end
        % Inicializacao para criar o numero binario completo 
        hh(r) = h(1)*10^(siling(r)-1);
        for t=2:siling(r)
            % Criando o numero binario completo
            hh(r) = hh(r)+h(t)*10^(siling(r)-t);
        end
    end
    c = {'0','1'};
    for i=1:length(hh)
        % Convertendo o codigo em string
        u = 1;
        for t = siling(i):-1:1
            f = floor(hh(i)/10^(t-1));
            hh(i) = mod(hh(i),10^(t-1));
            if f == 1
                if u == 1
                    d = c{2};
                else
                    d = [d c{2}];
                end
            else
                if u == 1
                    d = c{1};
                else
                    d = [d c{1}];
                end
            end
            palavrasCodigo{i,:} = {d};
            u = u+1;
        end
    end
    % Inicializacao para tamanho da palavra codigo
    tao=siling(1)*vetProbabilidade(1);
    % Calculando o tamanho da palavra codigo
    for u=1:length(vetProbabilidade)-1
        tao = tao + siling(u+1)*vetProbabilidade(u+1);
    end
    tamanhoMedio = tao/n;
    entropia = Hs;
    eficiencia = entropia / tamanhoMedio;
end
