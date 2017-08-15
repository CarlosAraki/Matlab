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

close all;
clear;

%ex 2 - Fibonacci

n = input('N interacoes:');
a0 = 1;
a1 = a0;
compara1 = (1+sqrt(5))/2;

for ite = 1:n
    aux = a0 + a1;
    a0 = a1;
    a1 = aux;
end
compara2 = a1/a0;
disp(compara1);
disp(compara2);

%ex 3 -  Ruido
%fazendo sinal w
t = 0:0.0001:1000;
n = length(t);
for m = 1:n
    w(m) = randn();
end
%funcao de tranferencia
H = tf([1 100],[1 1]);

y = lsim(H,w,t);

plot(t,y)
figure
fw = fft(w);
fy = fft(y);
plot(t,fw);
hold on
plot(t,fy);
hold off
figure
bode(H);





