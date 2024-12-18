A=zeros(size(t2t));
alpha=0.005;
dt=0.05;
for i=1:size(t2t,1)
    N1=t2t(i,1);
    N2=t2t(i,2);
    N3=t2t(i,3);
    Vp=V(i);
    F1=t2f(i,1);
    F2=t2f(i,2);
    F3=t2f(i,3);
    sf1=magSf(F1);
    sf2=magSf(F2);
    sf3=magSf(F3);
    cc=num2cell(C(i,:));
    [x,y]=cc{1,[1 2]};
    if N1~=0
    cc=num2cell(C(N1,:));
    [x1,y1]=cc{1,[1 2]};
    end
    if N2~=0
    cc=num2cell(C(N2,:));
    [x2,y2]=cc{1,[1 2]};
    end
    if N3~=0
    cc=num2cell(C(N3,:));
    [x3,y3]=cc{1,[1 2]};
    end
    if N1==0
        sf1=0;
        
    end
    if N2==0
        sf2=0;
    end
    if N3==0
        sf3=0;
    end
    if N1~=0
    d1=sqrt((x-x1)^2+(y-y1)^2);
    end
    if N2~=0
    d2=sqrt((x-x1)^2+(y-y1)^2);
    end
    if N3~=0
    d3=sqrt((x-x1)^2+(y-y1)^2);
    end
        
    A(i,i)=(1+alpha*dt*sf1/(Vp*d1)+alpha*dt*sf2/(Vp*d2)+alpha*dt*sf3/(Vp*d3));
    if N1~=0
    A(i,N1)=(-alpha*dt*sf1/(Vp*d1));
    end
    if N2~=0
    A(i,N2)=(-alpha*dt*sf2/(Vp*d2));
    end
    if N3~=0
    A(i,N3)=(-alpha*dt*sf3/(Vp*d3));
    end
end
T_value=T;
T_next=zeros(size(T,1),1);
n=0;
figure(1)
title('Implicit Euler using FVM','Fontsize',20)
xlabel(x)
ylabel(y)
%[xx,yy]=ndgrid(C(:,1),C(:,2));
while n<=0.5
    Tplot=zeros(size(T,1));
    T_next=A\T_value;
    n=n+dt;
    scatter(C(:,1),C(:,2),230,T_next,'filled')
    colorbar()
    drawnow
    T_value=T_next;
end

