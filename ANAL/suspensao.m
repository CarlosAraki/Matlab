% VEICULO ERA
clear all
close all
M=1000;
m=20;
ks=1e5;
kp=2e5;
cs=1e4;
% modelo
M=[M 0;0 m];
C=[cs -cs;-cs cs];
K=[ks -ks;-ks ks+kp];
A=[zeros(2,2) eye(2,2);-inv(M)*K -inv(M)*C];
B=[0;0;inv(M)*kp*[0;1]]; % valido so para cp=0 !!!
C=[1 -1 0 0];
D=0;
% input
u=0.1*(1+cos(pi:2*pi/19:3*pi));
np=length(u);
N=2*1024;
nr=N-np;
u=[u zeros(1,nr)];
u=u';
dt=0.005;
t=0:dt:(N-1)*dt;
plot(t,u)
legend('entrada u')
% resposta
suspe=ss(A,B,C,D);
y=lsim(suspe,u,t);
figure
plot(t,y)
legend('medida')
% estimando h(t)
df=1/(N*dt);
f=(0:N-1)*df;
U=fft(u);
Y=fft(y);
H=Y./U;
H=H(1:N/8);
H=[H; zeros(N/2-N/8,1)];
H=[H;0;flipud(conj(H(2:N/2)))];
h=real(N*df*ifft(H));
ha=impulse(suspe,t);
figure
plot(t,h,t,ha)
legend('medida','analitica')
% Estimacao
figure
[Ae,Be,Ce,De]=erasiso(dt*h');
susperad=ss(Ae,Be,Ce,De,dt);
susperac=d2c(susperad);
he=impulse(susperac, t);
figure
plot(t,h,t,he) 
legend('medida','estimada')
% verificacao com resposta ao degrau
figure
step(suspe)
hold on
step(susperac)