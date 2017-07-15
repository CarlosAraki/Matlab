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

x1=[];
x2=[];
y1=[];
y2=[];
tm = 0.005;

 Tf = 100; % Tempo final de integração 
 ti = 0:0.001:Tf; % Vetor de tempo com amostragem contante
 y0 = [0.01  % Condições iniciais de deslocamento
       -0.01  
       0   % Condições iniciais de velocidade
       0];
% h = waitbar(0,'Aguarde...'); % Crio a waitbar
for t=0:tm:Tf;
 [T,Y] = ode45(@sistema,ti,y0,[],b,u,ms,Jo1,JA2,kt,Ct,g,ma,m1,a,c); % Integro a função sistema2
        x1=[x1 0+(a+c+b)*sin(Y(1))];
        y1=[y1 0-(a+c+b)*cos(Y(1))];
        x2=[x2 x1(end)+l*sin(Y(3))];
        y2=[y2 y1(end)-l*cos(Y(3))];
        x=[x1(end) x2(end)];
        y=[y1(end) y2(end)];
        clf('reset');
        plot(x1,y1,'r',x2,y2,'g');
        hold on;
        line(x,y);
        line([0 x1(end)],[0 y1(end)]);
        pause(0.001); % responsável por quadro por segundo
        hold off;
        y0(1) = y0(1) + Y(1);
        y0(2) = y0(2) + Y(2);
        y0(3) = y0(3) + Y(3);
        y0(4) = y0(4) + Y(4);
        
 end