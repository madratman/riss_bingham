for i=1:6
  eval(['syn_cube_face_' num2str(i) '= zeros(360,3);'])
end

for i = 1:360
	syn_cube_face_1(i,:) = [0 0 i-1];
end

%tip over to left
for i = 1:360
	syn_cube_face_2(i,:) = [i-1 90 0];
end

%tip over to right
for i = 1:360
	syn_cube_face_3(i,:) = [i-1 -90 0];
end


for i = 1:360
	syn_cube_face_4(i,:) = [i-1 0 180];
end

for i = 1:360
	syn_cube_face_5(i,:) = [i-1 0 90];
end

for i = 1:360
	syn_cube_face_6(i,:) = [i-1 0 -90];
end


for i = 1:6
	eval(['quat_syn_cube_face_' num2str(i) '= eulerToQuaternion(syn_cube_face_' num2str(i) ');'])
end

for i = 1:6
	eval(['bing_syn_cube_face_' num2str(i) '= bingham_fit(quat_syn_cube_face_' num2str(i) ');'])
end

quat_syn_cube_face_net = zeros(360*6, 4);
quat_syn_cube_face_net = [quat_syn_cube_face_1;
                           quat_syn_cube_face_2;
                           quat_syn_cube_face_3;
                           quat_syn_cube_face_4;
                           quat_syn_cube_face_5;
                           quat_syn_cube_face_6;
                           ]
bing_syn_cluster = [bing_syn_cube_face_1;
                     bing_syn_cube_face_2;
                     bing_syn_cube_face_3;
                     bing_syn_cube_face_4;
                     bing_syn_cube_face_5;
                     bing_syn_cube_face_6]
bing_syn_cluster = bing_syn_cluster';
% figure;
% plot_quaternions_length(quat_syn_cube_face_7);