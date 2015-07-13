function plot_quaternions_rotations(quat)
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
% v = [1 0 0; 0 1 0; 0 0 1]';
mid = 1/sqrt(3);
v = [mid mid mid; mid -mid mid; mid mid -mid]';

v2 = zeros(3, size(quat, 2));
v3 = zeros(3, size(quat, 2));
v4 = zeros(3, size(quat, 2));

% [SX,SY,SZ] = sphere(30);
% surf(SX,SY,SZ, 'EdgeColor', 'none', 'FaceAlpha', .3);
% colormap(.5*gray+.5);

% axis vis3d;
% axis equal;
for i = 1:size(quat, 2)   
    v2(:, i) = qRotatePoint(v(:, 1), quat(:, i));
    v3(:, i) = qRotatePoint(v(:, 2), quat(:, i));
    v4(:, i) = qRotatePoint(v(:, 3), quat(:, i));
    % cmap = jet;
%     c = cmap(round(1+63*a/(2*pi)), :);
%     plot3(v(1), v(2), v(3), '.', 'MarkerSize', 15, 'Color', c); 
end
% v4'
% v3'
% v2'
subplot(1, 3, 1)
hold on;
[SX,SY,SZ] = sphere(30);
surf(SX,SY,SZ, 'EdgeColor', 'none', 'FaceAlpha', .3);
colormap(.5*gray+.5);
for i = 1:size(quat, 2)
	plot3(v2(1, i), v2(2, i), v2(3, i), '.', 'MarkerSize', 5); 
end
plot3(v(1, 1), v(2, 1), v(3, 1), '.', 'MarkerSize', 30); 
xlabel( 'x' );
ylabel( 'y' );
zlabel( 'z' );

az = 135;
el = 30;
view(az, el);
axis vis3d;
axis equal;

subplot(1, 3, 2)
hold on; 
[SX,SY,SZ] = sphere(30);
surf(SX,SY,SZ, 'EdgeColor', 'none', 'FaceAlpha', .3);
colormap(.5*gray+.5);
for i = 1:size(quat, 2)
	plot3(v3(1, i), v3(2, i), v3(3, i), '.', 'MarkerSize', 5); 
end
plot3(v(1, 2), v(2, 2), v(3, 2), '.', 'MarkerSize', 30); 
xlabel( 'x' );
ylabel( 'y' );
zlabel( 'z' );

az = 135;
el = 30;
view(az, el);
axis vis3d;
axis equal;

subplot(1,3,3)
hold on;
[SX,SY,SZ] = sphere(30);
surf(SX,SY,SZ, 'EdgeColor', 'none', 'FaceAlpha', .3);
colormap(.5*gray+.5);
for i = 1:size(quat, 2)
	plot3(v4(1, i), v4(2, i), v4(3, i), '.', 'MarkerSize', 5);     
end
plot3(v(1, 3), v(2, 3), v(3, 3), '.', 'MarkerSize', 30); 
xlabel( 'x' );
ylabel( 'y' );
zlabel( 'z' );

az = 135;
el = 30;
view(az, el);
axis vis3d;
axis equal;
set(gcf,'units','normalized','outerposition',[0 0 1 1])

hold off;