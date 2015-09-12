vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
trans = repmat([0.5 0.5 0.5], 8,1)
vert = vert - trans; %translate so that origin is the center of the cube

fac = [1 2 6 5;2 3 7 6;3 4 8 7;4 1 5 8;1 2 3 4;5 6 7 8];
patch('Vertices',vert,'Faces',fac,...
      'FaceVertexCData',hsv(6),'FaceColor','flat')

% These are colors(RGB)
k = [0 0 0] 
m = [1 0 1] 
c = [0 1 1] 
r = [1 0 0] 
g = [0 1 0] 
b = [0 0 1] 
%                Z  -Z   Y   -Y  X   -X
% color_cell = {'k' 'm' 'c' 'r' 'g' 'b'};
% Weird mapping. Don't fuck with it. 
custom = [r;g;c;b;m;k]  
%         -Y X Y -X -Z Z
% For Z up

% For Z down
custom = [r;c;g;b;k;m]  

% flag_plot_type
patch('Vertices',vert,'Faces',fac,...
      'FaceVertexCData',custom,'FaceColor','flat')
 

az = 135;el = 20;
view(az, el);
axis vis3d;
axis equal;
hold on;

starts = zeros(1,3)  % center of the cube
ends = [0 0 -1];  
quiver3(starts(:,1), starts(:,2), starts(:,3), ends(:,1), ends(:,2), ends(:,3), 0);
ends = [0 1 0];  
quiver3(starts(:,1), starts(:,2), starts(:,3), ends(:,1), ends(:,2), ends(:,3), 0);
ends = [1 0 0];  
quiver3(starts(:,1), starts(:,2), starts(:,3), ends(:,1), ends(:,2), ends(:,3), 0);
axis off;
xlabel( 'x' );
ylabel( 'y' );
zlabel( 'z' );
% xlim([-0.5 1])
% ylim([-0.5 1])
% zlim([-0.5 1])
