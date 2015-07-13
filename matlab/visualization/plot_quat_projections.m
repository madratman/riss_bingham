function [q_1, q_2, q_3, q_4] =  plot_quat_projections(quat)

n = size(quat, 1)

for i=1:4
  eval(['q_' num2str(i) '= zeros(n,4);'])
end

for i=1:n
  q_1(i,:) = [0 quat(i,2) quat(i,3) quat(i,4)];
  q_2(i,:) = [quat(i,1) 0 quat(i,3) quat(i,4)];
  q_3(i,:) = [quat(i,1) quat(i,2) 0 quat(i,4)];
  q_4(i,:) = [quat(i,1) quat(i,2) quat(i,3) 0];
end

plot_quaternions_length(q_1)
% axis vis3d;

figure;
plot_quaternions_length(q_2)
% axis vis3d;

figure;
plot_quaternions_length(q_3)
% axis vis3d;

figure;
plot_quaternions_length(q_4)
% axis vis3d;
%colormap(.5*gray+.5);
