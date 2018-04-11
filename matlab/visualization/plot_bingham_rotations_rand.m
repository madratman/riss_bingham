function plot_bingham_rotations_rand(bing, no_of_samples)
%quat*v*quat' is a pure quaternion as well (coz v is pure)

%   Rotate point (1;2;3) around vector (4;5;6) by an angle of pi/2
%     P = [1;2;3];  % create the point
%     V = [4;5;6];  % create vector around which rotation is performed
%     Qrot = qGetRotQuaternion( pi/2, V );
%     P2 = qRotatePoint( P, Qrotate );  
%     
%     Q = [ cos( teta/2 ); v*sin( teta/2 )];

quat = zeros(no_of_samples, 1);
quat = bingham_sample(bing , no_of_samples);
quat = quat';


% size(quat, 2)
% v = rand(3, 1);
% v = [1 0 0; 0 1 0; 0 0 1]';

n=1;
theta=pi*rand(1,n);
phi=2*pi*rand(1,n);
[x,y,z]=sph2cart(theta,phi,0.9);


% slam hacks
% x=0;y=0;z=1;
r= 1.0
x = r*-1/sqrt(2);
y= r*-1/sqrt(3);
z= r*1/sqrt(6);


% v = vector; 
v = [x, y, z]';
v2 = zeros(3, size(quat, 2));

[SX,SY,SZ] = sphere(100);
surf(SX,SY,SZ, 'EdgeColor', 'none', 'FaceAlpha', 1);
% colormap(.5*gray+.5);
colormap(gray);


axis vis3d;
axis equal;

for i = 1:size(quat, 2)   
    v2(:, i) = qRotatePoint(v, quat(:, i));
   
    % cmap = jet;
%     c = cmap(round(1+63*a/(2*pi)), :);
%     plot3(v(1), v(2), v(3), '.', 'MarkerSize', 15, 'Color', c); 
end

hold on 
for i = 1:size(quat, 2)
	plot3(v2(1, i), v2(2, i), v2(3, i), '.', 'MarkerSize', 10, 'Color', 'black'); 
end

theta=pi;
phi=2*pi;
[x,y,z]=sph2cart(theta,phi,ones(1,n));

plot3(v(1), v(2), v(3)+0.1, '.', 'MarkerSize', 50, 'Color', 'c'); 

% plot3(v(1), v(2), v(3), '.', 'MarkerSize', 50, 'Color', 'y'); 

