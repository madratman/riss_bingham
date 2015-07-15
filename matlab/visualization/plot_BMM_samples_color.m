function plot_BMM_samples_color(bingham_cluster, weights, no_of_samples)

color_cell = {'k' 'm' 'c' 'r' 'g' 'b' 'y'};

[quat ind no_of_samples_from_component]= bingham_mixture_sample(bingham_cluster, weights, no_of_samples);
no_of_samples_from_component;
last = 0;
length(quat);

for j = 1:length(bingham_cluster)   
    to_plot=[];
    for i=1:no_of_samples_from_component(j)
         if i ~= no_of_samples_from_component(j)
%             ind(i+last) = j;%TODO error at transitions
            to_plot = [to_plot;quat(i+last,:)];    
         end
         if i == no_of_samples_from_component(j)
            last = sum(no_of_samples_from_component(1:j));
%             ind(last) = j;
            to_plot = [to_plot;quat(last,:)];
         end
%          i+last
    end 
    length(to_plot)
    plot_quaternions_rotations(to_plot, color_cell{j});
end
%     
% for i = 1:size(bingham_cluster, 2)
%     i
% %     figure;
%     if size(bingham_cluster, 2) < 8;
%         eval(['plot_quaternions_rotations(quat(1:n_sample_per_comp(i)),  no_of_samples, color_cell{' num2str(i) '});'])
%     else
%         eval(['plot_quaternions_rotations(bingham_cluster(' num2str(i) '), no_of_samples, rand(1,3));'])
%     end
%     set(gcf,'units','normalized','outerposition',[0 0 0.5 0.333])
% end
%     