addpath('distmesh')

mode    = 'production';

logo = [
    0.0506    0.1404
         0    0.2139
    0.1925    0.3540
    0.0709    0.4935
    0.4616    0.9031
    0.4052    0.5866
    0.3401    0.6426
    0.2040    0.4967
    0.2807    0.4137
    0.6816    0.6998
    0.6324    0.7634
    1.0000    0.8256
    0.8061    0.5216
    0.7612    0.5752
    0.3459    0.3132
    0.3936    0.2179
    0.5789    0.2901
    0.5427    0.3727
    0.8581    0.2955
    0.3401    0.1000
    0.2633    0.2621
    0.0506    0.1404
    0.0506    0.1404];

switch mode
    case 'production'
        dx              = 0.01;
        fh              = @(p) 0.02+abs(dpoly(p,logo))/4;
    case 'debug'
        dx              = 0.1;
        fh              = @(p) (0.5-drectangle(p,0,1,0,1)).^(1.5);
    otherwise
        error('Dude... seriously?')
end

fd              = @(p) drectangle(p,0,1,0,1);
[points,tets]   = distmesh2d(fd, fh, dx, [0,0;1,1], [0,0;0,1;1,0;1,1]);
dlogo           = dpoly(points,logo);
T_pts           = zeros(size(dlogo));
T_pts(dlogo<=0.0) = 1;

figure
trisurf(tets,points(:,1),points(:,2),T_pts,'EdgeColor','k')
title('Initial condition'), xlabel('x'), ylabel('y')
colorbar, clim([0 1]), axis equal tight, view(2)