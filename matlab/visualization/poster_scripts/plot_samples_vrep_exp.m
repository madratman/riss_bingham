for i= 1:6
%     figure
%     eval(['plot_quaternions_rotations(face_init_' num2str(i) '_BMM_samples);'])
%     figure
%     eval(['plot_quaternions_rotations(face_final_' num2str(i) '_BMM_samples);'])
    figure
    eval(['plot_quaternions_rotations(face_' num2str(i) '_init);'])

end
