
%função para ultima linha do triangulo de pascal

function TPa = tpascal(n)
close all;
aux = [1 1];
    if n == 1 
        TPa = 1;
    elseif n == 2
        TPa =aux;
    else
        for i=1:n-2
            TPa = [1 somaelementosvetor(aux) 1];            
            aux =TPa;
        end
    end 
    
    m = 1:length(TPa);
    hold on
    bar(m,TPa,'b')
    title("representação da curva de gauss")
    xlabel("posição do dado");
    ylabel("numero")
    plot(m,TPa,'k')
    hold off
end