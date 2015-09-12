% q = quaternion.eulerangles(axes,ang1,ang2,ang3)
% These angles are yaw pitch roll => z y x. Yaw is applied first, then pitch
% and finally roll. 
% In all rotation operations, the rotations operate from left to right on
% 3x1 column vectors and create rotated vectors, not representations of
% those vectors in rotated coordinate systems.
% For Euler angles, '123' means rotate the vector about x first, about y
% second, about z third, i.e.:
% vp = rotate(z,angle(3)) * rotate(y,angle(2)) * rotate(x,angle(1)) * v
for i = 1:360    
    quat_class_syn_cube_face_1(i) = quaternion.eulerangles('321', (i-1)*pi/180, 0, 0);
    quat_class_syn_cube_face_2(i) = quaternion.eulerangles('321', (i-1)*pi/180, 90*pi/180, 0);  
    quat_class_syn_cube_face_3(i) = quaternion.eulerangles('321', (i-1)*pi/180, -90*pi/180, 0);  
    quat_class_syn_cube_face_4(i) = quaternion.eulerangles('321', (i-1)*pi/180, 0, 90*pi/180);  
    quat_class_syn_cube_face_5(i) = quaternion.eulerangles('321', (i-1)*pi/180, 0, 180*pi/180);  
    quat_class_syn_cube_face_6(i) = quaternion.eulerangles('321', (i-1)*pi/180, 0, -90*pi/180);  
end

for i = 1:6
    eval(['vec = vector(quat_class_syn_cube_face_' num2str(i) ');'])
    vec = permute(vec, [3 1 2]);
    eval(['re = real(quat_class_syn_cube_face_' num2str(i) ');'])
    re = re';
    eval(['quat_syn_cube_face_' num2str(i) '= [re vec];']);
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
quat_syn_cube_cluster = {quat_syn_cube_face_1,
    quat_syn_cube_face_2,
    quat_syn_cube_face_3,
    quat_syn_cube_face_4,
    quat_syn_cube_face_5,
    quat_syn_cube_face_6};

bing_syn_cluster = [bing_syn_cube_face_1;
                     bing_syn_cube_face_2;
                     bing_syn_cube_face_3;
                     bing_syn_cube_face_4;
                     bing_syn_cube_face_5;
                     bing_syn_cube_face_6]
bing_syn_cluster = bing_syn_cluster';