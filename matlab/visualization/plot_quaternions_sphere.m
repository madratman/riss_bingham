function plot_quaternions_sphere(Q)
% plot_quaternions(Q) -- plots quaternions as an axis/angle chart (Q is
% n-by-4)

%clf;
[SX,SY,SZ] = sphere(30);
lightGrey = 0.8*[1 1 1]; % It looks better if the lines are lighter
% surface(x,y,z,'FaceColor', 'none','EdgeColor',lightGrey)
% surf(SX,SY,SZ, 'EdgeColor', lightGrey, 'FaceAlpha', .3, 'Facecolor', 'none');
surf(SX,SY,SZ,'EdgeColor', 'none','FaceAlpha', .3);
 colormap(.5*gray+.5);

axis vis3d;
axis equal; 


hold on;

for i=1:size(Q,1)

   a = 2*acos(Q(i,1));
   if abs(sin(a/2)) < 1e-10   % no rotation, so pick an arbitrary axis
      v = [1 0 0];
   else
      v = Q(i,2:4) / sin(a/2);
   end
   
    cmap = jet;
    c = cmap(round(1+63*a/(2*pi)), :);
    plot3(v(1), v(2), v(3), '.', 'MarkerSize', 15, 'Color', c); 
    
    
    xlabel( 'x' );
    ylabel( 'y' );
    zlabel( 'z' );
end

az = 135;
el = 30;
view(az, el);
axis vis3d;
axis equal;
set(gcf,'units','normalized','outerposition',[0 0 1 1])

hold off;

fprintf('\n');