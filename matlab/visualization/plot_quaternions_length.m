function [angle, direction] = plot_quaternions_length(Q)
% plot_quaternions(Q) -- plots quaternions as an axis/angle chart (Q is
% n-by-4)

clf;
angle = [];
direction = [];

% [SX,SY,SZ] = sphere(30);
% surf(SX,SY,SZ, 'EdgeColor', 'none', 'FaceAlpha', .3);
% colormap(.5*gray+.5);


hold on;
origin  = zeros(1000, 3);
for i=1:size(Q,1)
   a = 2*acos(Q(i,1));  
   if abs(sin(a/2)) < 1e-10   % no rotation, so pick an arbitrary axis
      fprintf('.');
      v = [1 0 0]; 
   else
      v = Q(i,2:4) / sin(a/2);
   end
   
   angle = [angle; a];
   direction = [direction; v];
%    cmap = jet;
%    c = cmap(round(1+63*a/(2*pi)), :);
%  
   starts = zeros(1,3);
   ends = (v.*a)/2;
%    ends = v; 
   quiver3(starts(:,1), starts(:,2), starts(:,3), ends(:,1), ends(:,2), ends(:,3), 0);
      xlabel( 'x' );
            ylabel( 'y' );
            zlabel( 'z' );
end
% axis image;
% hold off;
az=135;
el = 30;

view(az, el);
axis vis3d;
axis equal;

fprintf('\n');