function plot_quaternions_rotations_rand(quat, vector)
%quat*v*quat' is a pure quaternion as well (coz v is pure)

%   Rotate point (1;2;3) around vector (4;5;6) by an angle of pi/2
%     P = [1;2;3];  % create the point
%     V = [4;5;6];  % create vector around which rotation is performed
%     Qrot = qGetRotQuaternion( pi/2, V );
%     P2 = qRotatePoint( P, Qrotate );  
%     
%     Q = [ cos( teta/2 ); v*sin( teta/2 )];


% size(quat, 2)
% v = rand(3, 1);
quat = quat';

if nargin  ==1 
n=1;
theta=pi*rand(1,n);
phi=2*pi*rand(1,n);
[x,y,z]=sph2cart(theta,phi,ones(1,n));

v = [x, y, z]';
v2 = zeros(3, size(quat, 2));


[SX,SY,SZ] = sphere(30);
surf(SX,SY,SZ, 'EdgeColor', 'none', 'FaceAlpha', .3);
colormap(.5*gray+.5);

for i = 1:size(quat, 2)   
    v2(:, i) = qRotatePoint(v, quat(:, i));
   
    % cmap = jet;
%     c = cmap(round(1+63*a/(2*pi)), :);
%     plot3(v(1), v(2), v(3), '.', 'MarkerSize', 15, 'Color', c); 
end

hold on 
for i = 1:size(quat, 2)
	plot3(v2(1, i), v2(2, i), v2(3, i), '.', 'MarkerSize', 5); 
end

plot3(v(1), v(2), v(3), '.', 'MarkerSize', 30); 

az = 135;
el = 30;
view(az, el);
axis vis3d;
axis equal;
set(gcf,'units','normalized','outerposition',[0 0 1 1])
end

if nargin == 2
    v = vector;
    v2 = zeros(3, size(quat, 2));


[SX,SY,SZ] = sphere(30);
surf(SX,SY,SZ, 'EdgeColor', 'none', 'FaceAlpha', .3);
colormap(.5*gray+.5);

for i = 1:size(quat, 2)   
    v2(:, i) = qRotatePoint(v, quat(:, i));
   
    % cmap = jet;
%     c = cmap(round(1+63*a/(2*pi)), :);
%     plot3(v(1), v(2), v(3), '.', 'MarkerSize', 15, 'Color', c); 
end

hold on 
for i = 1:size(quat, 2)
	plot3(v2(1, i), v2(2, i), v2(3, i), '.', 'MarkerSize', 5); 
end

plot3(v(1), v(2), v(3), '.', 'MarkerSize', 30); 

az = 135;
el = 30;
view(az, el);
axis vis3d;
axis equal;
set(gcf,'units','normalized','outerposition',[0 0 1 1])
xlabel( 'x' );
            ylabel( 'y' );
            zlabel( 'z' );
end
