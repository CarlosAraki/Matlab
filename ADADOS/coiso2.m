clear all
close all
clc

%% Forneca valor as variaveis abaixo

fs = 15000;      % frequencia de amostragem maxima do microcontrolador
nbits = 10;   % numero de bits do conversor AD microcontrolador


K = 339.7;       % ganh condicionamento de sinal
V0= -2.1468 ;       % offset do condicionamento de sinal


a = 40 ;     % coeficiente a
b = 100 ;      % coeficiente b

% O tipo do termopar deve ser um valor de 1 a 7 sendo:
%   1- B
%   2- E
%   3- J
%   4- N
%   5- R
%   6- S
%   7- T
tipoTermopar = 2;

%% Simulacao
sim('atv1_main_s')
tr= TempReal.time;
tm= TempMedi.time;
real =TempReal.signals.values;
medi = TempMedi.signals.values;
figure(1)
plot(tm,medi,'r-');
hold on
plot(tr,real,'b');
xlabel('Tempo')
