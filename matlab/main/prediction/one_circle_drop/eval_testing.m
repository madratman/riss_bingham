testing_init_quat = init_quat(ninety_percent:end, :);
testing_final_quat = final_quat(ninety_percent:end, :);

% function eval_probabilities(quat)
for i = 1:6
    i
    eval(['prob_face_init_' num2str(i) '= zeros(size(testing_init_quat,1),1);']);
    if eval(['~isempty(bing_face_' num2str(i) '_init)'])   
        for j = 1:length(testing_init_quat)
            eval(['prob_face_init_' num2str(i) '(j) = bingham_pdf(testing_init_quat(j,:), bing_face_' num2str(i) '_init);'])
        end
    else 
        eval(['prob_face_init_' num2str(i) ' = zeros(size(testing_init_quat,1),1);'])
    end
end

prob_face_init_net = [prob_face_init_1 prob_face_init_2 prob_face_init_3 prob_face_init_4 prob_face_init_5 prob_face_init_6];


for i = 1:size(testing_init_quat,1)
    [values(i,1) index(i,1)]= max(prob_face_init_net(i,:));  
end

for i = 1:6
    eval(['face_' num2str(i) '_init_predicted= [];'])
    eval(['face_' num2str(i) '_final_predicted_actual = [];'])
end

for i = 1:size(testing_init_quat,1)
    switch index(i)
        case 1
            face_1_init_predicted = [face_1_init_predicted; testing_init_quat(i,:)];
            face_1_final_predicted_actual = [face_1_final_predicted_actual; testing_final_quat(i,:)];
        case 2
            face_2_init_predicted = [face_2_init_predicted; testing_init_quat(i,:)];
            face_2_final_predicted_actual = [face_2_final_predicted_actual; testing_final_quat(i,:)];
        case 3
            face_3_init_predicted = [face_3_init_predicted; testing_init_quat(i,:)];
            face_3_final_predicted_actual = [face_3_final_predicted_actual; testing_final_quat(i,:)];
        case 4
            face_4_init_predicted = [face_4_init_predicted; testing_init_quat(i,:)];
            face_4_final_predicted_actual = [face_4_final_predicted_actual; testing_final_quat(i,:)];
        case 5
            face_5_init_predicted = [face_5_init_predicted; testing_init_quat(i,:)];
            face_5_final_predicted_actual = [face_5_final_predicted_actual; testing_final_quat(i,:)];
        case 6
            face_6_init_predicted = [face_6_init_predicted; testing_init_quat(i,:)];
            face_6_final_predicted_actual = [face_6_final_predicted_actual; testing_final_quat(i,:)];
    end
end


for i = 1:6
    
    eval(['euler_face_' num2str(i) '_init_predicted = EulerAngles(quaternion(face_' num2str(i) '_init_predicted), ''xyz'');'])
    % Same convention for initial orientations!!
    
    if(i==1| i==2)
        eval(['euler_face_' num2str(i) '_final_predicted_actual = EulerAngles(quaternion(face_' num2str(i) '_final_predicted_actual), ''zyx'');'])
    elseif(i==3|i==4)
        eval(['euler_face_' num2str(i) '_final_predicted_actual = EulerAngles(quaternion(face_' num2str(i) '_final_predicted_actual), ''xyz'');'])
    elseif(i==5|i==6)
        eval(['euler_face_' num2str(i) '_final_predicted_actual = EulerAngles(quaternion(face_' num2str(i) '_final_predicted_actual), ''xzx'');'])
    end

    eval(['euler_face_' num2str(i) '_init_predicted = permute(euler_face_' num2str(i) '_init_predicted,[3 1 2]);'])
    eval(['euler_face_' num2str(i) '_final_predicted_actual = permute(euler_face_' num2str(i) '_final_predicted_actual,[3 1 2]);'])
end

    
% for i = 1:6
%     figure;
%     eval(['plot_quaternions_rotations(face_' num2str(i) '_init_predicted);'])
% end