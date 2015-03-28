x = randint(1,100);
t = 0:(1/10000):1+1/100;
signal = zeros(1, length(t));
bit1 = ones(1,50);
for i=1:length(x)
	if x(i) == 1
		signal(1, i*100-99:i*100-50) = bit1;
		signal(1,i*100-49:i*100) = -1*bit1;
	else
		signal(1, i*100-99:i*100-50) = -1*bit1;
		signal(1, i*100-49:i*100) = bit1;
	end
end
plot(t, signal), axis([0 1 -2 2]), grid on;