for i = 1:360
    quat_class_syn_hex_face_1(i) = quaternion.eulerangles('123', 0, 0, (i-1)*pi/180);
    quat_class_syn_hex_face_2(i) = quaternion.eulerangles('123', 0, (i-1)*pi/180, 60*pi/180);  
%     quat_class_syn_cube_face_3(i) = quaternion.eulerangles('123', (i-1)*pi/180, -90*pi/180, 0);  
%     quat_class_syn_cube_face_4(i) = quaternion.eulerangles('123', (i-1)*pi/180, 0, 180*pi/180);  
%     quat_class_syn_cube_face_5(i) = quaternion.eulerangles('123', (i-1)*pi/180, 0, 90*pi/180);  
%     quat_class_syn_cube_face_6(i) = quaternion.eulerangles('123', (i-1)*pi/180, 0, -90*pi/180);  
end
% quat_class_syn_hex_face_2.PlotRotation(1e-7);
for i = 2:2
    eval(['vec = vector(quat_class_syn_hex_face_' num2str(i) ');'])
    vec = permute(vec, [3 1 2]);
    eval(['re = real(quat_class_syn_hex_face_' num2str(i) ');'])
    re = re';
    eval(['quat_syn_hex_face_' num2str(i) '= [re vec];']);
    eval(['bing_syn_hex_face_' num2str(i) '= bingham_fit(quat_syn_hex_face_' num2str(i) ');'])
end

% % quat_syn_cube_face_net = zeros(360*6, 4);
% % quat_syn_cube_face_net = [quat_syn_cube_face_1;
% %                            quat_syn_cube_face_2;
% %                            quat_syn_cube_face_3;
% %                            quat_syn_cube_face_4;
% %                            quat_syn_cube_face_5;
% %                            quat_syn_cube_face_6;
% %                            ]
% % bing_syn_cluster = [bing_syn_cube_face_1;
% %                      bing_syn_cube_face_2;
% %                      bing_syn_cube_face_3;
% %                      bing_syn_cube_face_4;
% %                      bing_syn_cube_face_5;
% %                      bing_syn_cube_face_6]
% % bing_syn_cluster = bing_syn_cluster';