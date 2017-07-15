
clear all
a = [0 1;-3 -4];
b = [0;1];
c= [1 0];
d=0;

for k=1:20,
     y(k)=c*a^(k-1)*b;
end

y = [0 y];
k=0:20;
stairs(k,y)