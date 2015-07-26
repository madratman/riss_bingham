% Please cd into the folder where the data is!
init_quat = importdata('init_quat.csv');
final_quat = importdata('final_quat.csv');
final_euler = importdata('final_euler.csv');

init_quat = init_quat(:, 2:end);
final_quat = final_quat(:, 2:end);
final_euler = final_euler(:, 2:end);
final_quat = final_quat(1:size(init_quat, 1),:);
final_euler = final_euler(1:size(init_quat, 1),:);
init_quat = round(init_quat,4);
final_quat = round(final_quat,4);
