clear all;
close all;

% prob = [1/16 1/16 1/16 1/16 1/8 1/8 1/4 1/4];
prob = [1/12 1/12 1/12 1/12 1/12 1/12 1/4 1/4];
aux = 0;
pos = 0;
cont = 0;
vet = {'0' '0' '0' '0' '0' '0' '0' '0'};
aux2 = [1 0 0 0 0 0 0 0];

for i=1:8
    for j=i:8
        if prob(j)>prob(i)
               pos =j;
        end;
    end;
    aux = prob (i);
    prob(i) = prob(pos);
    prob(pos) = aux;
end;

aux =1;
pos = 1;

for j=1:4
   for i=pos:8
        if (cont<(0.5/(2^(aux-1))))  
%             if(pos~=i)
                cont =cont + prob(i);
                aux2(i)=aux;
                pos = i;
%             end;
        end;
    end;
    pos = pos +1;
    aux = aux +1;
    cont = 0;
end;

cont = 1;

for i=1:8
    if (aux2(i)==1)
        vet{i} = '0';
        cont= cont +1;
    else
        vet{i} = '1';
    end;
end;

for j=2:3
    for i=cont:8
        if (aux2(i)==j)
            vet (i) = strcat (vet(i) , '0');
            cont = cont +1;
        else
             vet (i) = strcat (vet(i) , '1');
        end;
    end;
end;
% 
% for i=1:4
%     vet(2*i-1) = strcat (vet(2*i-1) , '1');
%     vet(2*i) = strcat (vet(2*i) , '0');
% end;
