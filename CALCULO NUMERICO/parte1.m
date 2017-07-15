% parte 1
% Implemente uma funçao em matlab Ax =b a funçao descrita abaixo de acordo
% com a seguinte especificaçao
% 
% Metodo de soluçao : Gauss -Jacobi
% Entrada : matriz A e veotr b
% saida: vetor x e k , o numero de iteraçoes necessarias para convergir
% 
% clear;
% close all;
% 
% A = [1 1;0 0];
% b = [0;0];
% tam = size(A);
% taml=tam(1);
% tamc=tam(2);
% Erro=0.001;
X = input('Insira o vetor chute inicial ');

A = input('Insira a matriz dos coeficientes do sistema ');

b = input('Insira o vetor com os termos constantes ');

m = input('Insira o número máximo de iterações');

E = input('Insira a tolerância ');

n = input('Insira o número de equações ');

parar = 1;

ni = 0;

while (parar == 1 && ni < m)
    for i=1:n
        soma = 0;
        for j=1:n
            if(j~=i)
                soma = soma + A(i,j)*X(j)/A(i,i);
            end
            x(i) = (b(i)/A(i,i)) - soma;
        end
    end
    if (abs(norm(x) - norm(X))< E)
        parar = 0; 
    else
        X=x;
    end
    ni = ni + 1;
end

disp('Resposta do sistema');

disp(X');

disp('Número de iterações utilizadas: ');

disp(ni);
