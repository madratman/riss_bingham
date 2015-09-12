% This is a lame ass way to compare quaternions
% Ideally we should find the distance between them and 
% use a threshold
% TODO
% Also, the "total" variable can be used to compare. 
% For face 6, we have 756/756. 
for i = 1:5
    eval(['face_' num2str(i) '_init_predicted = round(face_' num2str(i) '_init_predicted, 4);'])
    eval(['face_' num2str(i) '_final_predicted_actual = round(face_' num2str(i) '_final_predicted_actual, 4);'])
    eval(['[pred_face_' num2str(i) '_as_1_final, pred_face_' num2str(i) '_as_2_final, pred_face_' num2str(i) '_as_3_final, pred_face_' num2str(i) '_as_4_final, pred_face_' num2str(i) '_as_5_final, pred_face_' num2str(i) '_as_1_init, pred_face_' num2str(i) '_as_2_init, pred_face_' num2str(i) '_as_3_init, pred_face_' num2str(i) '_as_4_init, pred_face_' num2str(i) '_as_5_init, total] = classify_quat_orientation_wedge(face_' num2str(i) '_init_predicted, face_' num2str(i) '_final_predicted_actual);'])
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
confusion_matrix = zeros(5,5);
for i = 1:5
    for j = 1:5
        eval(['confusion_matrix(i,j) = size(pred_face_' num2str(i) '_as_' num2str(j) '_init, 1);'])
    end
end        

trace_conf_mat = trace(confusion_matrix);
confusion_matrix(6, :) = sum(confusion_matrix, 1);
confusion_matrix(:, 6) = sum(confusion_matrix, 2);

conf_mat_latex_wedge(confusion_matrix);
classification_accuracy = trace_conf_mat/confusion_matrix(6,6)