function s = excit(y, g, ms, u, ma, m1, a, c)
 % Par�metros da excita��o
 % For�as excitadoras no instante t
 s = [ ms*g*u*sin(y(2))
     -g*(ma*c-m1*a)*sin(y(1))];
