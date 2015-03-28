Ns=4;Ds=[2 1 0];T=0.1
[Nz,Dz]=c2dm(Ns,Ds,T,'zoh')
rlocus(Ns,Ds)
Kp = 0:0.1:25; 
raizes = rlocus(Nz,Dz,Kp); 
Ang=linspace(0,2*pi,100);ExpAng=exp(j*Ang); re=real(ExpAng); im=imag(ExpAng); 
plot(real(raizes),imag(raizes),'k',re,im,'k:'); 
xlabel('Real'); ylabel('Imag.'); 
title('Lugar das Raízes de 1+KpG(z)=0');
[k,polos]=rlocfind(Nz,Dz) 
