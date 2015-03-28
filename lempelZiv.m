function [codigos, codigosBinario, vetorAlfabeto] = lempelZiv(alfabeto, string)

vetorAlfabeto=cell(length(alfabeto),1); % Cria vetor vazio do tamanho do alfabeto 

for i=1:1:length(alfabeto) %preenche o vetor com as letras do alfabeto
    vetorAlfabeto{i}=alfabeto(i); 
end


%inciializa as variaveis
codigos=[]; 
i=1;
palavra=string(1); 
id=1;


while i<=length(string)   
    flag=0;
    for i=1:length(vetorAlfabeto)
        if(length(palavra)==length(vetorAlfabeto{i}))  % Verifica se a palavra já existe no vetor alfabeto, alterando o flag
            if(strcmp(palavra,vetorAlfabeto{i})==1)
                z=i;    % Decimal a ser codificado
                flag=1; 
            end
        end
    end
    if flag==0   %Se o flag é zero, adiciona a palavra ao alfabeto
        vetorAlfabeto{length(vetorAlfabeto)+1}=palavra;
        codigos(length(codigos)+1)=z;    
        palavra=palavra(length(palavra));    
    else
        
        id=id+1; %incrementa o indice
        
        if id>length(string)    
            for i=1:length(vetorAlfabeto) %codifica a ultima palavra
                if(length(palavra)==length(vetorAlfabeto{i}))
                    if(strcmp(palavra,vetorAlfabeto{i})==1)
                        z=i;
                    end
                end
            end
            codigos(length(codigos)+1)=z;
            break;
        end
        palavra=[palavra string(id)];   
    end
end

codigosBinario=dec2bin(codigos);   % Converte para binario o resultado