function array =  from_quaternion_class_to_array(quat_class)

real_quat = real(quat_class)';
vector_quat = vector(quat_class);
vector_quat = permute(vector_quat, [3 1 2]); %analogue of transpose for 3D array

array = [real_quat vector_quat];