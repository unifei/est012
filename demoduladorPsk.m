function [ mn ] = demoduladorPsk( m, ss, bitRange )
%DEMODULADORPSK 

br=1/bitRange;                                                        
f=br*2; 
mn=[];
for n=ss:ss:length(m)
  t=bitRange/99:bitRange/99:bitRange;
  y=cos(2*pi*f*t);  %sinal portadora
  mm=y.*m((n-(ss-1)):n);
  t4=bitRange/99:bitRange/99:bitRange;
  z=trapz(t4,mm)    %integral                                        
  zz=round((2*z/bitRange))                                     
  if(zz>0)                                        
                         
    a=1;
  else
    a=0;
  end
  mn=[mn a];
end
disp(' Informação binária recebida:');
disp(mn);

end
