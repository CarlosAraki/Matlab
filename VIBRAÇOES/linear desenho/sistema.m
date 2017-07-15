function dy = sistema(t,y,invM,C,K)
 % Esta função representa um sistema de primeira ordem, onde o parâmetro de % saída (dy) é a derivada do vetor de estados y, e neste exemplo, os % parâmetros de entrada são o tempo t, o vetor de estados y, a inversa da % matriz de inércia invM, e as matrizes de amortecimento e rigidez, C e K.
 % Matrizes auxiliares:
 I = eye(size(invM)); % Identidade n x n 
 Z = zeros(size(invM)); % Matriz nula n x n 
 Zv = zeros(size(invM,1),1); % Vetor nulo n x 1
 % Forma de estados: 
 A = [    Z       I
     -invM*K -invM*C];
 F = [Zv
     invM*excit(t)];
 dy = A*y+F;
% waitbar(t/Tf,h); % Atualizo o valor da waitbar
