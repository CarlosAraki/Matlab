clear all
a = [0 1;-3 -4];

ao = 3/2*sin(-1) -1/2*sin(-3);
a1=1/2*sin(-1)-1/2*sin(-3);

sinA=ao*eye(2)+a1*a
a=funm(a,@sin)