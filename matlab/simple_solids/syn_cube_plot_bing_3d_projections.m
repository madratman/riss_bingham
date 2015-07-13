	for i = 1:6
		figure;
		eval(['plot_bingham_3d_projections(bing_syn_cube_face_' num2str(i) ');'])
    end
    