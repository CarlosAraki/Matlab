%aquisição de dados lista 1
%Zord014
clear 
close all;
%ex 1.1

x = -10:0.1:10;
fx = x.^2-2.*x-3;
plot(x,fx)

%ex 1.2

fx = abs(sin(x.^3)+cos(2.*x));
plot(x,fx)

%ex 1.3

fx = exp(x.^2);
plot(x,fx)

%ex 1.4     

fx = exp(x+pi*i)+exp(x);
compass(fx)
figure
plot(real(fx),imag(fx),'+')
close

%ex 1.5

fx =1+real(exp(i.*x))-cos(x);
plot(x,fx)


%ex 1.6
k= -10;
for q = 1:201
   fx(q) = quad(@myfun,-10,k);
   k = k+.1;
end
plot(x,fx)
