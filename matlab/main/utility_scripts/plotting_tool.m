% TODO INCOMPLETE
function plotting_tool(solid_name, plot_what)
	plot_quaternions_length(quat_square_pyr_eq_triangle_face_1);
	
	if solid_name == 'sq_pyr'

		if plot_what == 'quat'	
			for i = 1:5
			figure;
			eval(['plot_quaternions_length(quat_square_pyr_eq_triangle_face_' num2str(i) ');'])
			end

		elseif plot_what == 'bing'
			for i = 1:5
			figure;
			eval(['plot_bingham_3d(bing_square_pyr_eq_triangle_face_' num2str(i) ');'])
			end
		end

	elseif solid_name == 'hex_prism'
		
		if plot_what == 'quat'	
			for i = 1:7
			figure;
			eval(['plot_quaternions_length(quat_hex_prism_face_' num2str(i) ');'])
			end

		elseif plot_what == 'bing'
			for i = 1:7
			figure;
			eval(['plot_bingham_3d(bing_hex_prism_face_' num2str(i) ');'])
			end
		end

	end
