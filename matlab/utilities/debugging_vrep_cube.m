v = [0 0 1]';
rt_2 = 1/sqrt(2);
rt_8 = 1/sqrt(8);
v = [0.5 -0.5 rt_2]'
v = [0.25 -0.25 sqrt(7)*rt_8]'
test_quat = quat_syn_vrep_cube_face_6';
v2 = zeros(3, size(test_quat, 2));

for i = 1:size(test_quat, 2)   
%     test_quat(:, i
    v2(:, i) = qRotatePoint(v(:, 1), test_quat(:, i))
end

hold on;
[SX,SY,SZ] = sphere(30);
surf(SX,SY,SZ, 'EdgeColor', 'none', 'FaceAlpha', .3);
colormap(.5*gray+.5);
for i = 1:size(test_quat, 2)
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