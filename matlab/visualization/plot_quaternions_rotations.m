function plot_quaternions_rotations(quat, color)
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
%The target is to use a point for which if I plot quat_syn_solid_net,
%I should be able to visualize the distinct patterns for each "cluster" 
% of quaternions corresponding to all orientations of a face 
quat = quat';
% v = [1 0 0; 0 1 0; 0 0 1]';

rt_2 = 1/sqrt(2);
rt_3 = 1/sqrt(3);
rt_6 = 1/sqrt(6);
rt_8 = 1/sqrt(8);
% v = [rt_3 rt_3 rt_3; rt_3 -rt_3 rt_3; rt_3 rt_3 -rt_3]';
% v = [rt_6 rt_3 rt_2; -rt_3 rt_6 -rt_2; rt_2 -rt_3 rt_8] 
v = [rt_6 rt_3 rt_2; -rt_3 rt_2 -rt_6; rt_2 -rt_6 rt_3];
v = v';
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


subplot_1 = subplot(2, 3, 1)
hold on;
[SX,SY,SZ] = sphere(30);
surf(SX,SY,SZ, 'EdgeColor', 'none');
% surf(SX,SY,SZ, 'EdgeColor', 'none', 'FaceAlpha', .3);

% colormap(.5*gray+.5);
% sphere;
colormap(gray)
for i = 1:size(quat, 2)
	if nargin<2
		plot3(v2(1, i), v2(2, i), v2(3, i), '.', 'MarkerSize', 5); 
	else
		plot3(v2(1, i), v2(2, i), v2(3, i), '.', 'MarkerSize', 5, 'color', color); 
	end
end
plot3(v(1, 1), v(2, 1), v(3, 1), '.', 'MarkerSize', 50, 'color', 'y'); 
xlabel( 'x' );
ylabel( 'y' );
zlabel( 'z' );

az = 0; el = 0;
view(az, el);
axis vis3d;
axis equal;
%%%%%%%%%%%%%%%%%%%
subplot_4 = subplot(2,3,4)
copyobj(allchild(subplot_1), subplot_4);
az = 135;el = 20;
view(az, el);
axis vis3d;
axis equal;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot_2 = subplot(2, 3, 2)
hold on; 
[SX,SY,SZ] = sphere(30);
surf(SX,SY,SZ, 'EdgeColor', 'none', 'FaceAlpha', .3);
colormap(.5*gray+.5);
for i = 1:size(quat, 2)
	if nargin<2
		plot3(v3(1, i), v3(2, i), v3(3, i), '.', 'MarkerSize', 5); 
    else
    	plot3(v3(1, i), v3(2, i), v3(3, i), '.', 'MarkerSize', 5, 'color', color); 
	end
end
plot3(v(1, 2), v(2, 2), v(3, 2), '.', 'MarkerSize', 50, 'color', 'y'); 
xlabel( 'x' );
ylabel( 'y' );
zlabel( 'z' );

az = 0; el = 0;
view(az, el);
axis vis3d;
axis equal;
%%%%%%%%%%%%%%%%%%%

subplot_5 = subplot(2,3,5)
copyobj(allchild(subplot_2), subplot_5);
az = 135;el = 20;
view(az, el);
axis vis3d;
axis equal;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot_3 = subplot(2,3,3)
hold on;
[SX,SY,SZ] = sphere(30);
surf(SX,SY,SZ, 'EdgeColor', 'none', 'FaceAlpha', .3);
colormap(.5*gray+.5);
for i = 1:size(quat, 2)
	if nargin<2
		plot3(v4(1, i), v4(2, i), v4(3, i), '.', 'MarkerSize', 5);  
    else
        plot3(v4(1, i), v4(2, i), v4(3, i), '.', 'MarkerSize', 5, 'color', color);
    end
end
plot3(v(1, 3), v(2, 3), v(3, 3), '.', 'MarkerSize', 50, 'color', 'y'); 
xlabel( 'x' );
ylabel( 'y' );
zlabel( 'z' );

az = 0; el = 0;
view(az, el);
axis vis3d;
axis equal;
%%%%%%%%%%%%%%%%%%%
subplot_6 = subplot(2,3,6)
copyobj(allchild(subplot_3), subplot_6);
az = 135;el = 20;
view(az, el);
axis vis3d;
axis equal;

set(gcf,'units','normalized','outerposition',[0 0 1 1])

hold off;