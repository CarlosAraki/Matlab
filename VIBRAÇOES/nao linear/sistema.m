function dy = sistema(t,y,b,u,ms,Jo1,JA2,kt,Ct,g,ma,m1,a,c, Tf,h)
 % Esta função representa um sistema de primeira ordem, onde o parâmetro de % saída (dy) é a derivada do vetor de estados y, e neste exemplo, os % parâmetros de entrada são o tempo t, o vetor de estados y, a inversa da % matriz de inércia invM, e as matrizes de amortecimento e rigidez, C e K.
 
 
 % Matrizes do sistema 
 M = [(-b*u*ms*cos(y(2)-y(1)))     JA2-(u^2)*ms
      Jo1+(b^2)*ms                   -u*b*ms*cos(y(2)-y(1))];
  
 C = [ -y(3)*ms*b*u*sin(y(2)-y(1))     0   
      Ct     y(4)*ms*b*u*sin(y(2)-y(1))  ];
  
 K = [ 0   0  
      kt   0  ];
  
 invM = inv(M);
 % Matrizes auxiliares:
 I = eye(size(invM)); % Identidade n x n 
 Z = zeros(size(invM)); % Matriz nula n x n 
 Zv = zeros(size(invM,1),1); % Vetor nulo n x 1
 % Forma de estados: 
 A = [    Z       I
     -invM*K -invM*C];
 F = [Zv
     invM*excit(y, g, ms, u, ma, m1, a, c)];
 dy = A*y+F;
 waitbar(t/Tf,h); % Atualizo o valor da waitbar
