% TODO eval() in loops could be slow.
% Refactor code?
% Still, this is low priority.

% TODO clearvars unneeded variables in all previous functions

for i=1:6
%     For predicted
    eval(['face_' num2str(i) '_quatclass = quaternion(face_' num2str(i) '_final_predicted);'])
    eval(['face_' num2str(i) '_init_quatclass = quaternion(face_' num2str(i) '_init_predicted);'])
    eval(['map_face_' num2str(i) '_predicted= ldivide(face_' num2str(i) '_init_quatclass, face_' num2str(i) '_quatclass);'])
    eval(['map_face_' num2str(i) '_predicted= from_quaternion_class_to_array(map_face_' num2str(i) '_predicted);'])
    eval(['clearvars face_' num2str(i) '_quatclass face_' num2str(i) '_init_quatclass'])
    figure
    eval(['plot_quaternions_rotations(map_face_' num2str(i) '_predicted);'])
    
%     For training data
%     eval(['face_' num2str(i) '_quatclass = quaternion(face_' num2str(i) ');'])
%     eval(['face_' num2str(i) '_init_quatclass = quaternion(face_' num2str(i) '_init);'])
%     eval(['map_face_' num2str(i) '= ldivide(face_' num2str(i) '_init_quatclass, face_' num2str(i) '_quatclass);'])

%     Comment what all follows below to use debugging mode.
%     eval(['map_face_' num2str(i) '= from_quaternion_class_to_array(map_face_' num2str(i) ');'])
%     eval(['clearvars face_' num2str(i) '_quatclass face_' num2str(i) '_init_quatclass'])
%     figure
%     eval(['plot_quaternions_rotations(map_face_' num2str(i) ');'])
end

% BTW
%     ldivide is q_init_inverse*q_rot (= q_final)
%     rdivide is q_rot_inverse*q_init (= not what we need, but I was curious) 
%     rdivide is NOT what I want. But just checking. 
%     eval(['map_face_' num2str(i) '= rdivide(face_' num2str(i) '_init_quatclass, face_' num2str(i) '_quatclass);'])



%Debugging
% for i = 1:length(face_1_init_quatclass)
%   test_product(i) = product(face_1_init_quatclass(i), map_face_1(i));    
% end
% test_product_arr = from_quaternion_class_to_array(test_product);
% plot_quaternions(test_product_arr);
% plot_quaternions_rotations(test_product_arr);
% clearvars test_product_arr test_product