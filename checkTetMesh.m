function [] = checkTetMesh(points,tets,faces,C,Cf,Sf,t2t,t2f)
% OTS 2022

nTets   = length(tets);
nFaces  = length(faces);
nPoints = length(points);

figure
title('mesh')
patch( 'vertices', points, 'faces', tets, 'FaceColor', 'none', 'EdgeColor', 0.8*[1 1 1])
hold on
plot(Cf(:,1),Cf(:,2),'+','Color',0.5*[1 1 1]);
text(Cf(:,1),Cf(:,2),num2str((1:nFaces)'),'Color',0.5*[1 1 1],'VerticalAlignment','bottom');
plot(11 2C(:,1),C(:,2),'m.','MarkerSize',5)
text(C(:,1),C(:,2),num2str((1:nTets)'),'Color','m','VerticalAlignment','bottom');
plot(points(:,1),points(:,2),'cx','MarkerSize',5)
text(points(:,1)+0.01,points(:,2),num2str((1:nPoints)'),'Color','c')
xlabel('$x$'), ylabel('$y$')
axis equal tight

i = input('Cell # to show? ');
if mod(i,1)==0
    patch( 'vertices', points, 'faces', tets(i,:), 'FaceColor', 0.9*[1 1 1], 'EdgeColor', 'none')
    plot(C(i,1),C(i,2),'m.','MarkerSize',5)
    text(C(i,1),C(i,2),num2str(i),'Color','m','VerticalAlignment','bottom');
    C_this      = C(i,:);
    colors      = {'r',[0 0.5 0],'b'};
    for j=1:3
        face_j          = t2f(i,j);
        points_face_j   = points(faces(face_j,:),:);
        plot(points_face_j(:,1),points_face_j(:,2),'Color',colors{j})
        
        plot(Cf(t2f(i,j),1),Cf(t2f(i,j),2),'+','Color',colors{j});
        
        t2t_neighbor  = t2t(i,j);
        if t2t_neighbor~=0
            p_neighbor    = C(t2t(i,j),:);
            quiver(C_this(1),C_this(2),[p_neighbor(1)-C_this(1)],[p_neighbor(2)-C_this(2)],'Color',colors{j},'MaxHeadSize',0.5)
        end
        C_neighbor  = Cf(t2f(i,j),:);
        d           = [C_neighbor(1)-C_this(1); C_neighbor(2)-C_this(2)];
        quiver(C_this(1),C_this(2),d(1),d(2),'Color',colors{j},'MaxHeadSize',0.5)
        quiver(Cf(t2f(i,j),1),Cf(t2f(i,j),2),Sf(t2f(i,j),1),Sf(t2f(i,j),2),'Color',colors{j},'MaxHeadSize',0.5,'LineStyle',':')
        
        text(Cf(t2f(i,j),1),Cf(t2f(i,j),2),num2str(t2f(i,j)),'Color',colors{j},'VerticalAlignment','bottom');
    end
end