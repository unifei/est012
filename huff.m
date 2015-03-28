function C = huff(p)

if length(p) == 2
   C = {'0','1'};
else
   [psort , ind] = sort(p);
   first = min(ind(1),ind(2));
   second = max(ind(1),ind(2));
   paux(first) = psort(1) + psort(2);
   paux(1:first-1) = p(1:first-1);
   paux(first+1:second-1) = p(first+1:second-1);
   paux(second:length(p)-1) = p(second+1:length(p));
   
   Caux = huff(paux);

   C(1:second-1) = Caux(1:second-1);
   C(first) = cellstr(strcat(C(first),'0'));
   C(second) = cellstr(strcat(Caux(first),'1'));
   C(second+1:length(p)) = Caux(second:length(p)-1);
end
