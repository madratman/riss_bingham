for i = 1:6
    eval(['csvwrite(''quat_syn_cube_face_' num2str(i) '.csv'', quat_syn_cube_face_' num2str(i) ');'])
end
csvwrite('quat_syn_cube_face_all.csv', quat_syn_cube_face_net)
csvwrite('vrep_final_quat.csv', vrep_final_quat)
