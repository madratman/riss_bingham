function plot_bingham_rotations(bing, no_of_samples, color)
%quat*v*quat' is a pure quaternion as well (coz v is pure)

%   Rotate point (1;2;3) around vector (4;5;6) by an angle of pi/2
%     P = [1;2;3];  % create the point
%     V = [4;5;6];  % create vector around which rotation is performed
%     Qrot = qGetRotQuaternion( pi/2, V );
%     P2 = qRotatePoint( P, Qrotate );  
%     
%     Q = [ cos( teta/2 ); v*sin( teta/2 )];

quat = zeros(no_of_samples, 1);
quat = bingham_sample(bing, no_of_samples);
if nargin<3
	plot_quaternions_rotations(quat)
else
	plot_quaternions_rotations(quat, color)
end