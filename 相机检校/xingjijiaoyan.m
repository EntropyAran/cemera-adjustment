clear;

[pt_wu,X,Y,Z]=textread("E:\大三下\实习\数字摄影测量实习资料\数字摄影测量 实习资料\相机检校\物方控制点坐标.txt",%s %f %f %f);
number_wu=size(X,1);
[pt_im,x1,y1]=textread("E:\大三下\实习\数字摄影测量实习资料\数字摄影测量 实习资料\相机检校\像点坐标.txt",%s %f %f);
x1=x1-2672;
y1=2004-y1;
number_xiang1=size(x1,1);

X0=0;   Y0=0;
Fx=2000;    Fy=2000;
K1=0; K2=0; K3=0;
P1=0;   P2=0;
Xs=mean(X); Ys=mean(Y); Zs=mean(Z);
R=eye(3,3);


    
ip=0;
dX=zeros(26,1);

while max(abs(dX))>0.0001|ip==0
    ip=ip+1;
    
    [B,L,C,WW]=calibration_SetErrorEquation(pt_im,x1,y1,pt_wu,X,Y,Z,Xs,Ys,Zs,R,X0,Y0,Fx,Fy,K1,K2,P1,P2);
    N1=B'*B;
    M1=[N1:C];
    N2=C';
    N3=zeros(6,6);
    M2=[N2;N3];
    M=[M1;M2];
    WL=B'*L;
    W=[WL,WW];
    dXX=givens(M,W);
    dX=dXX(1:20);
    
    
    kn=1; 
    Xs=Xs+dX(kn,1);              kn=kn+1;    
    Ys=Ys+dX(kn,1);              kn=kn+1;   
    Zs=Zs+dX(kn,1);              kn=kn+1;
    
    R(1,1)=R(1,1)+dX(kn,1);      kn=kn+1;
    R(1,2)=R(1,2)+dX(kn,1);      kn=kn+1;
    R(1,3)=R(1,3)+dX(kn,1);      kn=kn+1;
    R(2,1)=R(2,1)+dX(kn,1);      kn=kn+1;
    R(2,2)=R(2,2)+dX(kn,1);      kn=kn+1;
    R(2,3)=R(2,3)+dX(kn,1);      kn=kn+1;
    R(3,1)=R(3,1)+dX(kn,1);      kn=kn+1;
    R(3,2)=R(3,2)+dX(kn,1);      kn=kn+1;
    R(3,3)=R(3,3)+dX(kn,1);      kn=kn+1;
    
    X0=X0+dX(kn,1);              kn=kn+1;
    Y0=Y0+dX(kn,1);              kn=kn+1;
    Fx=Fx+dX(kn,1);              kn=kn+1;
    Fy=Fy+dX(kn,1);              kn=kn+1;
    K1=K1+dX(kn,1);              kn=kn+1;
    K2=K2+dX(kn,1);              kn=kn+1;
    P1=P1+dX(kn,1);              kn=kn+1;
    P2=P2+dX(kn,1);              kn=kn+1;
    
end

V=B*dX-L;
pvv=V'*V;
Phi=atan(-R(1,3)/R(3,3));
Omega=asin(-R(2,3));
Kappa=atan(R(2,1)/R(2,2));


    
    
    
    
    