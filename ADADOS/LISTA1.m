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
clear
close all
t = 0:0.1:1000;
n = length(t);
for m = 1:n
    w(m) = randn();
end
%funcao de tranferencia
H = tf([1 100],[1 1]);

y = lsim(H,w,t);
subplot(3,1,1)
plot(t,y,t,w)
grid on
legend('Resposta','Entrada')
tam = length(t);
df =  1/(tam*.001); %discretizo a frequencia para o inverso do tempo total
f = (0:tam-1)*df; %crio o eixo das frequencias pela minha discretização de tempo

fw = fft(w);
fy = fft(y);

subplot(3,1,2)
plot(f,abs(fw),f,abs(fy));
legend('entrada','saida')
grid on
subplot(3,1,3)
bode(H);


%ex4 - Chirp
clear
close all
t = 0:0.001:1000;
H = tf([1 100],[1 1]);
c = sin(t.^2);
y = lsim(H,c,t);
tam = length(t);
df =  1/(tam*.001); %discretizo a frequencia para o inverso do tempo total
f = (0:tam-1)*df; %crio o eixo das frequencias pela minha discretização de tempo

fc = fft(c);
fy = fft(y);
plot(t,c)
figure
subplot(2,1,1);
plot(f,abs(c),f,abs(y))
subplot(2,1,2)
bode(H);

%ex5 

    clear
    close all

    N = 500;
    f0 = 1;
    t = 0;
    tempo = 1;
    while t<1000
        s(tempo) = 0;
        for k = 1:N
            s(tempo) = s(tempo)+sin(t*k*f0);
        end
        tempo = tempo + 1;
        t = t + .001;
    end
    t = 0:.001:1000;
    H =  tf([1 100],[1 1]);
    y= lsim(H,s,t);
    subplot(3,1,1)
    plot(t,s,t,y)
    title('Entrada e resposta pelo tempo')
    xlabel('tempo(s)')
    legend('entrada','saida')
    tam = length(t);
    df =  1/(tam*.001); %discretizo a frequencia para o inverso do tempo total
    f = (0:tam-1)*df; %crio o eixo das frequencias pela minha discretização de tempo

    fy = fft(y);
    fe = fft(s);
    subplot(3,1,2)
    plot(f,abs(fy),f,abs(fe))
    title('Aplicada transformada de fourier')
    legend('Trans. Saida','Trans. Entrada')
    subplot(3,1,3)
    bode(H)

%ex 6 - nao entendi o q ele quer e o matlab nao suporta o vetor enorme que
%resample cria...

    clear 
    close all
    f = 200*pi;
    dt = .01;
    t = 0:dt:10;
    y = sin(t);
    
    y2 = resample(y,10,1);
    t2 = (0:length(y2)-1)*dt;
    plot(t,y,t2,y2)
    
%ex7
clear
close all

linha =  animatedline;
t = 0:.001:10;
x = 0:.02:50;
c = 10;
w = 2*pi;
f = w/2*pi;
lambda = c/f;
c1 = 2*pi/lambda;
for k = 1:length(x)
    y = sin(c1.*x(k)-w.*t(k));
    addpoints(linha,x(k),y)
    drawnow
end