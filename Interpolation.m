figure

subplot(1,3,1)
trisurf(tets,points(:,1),points(:,2),zeros(nPoints,1),'EdgeColor','k','FaceColor','w'), hold on
scatter(points(:,1),points(:,2),30,T_pts,'filled')
title('Original points data...'), xlabel('x'), ylabel('y')
colorbar, clim([0 1]), axis equal tight, view(2)

subplot(1,3,2)
T_center    = p2t(T_pts,tets,points,C);
trisurf(tets,points(:,1),points(:,2),zeros(nPoints,1),'EdgeColor','k','FaceColor','w'), hold on
scatter(C(:,1),C(:,2),30,T_center,'filled')
title('... interpolated to cell centers...'), xlabel('x'), ylabel('y')
colorbar, clim([0 1]), axis equal tight, view(2)

subplot(1,3,3)
T_pts_interp    = t2p(T_center,tets,points,C);
trisurf(tets,points(:,1),points(:,2),zeros(nPoints,1),'EdgeColor','k','FaceColor','w'), hold on
scatter(points(:,1),points(:,2),30,T_pts_interp,'filled')
title('... and back to points!'), xlabel('x'), ylabel('y')
colorbar, clim([0 1]), axis equal tight, view(2)