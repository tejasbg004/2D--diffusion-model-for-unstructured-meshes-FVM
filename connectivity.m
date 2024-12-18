%npoints
nPoints=size(points,1);
%nTets
nTets=size(tets,1);
%faces
faces=zeros(1,2);
n=1;
for k=1:size(tets,1)
    faces(n,:)=tets(k,1:2);
    n=n+1;
    faces(n,:)=tets(k,2:3);
    n=n+1;
    faces(n,:)=tets(k,[1 3]);
    n=n+1;
end

[idx,idx]=unique(sort(faces')','rows','stable');
faces1=faces(idx,:);
            %faces1=unique(faces1,"rows");
faces=faces1;
%nFaces
nFaces=size(faces,1);
%C
C=zeros(size(tets,1),2);
for k=1:size(tets,1)
    l=1;
    cc=num2cell(points(tets(k,l),:));
    [x1,y1]=cc{1,[1 2]};
    cc=num2cell(points(tets(k,l+1),:));
    [x2,y2]=cc{1,[1 2]};
    cc=num2cell(points(tets(k,l+2),:));
    [x3,y3]=cc{1,[1 2]};
    C(k,1)=(x1+x2+x3)/3;
    C(k,2)=(y1+y2+y3)/3;
end
%V
V=zeros(size(tets,1),1);
for k=1:size(tets,1)
    l=1;
    cc=num2cell(points(tets(k,l),:));
    [x1,y1]=cc{1,[1 2]};
    cc=num2cell(points(tets(k,l+1),:));
    [x2,y2]=cc{1,[1 2]};
    cc=num2cell(points(tets(k,l+2),:));
    [x3,y3]=cc{1,[1 2]};
    V(k)=(1/2)*(x1*(y2 - y3) + x2*(y3 - y1) + x3*(y1 - y2));
end
%Cf
Cf=zeros(size(faces,1),2);
for k=1:size(faces,1)
    l=1;
    cc=num2cell(points(faces(k,l),:));
    [x1,y1]=cc{1,[1 2]};
    cc=num2cell(points(faces(k,l+1),:));
    [x2,y2]=cc{1,[1 2]};
    Cf(k,1)=(x1+x2)/2;
    Cf(k,2)=(y1+y2)/2;
end
%Sf
Sf=zeros(size(faces,1),2);
for k=1:size(faces,1)
    l=1;
    cc=num2cell(points(faces(k,l),:));
    [x1,y1]=cc{1,[1 2]};
    cc=num2cell(points(faces(k,l+1),:));
    [x2,y2]=cc{1,[1 2]};
    Sf(k,1)=(y2-y1);
    Sf(k,2)=(x1-x2);
end
%magSf
magSf=zeros(size(faces,1),1);
for k=1:size(faces,1)
    l=1;
    cc=num2cell(points(faces(k,l),:));
    [x1,y1]=cc{1,[1 2]};
    cc=num2cell(points(faces(k,l+1),:));
    [x2,y2]=cc{1,[1 2]};
    magSf(k)=sqrt((x2-x1)^2+(y2-y1)^2);
end
%t2t
t2t=zeros(size(tets,1),3);
for ii=1:size(tets,1)
    cc=num2cell(tets(ii,:));
    [a1,b1,c1]=cc{1,[1 2 3]};
    for k=1:size(tets,1)
        count=0;
        if k==ii
            continue
        end
        cc=num2cell(tets(k,:));
        [a2,b2,c2]=cc{1,[1 2 3]};
        if a1==a2|| a1==b2 ||a1==c2
            count=count+1;
        end
        if b1==a2 ||b1==b2 ||b1==c2
            count=count+1;
        end
        if c1==a2|| c1==b2||c1==c2
            count=count+1;
        end
       if count>=2
            if t2t(ii,1)==0
                t2t(ii,1)=k;
            elseif t2t(ii,2)==0
                t2t(ii,2)=k;
            else
                t2t(ii,3)=k;
            end
        end
    end
end
%t2f
t2f=zeros(size(tets,1),3);
for ii=1:size(tets,1)
    cc=num2cell(tets(ii,:));
    [a1,b1,c1]=cc{1,[1 2 3]};
    for k=1:size(faces,1)
        cc=num2cell(faces(k,:));
        [a2,b2]=cc{1,[1 2]};
        count=0;
        
        if a1==a2 ||a1==b2
            count=count+1;
        end
        if b1==a2 ||b1==b2
            count=count+1;
        end
        if c1==a2 ||c1==b2
            count=count+1;
        end
        if count>=2
            if t2f(ii,1)==0
                t2f(ii,1)=k;
            elseif t2f(ii,2)==0
                t2f(ii,2)=k;
            else
                t2f(ii,3)=k;
            end
        end
    end
end

   