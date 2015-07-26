	for i = 1:6
		figure;
		eval(['plot_quat_projections(quat_syn_cube_face_' num2str(i) ');'])
    end
    