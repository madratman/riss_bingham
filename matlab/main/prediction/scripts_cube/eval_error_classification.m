% This is a lame ass way to compare quaternions
% Ideally we should find the distance between them and 
% use a threshold
% TODO
% Also, the "total" variable can be used to compare. 
% For face 6, we have 756/756. 
for i = 1:6
    eval(['face_' num2str(i) '_init_predicted = round(face_' num2str(i) '_init_predicted, 4);'])
    eval(['face_' num2str(i) '_final_predicted_actual = round(face_' num2str(i) '_final_predicted_actual, 4);'])
    eval(['[pred_face_' num2str(i) '_as_1_final_actual, pred_face_' num2str(i) '_as_2_final_actual, pred_face_' num2str(i) '_as_3_final_actual, pred_face_' num2str(i) '_as_4_final_actual, pred_face_' num2str(i) '_as_5_final_actual, pred_face_' num2str(i) '_as_6_final_actual, pred_face_' num2str(i) '_as_1_init, pred_face_' num2str(i) '_as_2_init, pred_face_' num2str(i) '_as_3_init, pred_face_' num2str(i) '_as_4_init, pred_face_' num2str(i) '_as_5_init, pred_face_' num2str(i) '_as_6_init, total] = classify_quat_orientation_cube(face_' num2str(i) '_init_predicted, face_' num2str(i) '_final_predicted_actual);'])
end

% No of samples from bing_uniform = 5000
% Following is for face_i (i=1:6)
% lhs -> no of "classified_quats" 
% rhs -> no of orig_quats in the test sample
%    887 --> 887
%    889 --> 889
%    785 --> 786
%    825 --> 825
%    855 --> 857
%    756 --> 756
% So I failed to EVEN account for 0+0+1+0+2+0=3 out of 5000 
% predictions, which is OK for now. 
% But not in the longer run

% Generate a 6*6 Latex table for
% Confusion Matix
% Actual classes are in rows --> i 
% Predict classes are in cols --> j
% Use init/final. Doesn't matter. 
% 7th row/col is cumulative
confusion_matrix = zeros(6,6);
for i = 1:6
    for j = 1:6
        eval(['confusion_matrix(i,j) = size(pred_face_' num2str(i) '_as_' num2str(j) '_init, 1);'])
    end
end        



%Testing data. Evaluate only for quats which were correctly classified.
for i = 1:6
i
    if eval(['~isempty(pred_face_' num2str(i) '_as_' num2str(i) '_init)']) 

	    eval(['euler_face_' num2str(i) '_init_predicted = EulerAngles(quaternion(pred_face_' num2str(i) '_as_' num2str(i) '_init), ''xyz'');'])
	    % eval(['euler_face_' num2str(i) '_init_predicted = EulerAngles(quaternion(pred_face_' num2str(i) '_as_' num2str(j) '_init), ''zyx'');'])
	    % eval(['euler_face_' num2str(i) '_init_predicted = EulerAngles(quaternion(pred_face_' num2str(i) '_as_' num2str(j) '_init), ''xzx'');'])
	    % Same convention for initial orientations!!
	    % Warning. Customize init convention for different cases! 
	    eval(['euler_face_' num2str(i) '_init_predicted = permute(euler_face_' num2str(i) '_init_predicted,[3 1 2]);'])

	    %xyz
	    eval(['euler_face_' num2str(i) '_init_predicted = euler_face_' num2str(i) '_init_predicted(:,3);'])

	    %zyx / xzx
	    % eval(['euler_face_' num2str(i) '_init_predicted = euler_face_' num2str(i) '_init_predicted(:,1);'])


	    if(i==1| i==2)
	        eval(['euler_face_' num2str(i) '_final_predicted_actual = EulerAngles(quaternion(pred_face_' num2str(i) '_as_' num2str(i) '_final_actual), ''zyx'');'])
	    elseif(i==3|i==4)
	        eval(['euler_face_' num2str(i) '_final_predicted_actual = EulerAngles(quaternion(pred_face_' num2str(i) '_as_' num2str(i) '_final_actual), ''xyz'');'])
	    elseif(i==5|i==6)
	        eval(['euler_face_' num2str(i) '_final_predicted_actual = EulerAngles(quaternion(pred_face_' num2str(i) '_as_' num2str(i) '_final_actual), ''xzx'');'])
	    end

	    

	    eval(['euler_face_' num2str(i) '_final_predicted_actual = permute(euler_face_' num2str(i) '_final_predicted_actual,[3 1 2]);'])

		if(i==1|i==2)
		    % zyx convention. Pattern is [theta 0 0]. Use 1st column. Range is (-pi,pi). 
		    eval(['euler_face_' num2str(i) '_final_predicted_actual = euler_face_' num2str(i) '_final_predicted_actual(:,1);'])
		elseif(i==3|i==4)
		    % xyz convention. Pattern is [90 0 theta]         
		    eval(['euler_face_' num2str(i) '_final_predicted_actual = euler_face_' num2str(i) '_final_predicted_actual(:,3);'])
		elseif(i==5|i==6)
		    % xzx convention. Pattern is [theta 90 90]          
		    eval(['euler_face_' num2str(i) '_final_predicted_actual = euler_face_' num2str(i) '_final_predicted_actual(:,1);'])
		end

	else
	    eval(['euler_face_' num2str(i) '_final_predicted_actual = []']);
	    eval(['euler_face_' num2str(i) '_init_predicted = []']);

	end
end

trace_conf_mat = trace(confusion_matrix);
confusion_matrix(7, :) = sum(confusion_matrix, 1);
confusion_matrix(:, 7) = sum(confusion_matrix, 2);

conf_mat_latex(confusion_matrix);
classification_accuracy = trace_conf_mat/confusion_matrix(7,7)