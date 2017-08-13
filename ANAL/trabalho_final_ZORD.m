clear all;
close all;
%parte a
M=1000;
m =20;
cs = 10000;
ks = 100000;
kp = 200000;
A = [0 0 1 0
    0 0 0 1
    -ks/M ks/M -cs/M cs/M
    ks/m -(ks+kp)/m cs/m -cs/m];
B = [0 0 0 kp/m]';
C = [1 -1 0 0];
D = 0;
%parte a
carro = ss(A,B,C,D);    % crio uma variável de estados
FT = tf(carro);        %comando de função de transferencia por matlab

% Resolução implicita por Cramer
syms s;
syms U;
Y1sn = [0 -(s*cs+ks)
        U ((m*(s^2))+s*cs+ks+kp)];
Y2sn = [M*(s^2)+s*cs+ks 0
        -(s*cs+ks) U];
Ysd = [ M*(s^2)+s*cs+ks -(s*cs+ ks)
         -(s*cs+ks) ((m*(s^2))+s*cs+ks+kp)];
Y1 = det(Y1sn)/det(Ysd);
Y2 = det(Y2sn)/det(Ysd);

Gs = 200000*(Y1 - Y2)/U; %função de transferencia calculada na m�o
Gs=simplify(Gs); %simplifico minha função

%Resolusão por C*(sI - A)^-1 *B

II = eye(4);
i22 = s*II - A;
FuncT = C*inv(i22)*B;
FuncT = simplify(FuncT);

%parte b simular obstáculo

yo = .1*(1+cos(pi:2*pi/20:3*pi)); % meu pulso
N = 2048;
n = length(yo); %tamanho do meu pulso em pontos
nr = N - n; %numero real de pontos
yo = [yo zeros(1,nr)];  %o começo do meu pulso e o resto são zeros
yo=yo'; %uma transposta porque fiz o sinal invertido
dt=0.005;   %meu tempo discretizado
t=0:dt:(N-1)*dt; % meu tempo com todos os pontos discretizados
plot(t,yo); %só para ver se meu pulso está certo

legend('pulso')
resposta = lsim(carro,yo,t);% calculo minha resposta pelo tempo
plot(t,resposta)%coloco a resposta em função do tempo

%parte c

%para estimar o a resposta ao impulso h(t) por transformada discreta temos
df =  1/(N*dt); %discretizo a frequencia para o inverso do tempo total
f = (0:N-1)*df; %crio o eixo das frequencias pela minha discretização de tempo

entradaporfrequencia = fft(yo); %minha transformada discreta para o pulso
respostaporfrequencia = fft(resposta); %transformada discreta para a resposta

H = respostaporfrequencia./entradaporfrequencia; %encontro a função de transferecia para transformada discreta

%agora devemos criar um Hs bom para manipulaçãoo da inversa
H=H(1:N/8); %corto tudo depois do numero de pontos discretos por 16
H=[H; zeros(N/2-N/8,1)]; %coloco zero no final do meu corte e até a metade do numero de pontos
H=[H;0;flipud(conj(H(2:N/2)))]; %espelho meu resultado e pego meu conjugado para ter só um valor real
plot(f,H)

ht=real(N*df*ifft(H));       %calculo meu impulso com minha transformada inversa e multiplicando el meu range de frequencias
plot(t,ht)

%parte d

testedocomandoimpulse = impulse(carro,t); %comparacao do teste impulse do matlab
plot(t,ht,t,testedocomandoimpulse)
legend('analitica','impulse matlab')



%parte e

%utilizaremos o ERA para identificar os estados discretos para depois
%converter para estados nao discretos meus imputs do era � o impulso vezes
%o tempo discreto

[Ae,Be,Ce,De] = erasiso(dt*ht');    %crio meus estados discretos
carro2 = ss(Ae,Be,Ce,De,dt);  % crio uma variavel de estados discretos
carro3 = d2c(carro2); %converto minha variavel de estados discretos para uma variavel de estados continuo
respostadoera = lsim(carro3,yo,t); %simulo a resposta  com meu pulso original
plot(t,respostadoera,t,resposta) %comparo a resposta do era com a resposta inical do meu sistema
legend('resposta do era','resposta original')

%parte f
%utilizaremos o comando step para gerar uma resposta ao degrau (podemos
%criar uma função degrau e calcular a resposta também
figure %crio uma nova figura
step(carro3)
hold on
step(carro)
