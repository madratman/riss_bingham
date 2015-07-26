	for i = 1:7
		figure;
%         subplot(3,3,i);
		eval(['plot_bingham_3d(bing_hex_prism_face_' num2str(i) ');'])
%         axisvis3d;
    end
