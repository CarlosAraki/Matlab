%este programa resolve sistema lineares A X = B
%Zordera 014
try    
    load('MatrizAXB')
    disp("Existence a memory with data; ")
    yorno = input('Would you like to use that data? (y/n)','s');
    if yorno == 'y'
        flagwrite = 0;
    else
        flagwrite = 1;
    end
catch
    flagwrite = 1;
end
flagerro = 1;

if flagwrite == 1
        while flagerro == 1
            A = input('Input your Matrix A: ')
            B = input('Input your Matrix B: ')
            N = size(A);
            n = size(B);
            if N(1) ~= N(2)
                disp("The Matrix A isn't a square.")
                continue
            elseif det(A) == 0
                disp("The Matrix A don't have inverse Matrix")
                continue
            elseif n(1)~=N(1)
                disp("The Matriz B is wrong.")
                continue
            else
                flagerro = 0;
                break
            end
        end
end
 
%ok I hope the matrix A and B are right
%A X = B => X = INV(A)*B
X = inv(A)*B;
save('MatrizAXB','A','B','X')

for i = 1:length(B)
    fprintf('%d -> %f\n',i,B(i))
end


