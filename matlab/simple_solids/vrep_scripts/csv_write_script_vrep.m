% [face_1, face_2, face_3, face_4, face_5, face_6, face_1_init, face_2_init, face_3_init, face_4_init, face_5_init, face_6_init,total] = classify_quat_orientation(init_quat_clean, final_quat_clean, 0)
mkdir(strcat('data/cuboid/', datestr(now, 30)));
right_now = datestr(now, 30);
for i = 1:6
    csvwrite(strcat('data/cuboid/', right_now, '/cuboid_face_', num2str(i), '_init.csv'), eval(strcat('face_', num2str(i),'_init')));
end

for i = 1:6
    csvwrite(strcat('data/cuboid/', right_now, '/cuboid_face_', num2str(i), '_final.csv'), eval(strcat('face_', num2str(i))));
end

