%------------------------------------------------------------
%  Eigensystem Realization Algorithm
%  Estimacao de modelo de estados discreto
%  pelo metodo ERA de Juang e Pappa da NASA
%  Implementacao SISO Arruda 4/1992
%  Entrada IRF's h vetor (1 x nt), nt >> (s+r)
%  Sa�da modelo discreto A,B,C,D   
%------------------------------------------------------------

% Montar matriz de Hankel H(1):
H1=0;
H2=0;
[ndof nt]=size(h);
fprintf('\n No. de time samples  nt = %2.0f ',nt);
fprintf('\n No. de DOFs medidos  ndof = %2.0f ',ndof);
s=input('\n No. s+1 de colunas da matriz de Hankel ( s+r+2 < nt ): ');
r=input('\n No. r de vezes que h e sobreposta na matriz de Hankel: ');
s=s-1;
for j=1:s+1,
  im=1;
  ir=0;
  for i=1:r*ndof,
    H1(i,j)= h(im,j+ir+(1-1));
    im=im+1;
    if im > ndof,
       im=1;
       ir=ir+1;
    end
  end
end

% SVD de H1:
[U S V]=svd(H1);

% Selecionar SVs nao-nulos (desprezados):
plot(diag(S))
title(' Escolha o No. de raizes com os SVs: ')
ylabel(' Singular Values ')
xlabel(' No. de raizes ')
nsvd=input(' No. de raizes: ');

% Truncar U,S e V com nsvd escolhido (nsvd=no de vari�veis de estados, ordem do sistema):
St=S(1:nsvd,1:nsvd);
Ut=U(:,1:nsvd);
Vt=V(:,1:nsvd);

% Montar H(2):
for j=1:s+1,
  im=1;
  ir=0;
  for i=1:r*ndof,
    H2(i,j)= h(im,j+ir+(2-1));
    im=im+1;
    if im > ndof,
       im=1;
       ir=ir+1;
    end
  end
end

% Calcular system matrices Aera,Bera,Cera, Dera:
St2=sqrt(St);
Sti2=inv(St2);
Aera=Sti2*Ut'*H2*Vt*Sti2;
Ob=Ut*St2;
Co=St2*Vt';
Cera=Ob(1:ndof,:); % (ndof x nsvd) 
Bera=Co(:,1); % (nsvd x 1) one input
Dera=0;