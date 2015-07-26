for i = 1:6
	figure;
	eval(['plot_quaternions_length(quat_hex_prism_face_' num2str(i) ');'])
end