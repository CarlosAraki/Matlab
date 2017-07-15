% Esse programa resolve um sistema matricial do tipo Ax=b por dois métodos
%o de Gauss-Jacobi e do Gauss-Seidel e compara os dois e na linha de comando do Matlab
%coloca as respostas de X e duas normas de comparação como pede o enunciado.
%Obs: o programa jacobi.m e seidel.m deverão estar na mesma Path em que resolve.m estiver


clear 				%limpo todas as constantes já no Matlab
close all;			%fecho qualquer outro programa ou script no matlab
A = input('matriz A :');	%primeira entrada a matriz A
b = input('vetor b :'); 	%segunda entrada o vetor b

aux = A;			%auxiliares para manter a matriz A e vetorb
aux2 = b;			%para comparação dos valores

jacobi				%execução do script jacobi.m
norma1 = norm(b-A*X);	%norma do vetor b menos a Matriz A multiplicada pela solução 1
norma2 = norm(X);		%norma da solução encontrada
norma1 = norma1/norma2;	%divisão entre normas
s  = A\b; 			%equivalente ao x = A\b no enunciado
norma3 = norm(s - X);	%calculo da norma x-y do enunciado
norma2 = norma3/norma2; 	%encontro a segunda norma para comparação
disp('norma 1 jacobi:'); 	%output da primeira norma do método jacobiano
disp(norma1);
disp('norma 2 jacobi: ');	%output da segunda norma do método jacobiano
disp(norma2);

		
A = aux;			%volto os valores anteriores da matriz A e do vetor b 
b = aux2; 			%para terem os mesmos inputs da solução jacobiana

seidel				%execução do script seidel.m
norma1 = norm(b-A*X);	%encontro a norma relacionada a solução de seidel
norma2 = norm(X); 		%a norma do  vetor solução
norma1 = norma1/norma2; 	%encontro o resultado relacionado vetor solução
s  = A\b; 			%equivalente ao x =A\b
norma3 = norm(s - X);	%encontro a norma da diferença do x com a solução encontrada
norma2 = norma3/norma2; 	%encontro a outra norma relacionada ao vetor solução
disp('norma 1 seidel:');	%output da primeira norma do método seidel
disp(norma1);
 
disp('norma 2 seidel: '); 	%output da segunda norma do método seidel
disp(norma2);
