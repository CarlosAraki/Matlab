%verifica um numero primo depois de numero n
%primo tudo aquilo dividido por 1 e por ele mesmo N>1
%flag 1 se é primo e 0 se nao como saida
function p = primo(n)

flag = 0;

switch n
    case 1
        flag=0;
    case 2
        flag=0;
    case 3
        flag=0;
    otherwise
        for i = 2:n-1
            if flag == 1
                break
            elseif mod(n,i)== 0
                flag=1;
            else
                continue
            end
        end
end
    if flag == 0
        %disp("é primo")
        flag = 1;
    else
        %disp("não é primo")
        flag = 0;
    end

p = flag;
end