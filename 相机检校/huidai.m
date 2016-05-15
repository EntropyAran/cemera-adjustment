function [x]=huidai(m,R)

x=zeros(n,1);

for i=n:-1:1 
    sum=0;
    for j=1:n
        aaaa=x(j,1)*R(i,j);
        sum+=aaaa;
    end
    x(i,1)=(R(i,n+1)-sum)/R(i,i);
end