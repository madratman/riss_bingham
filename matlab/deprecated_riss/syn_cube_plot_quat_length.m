for i = 1:6
	figure;
	eval(['plot_quaternions_length(quat_syn_cube_face_' num2str(i) ');'])
end