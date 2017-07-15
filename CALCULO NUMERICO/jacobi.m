% Esse programa resolve um sistema matricial do tipo Ax = b pelo método jacobiano
%Obs: Os inputs serão pegos pelo programa resolve.m
%caso queira rodar jacobi.m com uma matriz independente de resolve.m
%deve-se declarar previamente a matriz A e o vetor b ou retirar o comentário
%das próximas 2 linhas:
%A = input('matriz A :');	%primeira entrada a matriz A
%b = input('vetor b :'); 	%segunda entrada o vetor b

erro = 0.0001; 		%tamanho limite do erro (especificações do enunciado) 
 
tam = size(A); 		%consegue o número de linhas e colunas da Matriz A
n=tam(1); 			%numero de linhas/equações do sistema
X = b;				%meu chute inicial sempre será b (especificações do enunciado)
parar = 1; 			%usado para meu loop de iterações 
k = 1;  			%primeira iteração 
D = zeros(n,n);     %padrao do elemento e zero
I = zeros(n,1);
for i = 1:n			%enquanto i for menor que o número de equações continua
    for j = 1:n 			%enquanto j for menor que o número de equações continua
            if i==j			%se a linha for igual a coluna
            I(i,1) = b(i,1)/A(i,i); 	%o elemento do meu vetor I usado na solução 
            else
                D(i,j) = -A(i,j)/A(i,i);% caso contrário meu elemento terá um valor definido
            end	
    end
end
 
while(parar < 5000000)		%começo as iterações
    X1 = D*X + I;		%consigo uma nova solução
    for i = 1:n			%enquanto i for menor que o numero de equações
        er(i,1) = abs((X1(i,1) - X(i,1))/X1(i,1))*100; %encontro tamanho do erro 
        merro(i,1) = erro; 	%vetor de tamanho tolerável de erro
    end
    if er<merro			%se o erro for aceitável
            fprintf('%1.5f\n',X1); %gravo minha solução no meu formato adequado
            break 			%e saio do meu while
    end
    X = X1;			%caso contrário atualizo minha solução
    k = k+1; 			%e aumento meu contador de iteração 
    %parar = parar +1;
end
disp('x jacobi:');		%output a resposta pelo método jacobi.m
 
disp(X');
 
disp('k jacobi: ');		%output do número de iterações
 
disp(k);

