for i = 1:6
	eval(['bing_cube_face_' num2str(i) '= bingham_fit(face_' num2str(i) ');'])
end

for i = 1:6
	eval(['bing_cube_face_init_' num2str(i) '= bingham_fit(face_' num2str(i) '_init);'])
end

% bing_cube_face_cluster