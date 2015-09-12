function plot_bingham_sample(bing, no_of_samples, flag, color)
% flag
%TODO reduce everything to one function and check no of arguments with
%nargin
quat = zeros(no_of_samples, 1);
quat = bingham_sample(bing , no_of_samples);

if strcmp(flag, 'animate')
  	class_quat = quaternion(quat); 
    PlotRotation(class_quat, 0.0001);

elseif strcmp(flag, 'axis_angle')
   plot_quaternions_length(quat);

elseif strcmp(flag, 'sphere')
    plot_quaternions_sphere(quat);

elseif strcmp(flag, 'just_bingham')
    plot_bingham_3d(bing);

elseif strcmp(flag, 'robotics_toolbox')
    if nargin > 3
        plot_quaternions_robotic_toolbox(quat, color)
    else
        plot_quaternions_robotic_toolbox(quat)
    end

elseif strcmp(flag, 'quat_orig')
    plot_quaternions(quat);

elseif strcmp(flag, 'bingham_projections')
    plot_bingham_3d_projections(bing);


end