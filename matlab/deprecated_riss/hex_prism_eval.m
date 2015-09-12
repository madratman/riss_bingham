for i=1:7
  eval(['hex_prism_face_' num2str(i) '= zeros(360,3);'])
end

for i = 1:360
	hex_prism_face_1(i,:) = [0 0 i-1];
end

for j = 2:6
	for i = 1:360
		eval(['hex_prism_face_' num2str(j) '(i, :)= [0 i-1 60*(j-1)];'])
	end
end

for i = 1:360
	hex_prism_face_7(i, :) = [0 90 i-1];
end



for i = 1:7
	eval(['quat_hex_prism_face_' num2str(i) '= eulerToQuaternion(hex_prism_face_' num2str(i) ');'])
end

for i = 1:7
	eval(['bing_hex_prism_face_' num2str(i) '= bingham_fit(quat_hex_prism_face_' num2str(i) ');'])
end

quat_hex_prism_face_net = zeros(360*7, 4);
quat_hex_prism_face_net = [quat_hex_prism_face_1;
                           quat_hex_prism_face_2;
                           quat_hex_prism_face_3;
                           quat_hex_prism_face_4;
                           quat_hex_prism_face_5;
                           quat_hex_prism_face_6;
                           quat_hex_prism_face_7;]
% figure;
% plot_quaternions_length(quat_hex_prism_face_7);