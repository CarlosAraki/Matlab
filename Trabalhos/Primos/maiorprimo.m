%ultimo primo da iteração
%coloca um range e calcula o maior primo na range

function p = maiorprimo(n)
p = 1;
    for i = 1:n
        flag = primo(i);
        if flag == 1
            p = i;
        end
        flag = 0;          
    end

end