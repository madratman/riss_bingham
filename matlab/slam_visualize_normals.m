normals_3d = dlmread('/home/madratman/projects/slam_project/data/staircase_normals/normals/10.txt');
% normals_quat = [zeros(size(normals_3d,1),1) normals_3d];
normals_quat = [normals_3d zeros(size(normals_3d,1),1) ];

rand_indices = randperm(size(normals_quat,1))';
num_normals_to_plot = 1000;
indices_to_sample = rand_indices(1:num_normals_to_plot);

figure;
plot_normals_slam(normals_quat(indices_to_sample,:));
xlabel('x');
ylabel('y')
zlabel('z');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
num_bmm_samples_to_plot = 1000;
[bing_mix_model, bing_mix_model_weights]= slam_parse_bmm_txt('/home/madratman/projects/slam_project/data/staircase_normals/binghams/10.txt')
plot_BMM_samples_color(bing_mix_model, bing_mix_model_weights, num_bmm_samples_to_plot)
xlabel('x');
ylabel('y')
zlabel('z');

