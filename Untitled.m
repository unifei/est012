
aux='fim';
vector(tamanho+2)=cellstr(aux);

if (tamanho > 1)
    if (tamanho == 2)
        aux=strcat(vector(posicao),'0');
        aux2=strcat(vector(posicao+1),'1');
        
        vector(posicao)=cellstr(aux);
        vector(posicao+1)=cellstr(aux2);
        %//meter 0 em posicao e 1 em posicao+1
        
    end
    if (tamanho >2)
        divisao=0; 
        posicao_aux=1;
        
        for j=posicao:((posicao)+(tamanho-1))
            divisao=divisao+probabilidades(j);
        end
        divisao=divisao/2;
        
        aux = probabilidades(posicao);
      posicao_aux = posicao;
        
        while (   (abs(aux-divisao)) > ( abs(probabilidades(posicao_aux+1)+aux)-divisao) )
            posicao_aux=posicao_aux+1;
            aux=aux+probabilidades(posicao_aux);
        end
        
         for k=posicao:posicao_aux
             aux=strcat(vector(k),'0');
             vector(k)=cellstr(aux);
         end
         
         for l=(posicao_aux+1):((posicao)+(tamanho-1))
            aux=strcat(vector(l),'1');
            vector(l) = cellstr(aux); 
         end
         
        %//meter 0 acima e inclusivé em posicao_aux e 1 aba posicao_aux ate posicao+tamanho
           [vector]=codifica(probabilidades, posicao , posicao_aux-(posicao-1),vector,0);
          [vector]=codifica(probabilidades, posicao_aux+1, tamanho-((posicao_aux+1)-posicao),vector,2);                    
    end
end

