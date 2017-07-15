clear ;
close all;
clc;
 g =9.81; % Gravidade
 ma = 5 ; % 
 mb = 10 ; %
 m1 = 10 ; %
 m2 = 15 ; %
 l = 1  ; %
 a = 0.2; %
 b = 0.1; %
 d = 0.4; %
 c = 0.5; %
 Ct = 4 ; %
 kt = 10 ; %
 Jg1 = 2;%
 Jg2 = 4;%
Jo1 = Jg1 + ma*(c^2) +m1*(a^2);
JA2 = Jg2 + mb*(d^2) +m2*(l^2);
u = (mb*d+m2*l)/(mb + m2);
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


 Tf = 10; % Tempo final de integração 
 ti = 0:0.001:Tf; % Vetor de tempo com amostragem contante
 y0 = [0.01  % Condições iniciais de deslocamento
       -.01  
       0   % Condições iniciais de velocidade
       0];
tm = 0.005; %controla o incremento pelo tempo até o tempo final que será integrado
 % Matrizes do sistema 
 for t=0:tm:Tf;
     M = [-b*u*(m2+mb)  JA2-(u^2)*(m2+mb) 
          Jo1+(b^2)*(mb+m2)  -u*b*(mb+m2)];
     C = [ 0  0   
          Ct   0  ];
     K = [ 0   (mb*d + m2*l).*g  
          (ma*c - m1*a +b*(m2+mb)).*g+kt   0  ];
     %h = waitbar(0,'Aguarde...'); % Crio a waitbar
     [T,Y] = ode45(@sistema,ti,y0,[],inv(M),C,K); % Integro a função sistema2
     %close(h); % Fecho a waitbar
    % figure('numbertitle','off','color','w','name','Resultados GL1')
    % subplot(2,1,1)
    % plot(T,Y(:,1))
    % xlabel('Tempo [s]')
    % ylabel('Deslocamento [rad]')
    % title('Deslocamento Teta1')
    % subplot(2,1,2)
    % plot(T,Y(:,3))
    % xlabel('Tempo [s]')
    % ylabel('Velocidade [rad/s]')
    % title('Velocidade teta1')
    % figure('numbertitle','off','color','w','name','Resultados GL2')
    % subplot(2,1,1)
    % grid;
    % plot(T,Y(:,2))
    % xlabel('Tempo [s]')
    % ylabel('Deslocamento [rad]')
    % title('Deslocamento teta2')
    % subplot(2,1,2)
    % plot(T,Y(:,4))
    % xlabel('Tempo [s]')
    % ylabel('Velocidade [rad/s]')
    % title('Velocidade teta2')
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

