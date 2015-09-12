% This script is in 3 parts

% Import training data, clean it.
final_quat = importdata('final_pose.csv')
final_quat = round(final_quat, 4);
final_quat = final_quat(1:6000, 2:end);

init_quat = importdata('init_pose.csv')
init_quat = round(init_quat, 4);
init_quat = init_quat(1:6000, 2:end);

% Segregate faces. 
[face_1_final, face_2_final, face_3_final, face_4_final, face_5_final, face_6_final, face_1_init, face_2_init, face_3_init, face_4_init, face_5_init, face_6_init, total] = classify_quat_orientation(init_quat, final_quat, 0);

% Export data. And fit BMMs via the C code. 
for i = 1:6
    csvwrite(strcat( 'face_', num2str(i), '_init.csv'), eval(strcat('face_', num2str(i),'_init')));
end

for i = 1:6
    csvwrite(strcat('face_', num2str(i), '_final.csv'), eval(strcat('face_', num2str(i),'_final')));
end

% Fit BMMs in C.    
% Save BMX files in this same folder. 
% TODO. Make a bash script for this. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Part_2

% Import the BMX files in Matlab
import_BMX_file;

% Sample 1000 points each from these BMMs. 
sample_1000_quats_from_vrep_exp_BMMS;

% Create a uniform bingham. Sample 6000 points. (Testing data)
bing_uniform = bingham_new_uniform(4);
bing_uniform_samples = bingham_sample(bing_uniform, 6000);

% Do classification
eval_classification;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Part_2

% Now go to VREP. And drop the cube 6000 times, with these predicted
% poses as initial poses. 
for i = 1:6
    eval(['csvwrite(''face_' num2str(i) '_init_predicted.csv'', face_' num2str(i) '_init_predicted);'])
end

% Done? Now, let's import the testing data's outcomes!
for i=1:6
    eval(['face_' num2str(i) '_final_predicted_actual = importdata(''face_' num2str(i) '_final_predicted.csv'');'])
    eval(['face_' num2str(i) '_final_predicted_actual = face_' num2str(i) '_final_predicted_actual(1:size(face_' num2str(i) '_init_predicted,1),:);'])
    eval(['face_' num2str(i) '_final_predicted_actual = face_' num2str(i) '_final_predicted_actual(:,2:end);'])
end
% Don't worry about rounding off to 4 digits. Next script does all that.

% Evaluate the confusion matrix
eval_error_classification;

% Now let's do some regression
eval_error_regression;