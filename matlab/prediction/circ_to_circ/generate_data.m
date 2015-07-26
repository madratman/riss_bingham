for i=1:360
    syn_init_euler(i,:) = [45 45 i];
%     syn_init_euler(i,:) = [34 i 51];
end

syn_init_euler = circ_ang2rad(syn_init_euler);
syn_init_quat = quaternion.eulerangles('xyz', syn_init_euler(:,1), syn_init_euler(:,2), syn_init_euler(:,3));
syn_init_quat = from_quaternion_class_to_array(syn_init_quat'); % transpose because of weird constructer
% plot_quaternions_animate(syn_init_quat);r 
% plot_quaternions_robotic_toolbox(syn_init_quat);

for i=1:360
    syn_final_euler(i,:) = [0 0 i];
end

syn_final_euler = circ_ang2rad(syn_final_euler);
syn_final_quat = quaternion.eulerangles('xyz', syn_final_euler(:,1), syn_final_euler(:,2), syn_final_euler(:,3));
syn_final_quat = from_quaternion_class_to_array(syn_final_quat'); % transpose because of weird constructer
% plot_quaternions_animate(syn_final_quat);
% plot_quaternions_robotic_toolbox(syn_final_quat);

bing_init = bingham_fit(syn_init_quat);
bing_init_samples = bingham_sample(bing_init, 10000);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% REGRESSION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

