function [x]=givens(A,L)
[m,n]=size(A);
c=0.;
s=0.;
Rip=0.;
AL=ones(1,n+1)*10;
R=zeros(n+1,n+1);
for i=1:m
    for j=1:n
        AL(1;j)=A(i,j);
    end
    AL(1,n+1)=L(i);
    for k=1:n+1;
        if AL(l,k)==0 continue;
        else 
            Rip=sqrt(AL(1,k)*AL(1,k)+R(k,k)*R(k,k));
            c=R(k,k)/Rip;
            s=AL(1,k)/Rip;
            for p=1:n+1
                temp2=AL(1,p);
                temp1=R(k,p);
                R(k,p)=c*R(k,p)+s*AL(1,p);
                AL(1,p)=-s*stemp1+c*stemp2;
            end
        end
    end
end
[x]=huidai(n,R);