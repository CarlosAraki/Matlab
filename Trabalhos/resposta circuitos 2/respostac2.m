% algoritmo para calculo transitório em circuitos 2
%Criado Pelo Zord014 bessos
%Vm =  tensão nominal
%sigma = frequencia euleriana
%omega = frequencia nepteriana
%fase 0 por padrão

function [] = respostac2()
close all;
clear;
try
    load('endereco')
catch
    add = input('Arquivo de endereço nao encontrado! Coloque endereço atual: ','s')
    save('endereco','add')
    display("Arquivo Criado Com sucesso em sua PATH!");
end




n = input('numero de pontos(padrão 5000): '); %numero de pontos
if isempty(n)
    n = 5000;
end
Vm = input('amplitude ou rms (Padrão 1 V): ');%tensão nominal
if isempty(Vm)
    Vm = 1;
end
sigma = input('frequencia nepeteriana de decaimento: ');%frequencia nepeteriana
if isempty(sigma)
    sigma = -50;
end
omega = input('frequencia angular em rad/s: '); %frequencia angular
if isempty(omega)
    omega = 500;
end
faseg = input('fase em Graus (Padrão 0): '); %fase em graus
if isempty(faseg)
    faseg = 0;
end
fase = faseg*pi/180; %fase em radianos
tempofinal=input('tempo padrão .1 segundo: ');%em segundos
if isempty(tempofinal)
    tempofinal = .1;
end
t = 0:tempofinal/(n-1):tempofinal;


for i=1:n
    decremento(i) = exp(sigma.*t(i));
    cosse(i) = cos(omega.*t(i) + fase);
    vt(i)=Vm.*decremento(i).*cosse(i);
    decremento(i)=Vm*decremento(i);
end
subplot(3,1,1)
plot(t,vt,'b')
legend('v(t)')
xlabel('tempo')
ylabel('resposta')
grid on
title('resposta total')

subplot(3,1,2)
plot(t,decremento,'r')
legend('decremento da exponencial')
xlabel('tempo')
ylabel('resposta')
title('resposta exponencial')

subplot(3,1,3)
plot(t,cosse,'k')
legend('cos(w +fi)')
xlabel('tempo')
ylabel('resposta')
title('resposta cos(w + fi)')

print(1,add,'-dpng')
end