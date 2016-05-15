function [B,L,C,W2]=calibration_SetErrorEqation(pt_im,x,y,pt_wu,X,Y,Z,Xs,Ys,Zs,R,x0,y0,fx,fy,k1,k2,p1,p2)

number = size(x,1);

k=0;

for i=1:number
    if ~isempty(pt_im(i))
        [row,col]=find(strcmp(pt_im(i),pt_wu));
        
        if row~=0
            k=k+1;
            XX=R(1,1)*(X(row)-Xs)+R(2,1)*(Y(row)-Ys)+R(3,1)*(Z(row)-Zs);
            YY=R(1,2)*(X(row)-Xs)+R(2,2)*(Y(row)-Ys)+R(3,2)*(Z(row)-Zs);
            ZZ=R(1,3)*(X(row)-Xs)+R(2,3)*(Y(row)-Ys)+R(3,3)*(Z(row)-Zs);
            
            r_pingfang = (x(i)-x0)^2 + (y(i)-y0)^2;
            deta_x=(x(i)-x0)   *  (k1*r_pingfang+k2*(r_pingfang^2)) +   p1*(r_pingfang+2*((x(i)-x0)^2))   +   2*p2*(x(i)-x0)*(y(i)-y0);
            deta_y=(y(i)-y0)   *  (k1*r_pingfang+k2*(r_pingfang^2)) +   p1*(r_pingfang+2*((y(i)-y0)^2))   +   2*p2*(x(i)-x0)*(y(i)-y0);
           
            
            B(2*(k-1)+1,1)=(R(1,1) * fx+R(1,3) * (x(i)-x0-deta_x))/ZZ;
            B(2*(k-1)+1,2)=(R(2,1) * fx+R(2,3) * (x(i)-x0-deta_x))/ZZ;
            B(2*(k-1)+1,3)=(R(3,1) * fx+R(3,3) * (x(i)-x0-deta_x))/ZZ;
            B(2*(k-1)+1,4)=-fx*(X(row)-Xs)/ZZ;
            B(2*(k-1)+1,5)=0;
            B(2*(k-1)+1,6)=-(x(i)-x0-deta_x) * (X(row)-Xs)/ZZ;
            B(2*(k-1)+1,7)=-fx*(Y(row)-Ys)/ZZ;          
            B(2*(k-1)+1,8)=0;
            B(2*(k-1)+1,9)=-(x(i)-x0-deta_x) * (X(row)-Xs)/ZZ;
            B(2*(k-1)+1,10)=-fx*(Y(row)-Ys)/ZZ;
            B(2*(k-1)+1,11)=0;
            B(2*(k-1)+1,12)=-(x(i)-x0-deta_x) * (X(row)-Xs)/ZZ;
            B(2*(k-1)+1,13)=1-k1*r_pingfang -k2*r_pingfang^2 -(x(i)-x0) * (2 * k1 * (x(i)-x0) + 4 * k2 * (x(i)-x0)^3 + 4 * k2 * (x(i)-x0) *(y(i)-y0) - 6*p1*(x(i)-x0)-2*p2*(y(i)-y0));
            B(2*(k-1)+1,14)=-(x(i)-x0)*(2*k1*(y(i)-y0))   +   4*k2*(y(i)-y0)^3   +   4*k2*(y(i)-y0)*(x(i)-x0)^2   -   2*p1*(y(i)-y0)  -   2*p2*(x(i)-x0);
            B(2*(k-1)+1,15)=(x(i)-x0-deta_x)/fx;
            B(2*(k-1)+1,16)=0;
            B(2*(k-1)+1,17)=(x(i)-x0)*(r_pingfang);
            B(2*(k-1)+1,18)=(x(i)-x0)*(r_pingfang^2);
            B(2*(k-1)+1,19)=3*(x(i)-x0)^2+(y(i)-y0)^2;
            B(2*(k-1)+1,20)=2*(x(i)-x0)*(y(i)-y0);
            
            B(2*(k-1)+2,1)=(R(1,1) * fx+R(1,3) * (x(i)-x0-deta_x))/ZZ;
            B(2*(k-1)+2,2)=(R(2,1) * fx+R(2,3) * (x(i)-x0-deta_x))/ZZ;
            B(2*(k-1)+2,3)=(R(3,1) * fx+R(3,3) * (x(i)-x0-deta_x))/ZZ;
            B(2*(k-1)+2,4)=-fx*(X(row)-Xs)/ZZ;
            B(2*(k-1)+2,5)=0;
            B(2*(k-1)+2,6)=-(x(i)-x0-deta_x) * (X(row)-Xs)/ZZ;
            B(2*(k-1)+2,7)=-fx*(Y(row)-Ys)/ZZ;          
            B(2*(k-1)+2,8)=0;
            B(2*(k-1)+2,9)=-(x(i)-x0-deta_x) * (X(row)-Xs)/ZZ;
            B(2*(k-1)+2,10)=-fx*(Y(row)-Ys)/ZZ;
            B(2*(k-1)+2,11)=0;
            B(2*(k-1)+2,12)=-(x(i)-x0-deta_x) * (X(row)-Xs)/ZZ;
            B(2*(k-1)+2,13)=1-k1*r_pingfang -k2*r_pingfang^2 -(x(i)-x0) * (2 * k1 * (x(i)-x0) + 4 * k2 * (x(i)-x0)^3 + 4 * k2 * (x(i)-x0) *(y(i)-y0) - 6*p1*(x(i)-x0)-2*p2*(y(i)-y0));
            B(2*(k-1)+2,14)=-(x(i)-x0)*(2*k1*(y(i)-y0))   +   4*k2*(y(i)-y0)^3   +   4*k2*(y(i)-y0)*(x(i)-x0)^2   -   2*p1*(y(i)-y0)  -   2*p2*(x(i)-x0);
            B(2*(k-1)+2,15)=(x(i)-x0-deta_x)/fx;
            B(2*(k-1)+2,16)=0;
            B(2*(k-1)+2,17)=(x(i)-x0)*(r_pingfang);
            B(2*(k-1)+2,18)=(x(i)-x0)*(r_pingfang^2);
            B(2*(k-1)+2,19)=3*(x(i)-x0)^2+(y(i)-y0)^2;
            B(2*(k-1)+2,20)=2*(x(i)-x0)*(y(i)-y0);
            
            abcx=fx*XX/ZZ;
            abcy=fy*YY/ZZ;
            L(2*(k-1)+1,1)=x(i)-x0-deta_x+abcx;
            L(2*(k-1)+2,1)=y(i)-y0-deta_y+abcy;
            
        end
    end
end

C1=[0 0 0       2*R(1,1)        2*R(1,2)         2*R(1,3)       0                  0           0              0       0       0
    0 0 0       0                   0                 0        2*R(2,1)       2*R(2,2)         2*R(2,3)        0      0        0 
    0 0 0       0                   0                 0         0                0             0            2*R(3,1) 2*R(3,2) 2*R(3,3)
    0 0 0       R(1,2)          R(1,1)                0        R(2,2)          R(2,1)          0           R(3,2)     R(3,1)  0
    0 0 0       R(1,3)            0                 R(1,1)      R(2,3)         0            R(2,1)         R(3,3)     0       R(3,1)
    0 0 0       0               R(1,3)             R(1,2)        0           R(2,3)        R(2,2)          0        R(3,3)    R(3,2)]
    
C2=zeros(6,8);
C=[C1 C2];

W2=-[R(1,1)^2 + R(1,2)^2 + R(1,3)^-1
     R(2,1)^2 + R(2,2)^2 + R(2,3)^-1
     R(3,1)^2 + R(3,2)^2 + R(3,3)^-1
     R(1,1)*R(1,2)+R(2,1)*R(2,2)+R(3,1)*R(3,2)
     R(1,1)*R(1,3)+R(2,1)*R(2,3)+R(3,1)*R(3,3)
     R(1,2)*R(1,3)+R(2,2)*R(2,3)+R(3,2)*R(3,3)]
