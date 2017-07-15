clear all
a = [0 1;-3 -4];
b = [0;1];
c= [1 0];
d=0;
%cayley-hamilton
for k=1:20,
    ao = 3/2*(-1)^(k-1)-1/2*(-3)^(k-1);
    a1 = 1/2*(-1)^(k-1)-1/2*(-3)^(k-1);
    ak=ao*eye(2)+a1*a; 
    y(k)=c*ak*b;
end

y = [0 y];
k=0:20;
stairs(k,y)