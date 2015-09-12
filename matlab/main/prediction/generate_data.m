%%%%%%%%%%% For exp_6. Bingham samples. Slightly outta plane
% for i=1:2000
% %     syn_init_euler(i,:) = [45 rand()*360 0];
%     syn_init_euler(i,:) = [90 30 rand()*360]; %poses for drop on edge. Rotating, tilted cube (at 45 deg wrt horizontal) about ORIGINAL z axis(extrinsic rotation - speaking)
% end
% %%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:360
%     syn_init_euler(i,:) = [45 rand()*360 0];
    syn_init_euler(i,:) = [0 45 i]; %poses for drop on edge. Rotating, tilted cube (at 45 deg wrt horizontal) about ORIGINAL z axis(extrinsic rotation - speaking)
end
%%%%%%%%%%% For exp_7. 0.1 deg intervals. All in one plane
% test = [0:0.1:359.9]';
% for i = 1:size(test)
%     syn_init_euler(i,:) = [45 45 test(i)];
% end
%%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

syn_init_euler = circ_ang2rad(syn_init_euler);
syn_init_quat = quaternion.eulerangles('xyz', syn_init_euler(:,1), syn_init_euler(:,2), syn_init_euler(:,3));
test_verify = syn_init_quat.EulerAngles('xyz');
syn_init_quat = from_quaternion_class_to_array(syn_init_quat); % transpose because of weird constructer
% plot_quaternions_animate(syn_init_quat);r 
% plot_quaternions_robotic_toolbox(syn_init_quat);

for i=1:360
    syn_final_euler(i,:) = [0 0 i+100];
end

syn_final_euler = circ_ang2rad(syn_final_euler);
syn_final_quat = quaternion.eulerangles('xyz', syn_final_euler(:,1), syn_final_euler(:,2), syn_final_euler(:,3));
syn_final_quat = from_quaternion_class_to_array(syn_final_quat); % BUG.Transpose-> conjugate
% transpose because of weird constructer
% plot_quaternions_animate(syn_final_quat);
% plot_quaternions_robotic_toolbox(syn_final_quat);

bing_init = bingham_fit(syn_init_quat);
bing_init_samples = bingham_sample(bing_init, 10000);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% REGRESSION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

