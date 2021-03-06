clc; clear all; close all

coord=[ 0 0
        3 4
        3 0];

inci=[  1 1 1 1 2
        2 1 1 2 3
        3 1 1 1 3]; 

tmat=[  2.1e11
        0.3 
        7800];
    
area = 0.05*0.1;
izz = 1/12*0.05*0.1^4;

tgeo=[ area
       izz];
   
cont=[ 1 1 0
       1 2 0
       3 2 0];
   
loads=[ 2 1 20e3];

%-----------------------------------------------------------------------

nnos = size(coord,1);
nel = size(inci,1);
ncont = size(cont,1);
ngdl = 2;

id=ones(ngdl,nnos);
for i=1:ncont
    id(cont(i,2),cont(i,1))=0;
end

neq=0;
for i=1:nnos
    for j=1:ngdl
        if id(j,i)==1
            neq = neq+1;
            id(j,i) = neq;
        end
    end       
end

F=zeros(neq,1);
Kg=zeros(neq,neq);

nloads=size(loads,1);
for i=1:nloads
    F(id(loads(i,2),loads(i,1)),1)=loads(i,3);
end

ngdle = 4;
for i = 1:nel
    
    ke = zeros(ngdle, ngdle);

    ele = inci(i,1);

    noi = inci(i,4);
    noj = inci(i,5);

    xi = coord(noi,1);
    yi = coord(noi,2);
    xj = coord(noj,1);
    yj = coord(noj,2);

    L = sqrt((xj-xi)^2+(yj-yi)^2);

    C = (xj-xi)/L;
    S = (yj-yi)/L;

    nTgeo = inci(i,3);
    nTmat = inci(i,2);
    Area = tgeo(1, nTgeo);
    E = tmat(1, nTmat);

    ke = (E*Area/L)*[   C^2   C*S   -C^2 -C*S;
                        C*S   S^2   -C*S -S^2;
                       -C^2  -C*S    C^2  C*S;
                       -C*S  -S^2    S*C  S^2];

    loc(1) = id(1,noi);
    loc(2) = id(2,noi);
    loc(3) = id(1,noj);
    loc(4) = id(2,noj);

    for il = 1:ngdle
        ilg = loc(il);
        if ilg ~= 0
            for ic = 1:ngdle
                icg = loc(ic);
                if icg ~= 0
                       Kg(ilg,icg) = Kg(ilg,icg) + ke(il,ic);
                end
            end
        end
    end
end
                                    
X = Kg \ F;

% - plotando ------------------------------------------------------------

A = zeros(nnos,nnos);

for i=1:nel
    A(inci(i,4), inci(i,4)) = 1;
    A(inci(i,5), inci(i,5)) = 1;
    A(inci(i,4), inci(i,5)) = 1;
    A(inci(i,5), inci(i,4)) = 1;
end

gplot(A, coord)

hold on

fator = 1000;
coordX = coord;
for i=1:size(id,1)
    for j=1:size(id,2)
        if id(i,j) ~= 0
            coordX(j,i) = coord(j,i) + fator*X(id(i,j));
        end
    end
end

gplot(A,coordX,'r')
legend('Inicial','Deformado')
axis equal
axis([0 4 -1 5])
grid

% - tens�es --------------------------------------------------------------

coord0 = zeros(size(coord));
coordX = coord;
for i = 1:size(id,1)
    for j = 1:size(id,2)
        if id(i,j) ~= 0
            coord0(j,i) = X(id(i,j));
            coordX(j,i) = coordX(j,i) + X(id(i,j));
        end
    end
end

for i = 1:nel
    
    ele = inci(i,1);

    noi = inci(i,4);
    noj = inci(i,5);

    xi = coordX(noi,1);
    yi = coordX(noi,2);
    xj = coordX(noj,1);
    yj = coordX(noj,2);
    
    L = sqrt((xj-xi)^2+(yj-yi)^2);
    c = (xj-xi)/L;
    s = (yj-yi)/L;
    
    ui = coord0(noi,1);
    vi = coord0(noi,2);
    uj = coord0(noj,1);
    vj = coord0(noj,2);
    
    u = [ui vi uj vj].';
    
    nTmat = inci(i,2);
    E = tmat(1, nTmat);
     
    u1 = [  c -s  0  0;
            s  c  0  0;
            0  0  c -s;
            0  0  s  c].'*u;
        
    ui = u1(1);
    uj = u1(3);
    
    S(ele) = E*(uj-ui)/L;
    
end
    
disp('Tens�es')
S = S.'

for i = 1:nel
    
    ele = inci(i,1);

    noi = inci(i,4);
    noj = inci(i,5);

    xi = coord(noi,1);
    yi = coord(noi,2);
    xj = coord(noj,1);
    yj = coord(noj,2);
    
    xm = xi + (xj-xi)/2;
    ym = yi + (yj-yi)/2;
    
end
