clear;
eval_euler
eval_testing
eval_error_classification
for i = 1:6
    if eval(['~isempty(euler_face_' num2str(i) '_init)'])
        eval(['save training_input_face_' num2str(i) '.txt euler_face_' num2str(i) '_init -ASCII;'])
        eval(['save training_target_face_' num2str(i) '.txt euler_face_' num2str(i) '_final -ASCII;'])
        eval(['save testing_input_face_' num2str(i) '.txt euler_face_' num2str(i) '_init_predicted -ASCII;']) 
        eval(['save testing_target_face_' num2str(i) '.txt euler_face_' num2str(i) '_final_predicted_actual -ASCII;']) 
    end
end

 
%%%%%%%%%%%%%%% Run after doing regression in R %%%%%%%%%%%%%%%%%%%%%%
error_cell = [];

for i = 1:6
    eval(['euler_face_' num2str(i) '_final_predicted_in_R = importdata(''testing_predicted_face_' num2str(i) '.csv'');'])
    eval(['euler_face_' num2str(i) '_final_predicted_in_R = euler_face_' num2str(i) '_final_predicted_in_R.data;'])
    eval(['euler_error_' num2str(i) '= euler_face_' num2str(i) '_final_predicted_in_R - euler_face_' num2str(i) '_final_predicted_actual;'])
    
    error_circ_findmax = [];
    eval(['error_circ_findmax = euler_error_' num2str(i) ';'])
    error_circ_findmax = abs(circ_rad2ang(error_circ_findmax));
    
    for j = 1:length(error_circ_findmax)
        if error_circ_findmax(j) > 180
            error_circ_findmax(j) = 360-error_circ_findmax(j);
        end 
    end

    eval(['circ_eval = circ_stats(euler_error_' num2str(i) ');'])
    stats_error(i).mean = circ_rad2ang(circ_eval.mean);
%     stats_error(i).median = circ_rad2ang(circ_eval.median);
%     stats_error(i).var = circ_rad2ang(circ_eval.var);
    stats_error(i).std = circ_rad2ang(circ_eval.std);
    stats_error(i).max = max(error_circ_findmax)
%     stats_error(i).min = min(error_circ_findmax)
%     stats_error(i).skewness = circ_rad2ang(circ_eval.skewness);
%     stats_error(i).kurtosis = circ_rad2ang(circ_eval.kurtosis); 
%     stats_error(i).res_vector_length = circ_r(error_circ);
%     [c,p] = circ_corrcc(actual_circ, predicted_circ);
%     stats_error(i).correlation = c;
%     stats_error(i).correlation_p_value = p;
    clearvars c p;

end



% %%%%%%%%%%%%%%%debugging%%%%%%%%%%%%%%%%%%%%%%%
% test = quaternion(bing_face_6_final.V');
% [t1 t2] = test.AngleAxis
% norm(t2);
% 
% test_2 = quaternion(face_6_final);
% [t3 t4] = test_2.AngleAxis
% plot_quaternions_animate(face_6_final)
% 
% test_3 = quaternion([cos(t3/2)' zeros(1,size(t3,2))' zeros(1,size(t3,2))' sin(t3/2)'])
% % plot_quaternions_animate(from_quaternion_class_to_array(test_3))
% [t5 t6] = test_3.AngleAxis
% 
% test_trans = ldivide(test_2,test_3)
% 
% test_syn_init = quaternion.angleaxis(linspace(0,2*pi,360), repmat([0 0 1],360,1))
% % plot_quaternions_animate(from_quaternion_class_to_array(test_syn_init))
% 
% test_syn_final = quaternion.angleaxis(linspace(0,2*pi,360), repmat([1 0 0],360,1))
% 
% % plot_quaternions_animate(from_quaternion_class_to_array(test_syn_final))
% 
% test_trans = ldivide(test_syn_init, test_syn_final)
% % plot_quaternions_animate(from_quaternion_class_to_array(test_trans
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % global quat_input;
% % quat_input = from_quaternion_class_to_array(test_syn_init);
% 
% t_init = rand(6,1)
% req_var = fmincon(@obj,t_init,[],[],[],[],[],[],@nonlcon)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%Just find the reqd rot Matrix to put the set of quats in Z-frame via
% %%euler angles. 
% 
% clearvars
% generate_data
% test_euler = EulerAngles(quaternion(syn_init_quat), 'xyz');
% test_euler = permute(test_euler,[3 1 2]);
% % test = quaternion.eulerangles('zyx', test_euler) %%verification
% 
% % Now generate quat which corresponds to the 2nd and 3rd column - IN GENERAL, THE SAME
% % TWO euler angles
% test_quat_trans = quaternion.eulerangles('xyz', test_euler(:,1), test_euler(:,2), zeros(size(test_euler, 1),1));
% test_quat_trans = test_quat_trans'; %just do it
% % plot_quaternions_animate(test_quat_trans(1))
% test_quat_trans.EulerAngles('xyz')
% 
% % Verify. Multiply syn_init_quat by inverse of test_quat_trans
% test_quat_trans_inverse = test_quat_trans.inverse;
% 
% for i = 1:size(syn_init_quat, 1)
%     test_parallel_to_Z_axis(i,1) = quaternion(syn_init_quat(i,:)) * test_quat_trans(i);
% end
% 
% test_parallel_euler = test_parallel_to_Z_axis.EulerAngles('xyz')';
% 
% test_parallel_to_Z_axis = from_quaternion_class_to_array(test_parallel_to_Z_axis)
% 
