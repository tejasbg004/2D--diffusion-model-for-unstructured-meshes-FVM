function [T] = p2t(T_pts,tets,points,C)
        T=zeros(size(tets,1),1);
    for i=1:size(tets,1)
        l=1;
        cc=num2cell(points(tets(i,l),:));
        [x1,y1]=cc{1,[1 2]};
        cc=num2cell(points(tets(i,l+1),:));
        [x2,y2]=cc{1,[1 2]};
        cc=num2cell(points(tets(i,l+2),:));
        [x3,y3]=cc{1,[1 2]};
        
        x=C(i,1);
        y=C(i,2);

        d1=sqrt((x1-x)^2+(y1-y)^2);
        d2=sqrt((x2-x)^2+(y2-y)^2);
        d3=sqrt((x3-x)^2+(y3-y)^2);
        d=d1+d2+d3;
        cc=num2cell(tets(i,:));
        [a1,b1,c1]=cc{1,[1 2 3]};

        T(i)=(T_pts(a1)*d1+T_pts(b1)*d2+T_pts(c1)*d3)/d;
    end