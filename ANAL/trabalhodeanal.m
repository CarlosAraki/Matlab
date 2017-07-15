clear all;
close all;
ks = 100000;
kp = 200000;
cs = 10000;
M = 1000;
m = 20;



A = [ 0 0 1 0
      0 0 0 1
      -ks/M ks/M -cs/M cs/M
      ks/m -ks/m cs/m -cs/m];
B = [0
      0
      0
      kp];

C = [1 0 0 0];
D = 0;

%calculo da função de transferencia

sistemamortecedor = ss(A,B,C,D);
TF =  tf(sistemamortecedor);