function [T_p] = t2p(T,tets,points,C)
    T_p=zeros(size(points,1),1);
    for jj=1:size(points,1)
        cc=num2cell(points(jj,:));
        [p1,q1]=cc{1,[1 2]}; %%calculating coordinates of each point
        [aa,bb]=find(tets==jj);%%calculating cells that has this point as its vertices.
        siz=size(aa,1);
        d=zeros(siz,1);
        % calculating distances
        for i=siz
            cc=num2cell(C(aa(i),:));
            [x11,y11]=cc{1,[1 2]};%% coordinates of cell centroid that has this point in common
            d(i)=sqrt((x11-p1)^2+(y11-q1)^2);
        end
        dd=sum(d);
        for i=1:siz
            T_p(jj)=T_p(jj)+d(i)*T(aa(i));
        end
        T_p(jj)=T_p(jj)/dd;
    end
end
