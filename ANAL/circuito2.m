% algoritmo para calculo transitório em circuitos dois
close all;
clear;
n = 5000; %numero de pontos
Vm = 3/sqrt(2);%tensão nominal
sigma = -4;%frequencia nepeteriana
omega = sqrt(2); %frequencia angular
faseg = -90; %fase em graus
fase = faseg*pi/180 %fase em radianos
tempofinal=8;%em segundos
t = 0:tempofinal/(n-1):tempofinal;


for i=1:n
    decremento(i) = exp(sigma.*t(i));
    vt(i)=Vm.*decremento(i).*cos(omega.*t(i) + fase);
    decremento(i)=Vm*decremento(i);
end

plot(t,decremento,'r-',t,vt,'b')
legend('decremento','v(t)')