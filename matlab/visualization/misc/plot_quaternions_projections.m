function [q_1, q_2, q_3, q_4] =  plot_quaternion_projections(quat, flag_plot_type)

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

% First, create 4  figures with four different graphs (each with  a 
% colorbar):
figure(1)
if strcmp(flag_plot_type, 'length')
    plot_quaternions_length(q_1)
elseif strcmp(flag_plot_type, 'sphere')
    plot_quaternions_sphere(q_1)
end

% colorbar
figure(2)
if strcmp(flag_plot_type, 'length')
    plot_quaternions_length(q_1)
elseif strcmp(flag_plot_type, 'sphere')
    plot_quaternions_sphere(q_1)
end% colorbar
figure(3)
if strcmp(flag_plot_type, 'length')
    plot_quaternions_length(q_1)
elseif strcmp(flag_plot_type, 'sphere')
    plot_quaternions_sphere(q_1)
end% colorbar
figure(4)
if strcmp(flag_plot_type, 'length')
    plot_quaternions_length(q_1)
elseif strcmp(flag_plot_type, 'sphere')
    plot_quaternions_sphere(q_1)
end% colorbar
% Now create destination graph
figure(5)
ax = zeros(4,1);
for i = 1:4
    ax(i)=subplot(4,1,i);
end
% Now copy contents of each figure over to destination figure
% Modify position of each axes as it is transferred
for i = 1:4
    figure(i)
    h = get(gcf,'Children');
    newh = copyobj(h,5)
    
    for j = 1:length(newh)
        posnewh = get(newh(j),'Position');
        possub  = get(ax(i),'Position');
        set(newh(j),'Position',...
        [posnewh(1) possub(2) posnewh(3) possub(4)])
    end
    delete(ax(i));
end
figure(5)
% close(figure(1))
% close(figure(2))
% close(figure(3))
% close(figure(4))