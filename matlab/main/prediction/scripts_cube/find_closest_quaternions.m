function [indices_1_nearest indices_2_nearest] = find_closest_quaternions(quat_samples, quat_to_compare_with)
% First argument is testing data and second training data. 

% TODO : Implement different metrics for SO(3)|pseudo-metrics for 
% Quaternions. Pass as parameter in the function

% TODO, WARNING. Length() fails if no of samples is 1, 2, 3 !!
% TODO. Change to size() from length() in previous code as well. 
quat_samples_class = quaternion(quat_samples);
quat_to_compare_with_class = quaternion(quat_to_compare_with);
indices_1_nearest = zeros(size(quat_samples,1),1);
indices_2_nearest = zeros(size(quat_samples,1),1);
values = zeros(size(quat_samples,1),1);

% Return value. The index of quat in quat_to_compare_with closest to the quat_samples
% length(quat_samples)
% distance = 1 − |q1 · q2|

for i=1:size(quat_samples,1)
    distance = 1 - (abs(dot(quat_samples_class(i), quat_to_compare_with_class))); % coz length(distance)==length(quat_to_compare_with)
    [distance_ascending indices] = sort(distance);
    index_1_nearest = indices(1);%index of closest quat in training data
    index_2_nearest = indices(2);%index of next closest quat in training data
    
%   index is the index of the quat in quat_to_compare_with which is closest to the i th sample in quat_samples
%   This is kind of a loop inside a loop. Don't get confused, my future self. 
%   You can do this. plot_quaternions_rotations(quat_samples(test, :))
%   (test is the second return argument. 
%   And you'll find that's useless. 
%   It could be useful though if you implement the note in the end. That's
%   why I mentioned it. I don't mean to clutter the code. Not at all. 
    
    indices_1_nearest(i) = index_1_nearest;
    indices_2_nearest(i) = index_2_nearest;
end

% TODO it is a good idea to generate a plot of indices. To visualize if it
% is doing what I want to do or not.
clearvars quat_input_class;
clearvars face_1_init_class;
clearvars value;


% Note to self:
% Could also do "MLE" like this?
% By classifying a bing_uniform_sample to the face_n_init class for which
% it has min(min_distance). 