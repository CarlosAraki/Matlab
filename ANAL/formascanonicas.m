% Formas canonicas
k=1000;
m=1;
c=500;
% Variaveis de estado fisicas
A=[ 0        0     1     0
      0        0     0      1
      -k/m k/m -c/m c/m
      k/m -2*k/m c/m -2*c/m];
B=[0 0 0 1/m]';C=[ 1 0 0 0 ];D=0;
% Controlavel
Ac=[  0                 1                         0                 0
        0                 0                         1                 0
        0                  0                         0                1
     -k^2/m^2 -2*k*c/m^2 -(3*k*m+c^2)/m^2  -3*c/m];
 Bc=[0  0  0  1]'; Cc=[k/m^2  c/m^2   0   0];Dc=0;
 % Observavel
 Ao=Ac';Bo=Cc';Co=Bc'; Do=Dc;
 % Jordan
 [c,p,k] = residue([0 0 0 c/m^2 k/m^2],[1 3*c/m (3*k*m+c^2)/m^2  2*k*c/m^2 k^2/m^2]) ;
 AJ=diag(p); BJ=ones(4,1);CJ=c';DJ=0;
          