clear ;
close all;
clc;

g = 9.81;   % Gravidade

ma = 5 ;    % [kg]
mb = 10 ;   % [kg]

m1 = 10 ;   % [kg]
m2 = 15 ;   % [kg]

ms = (mb+m2);
 
l = 1  ;    % [m]
d = 0.4;    % [m]

% Distancias da barra 1
a = 0.2;    % [m]
b = 0.1;    % [m]
c = 0.5;    % [m]

u = (mb*d+m2*l)/(mb + m2);      % [m]

Ct = 4 ;    % [N/rad*s]
kt = 10 ;   % [N/rad]

Jg1 = 2;    % [kg*m^2]
Jg2 = 4;    % [kg*m^2]

Jo1 = Jg1 + ma*(c^2) +m1*(a^2);     % [kg*m^2]
JA2 = Jg2 + mb*(d^2) +m2*(l^2);     % [kg*m^2]

% A = Jg2 + ma.*(c.^(2)) + m1.*(a^(2))-((mb+m2).*(b^(2))).*(m2+mb);
% E = Jg2 +  mb.*(d.^(2)) + m2.*(l.^(2))+(((mb.*d +m2.*l)/(mb+m2)).^2);
% B =d.*b.*(m2+mb);
% D = g.*[ma.*c - m1.*a + b.*(m2+mb) + kt];
% F = b.*((mb.*d + m2.*l)/(mb +m2)).*(m2 + mb);
% G = g.*(mb.*d +m2.*l);



 Tf = 35; % Tempo final de integração 
 ti = 0:0.001:Tf; % Vetor de tempo com amostragem contante
 y0 = [0.01  % Condições iniciais de deslocamento
       -0.01  
       0   % Condições iniciais de velocidade
       0];
 h = waitbar(0,'Aguarde...'); % Crio a waitbar
 [T,Y] = ode45(@sistema,ti,y0,[],b,u,ms,Jo1,JA2,kt,Ct,g,ma,m1,a,c, Tf,h); % Integro a função sistema2
 close(h); % Fecho a waitbar
figure('numbertitle','off','color','w','name','Resultados GL1')
subplot(2,1,1)
plot(T,Y(:,1))
xlabel('Tempo [s]')
ylabel('Deslocamento [rad]')
title('Deslocamento Teta1')
subplot(2,1,2)
plot(T,Y(:,3))
xlabel('Tempo [s]')
ylabel('Velocidade [rad/s]')
title('Velocidade teta1')
figure('numbertitle','off','color','w','name','Resultados GL2')
subplot(2,1,1)
grid;
plot(T,Y(:,2))
xlabel('Tempo [s]')
ylabel('Deslocamento [rad]')
title('Deslocamento teta2')
subplot(2,1,2)
plot(T,Y(:,4))
xlabel('Tempo [s]')
ylabel('Velocidade [rad/s]')
title('Velocidade teta2')
hold on;
