
%funcao para somar elementos de vetor e retorna um vetor

function vetor = somaelementosvetor(v)

tam = length(v); % vejo o tamanho do meu vetor
    for i = 1:tam
        if i~=tam
            aux(i) = v(i)+v(i+1);
        end
    end
        vetor = aux;
end