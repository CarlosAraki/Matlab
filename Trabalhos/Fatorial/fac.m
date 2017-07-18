% funcao fatorial recusivo

function x = fac(valor)

    if (valor == 1 || valor == 0)
        x = 1;
    else
        x = valor*fac(valor-1);
    end
end