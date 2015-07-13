	for i = 1:6
		figure;
%         subplot(3,3,i);
		eval(['plot_bingham_3d(bing_syn_cube_face_' num2str(i) ');'])
%         axisvis3d;
    end
