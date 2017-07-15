clc; clear all; close all % Limpa a tela; Limpa as variáveis; Fecha os gráficos.

% J. Labaki EM406 - Resistência dos Materiais I, 2017a.
% Programa exemplo para plotar diagramas de esforços 
% internos contendo funções de singularidade.
% 6 de abril de 2017.

% Este programa corresponde ao Exemplo 1 dado em aula:
% Uma viga de comprimento L, com apoios deslizantes em x=L/4
% e x=L, um carregamento constante de intensidade q0 entre
% x=L/2 e x=L, e um momento concentrado de intensidade Md,
% no sentido anti-horário, aplicado no ponto x=3L/4.

q0 = 20;    % [N/m]
L = 1;      % [m]
Md = 1;     % [N.m]

x = 0:L/400:L; % Cria um vetor x={0 L/400 2L/400 ... L}.

Ryb = 1/6*q0/L -4/3*Md/L;

% Esforço cortante.
Vy = Ryb*(x - L/4).^0.*(x >= L/4) ...   % =0 se x<L/4 e =Ryb*(x-L/4).^0 se x>=L/4.
     -q0*(x - L/2).^1.*(x >= L/2);      % =0 se x<L/2 e =-q0*(x-L/2).^1 se x>=L/2.

% Momento fletor.
Mz = Ryb*(x - L/4).^1.*(x >= L/4) ...   % =0 se x<L/4 e =Ryb*(x-L/4).^1 se x>=L/4.
   -q0/2*(x - L/2).^2.*(x >= L/2) ...   % =0 se x<L/2 e =-q0/2*(x-L/2).^2 se x>=L/2.
     -Md*(x - 3*L/4).^0.*(x >= 3*L/4);  % =0 se x<3L/4 e =-Md*(x-3L/4).^0 se x>=3L/4.

plot(   x, Vy, 'linewidth', 4)
grid; set(gca,'FontSize',14)
ylabel('V_Y(x) [N]','FontSize',14,'FontWeight','bold')
xlabel('x [m]','FontSize',14,'FontWeight','bold')
movegui('northwest')

figure
plot(   x, Mz, 'linewidth', 4)
grid; set(gca,'FontSize',14)
ylabel('M_Z(x) [N.m]','FontSize',14,'FontWeight','bold')
xlabel('x [m]','FontSize',14,'FontWeight','bold')
movegui('southwest')


