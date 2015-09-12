function plot_quaternions_robotic_toolbox(quat, color)
%use n*4 format
%TODO: generalize to n*4 and 4*n

%TODO slow animation -> fix. 

% RGB Value
% [1 1 0] y yellow
% [1 0 1] m magenta
% [0 1 1] c cyan
% [1 0 0] r red
% [0 1 0] g green
% [0 0 1] b blue
% [1 1 1] w white
% [0 0 0] k black

for i = 1:size(quat,1)
    q_class(i) = Quaternion(quat(i, :));
    if nargin < 2
        q_class(i).plot;
    else
        q_class(i).plot('color', color);
    end
    hold on;
end