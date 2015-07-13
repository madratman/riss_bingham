	for i = 1:7
		figure;
		eval(['plot_bingham_3d_projections(bing_hex_prism_face_' num2str(i) ');'])
    end
    