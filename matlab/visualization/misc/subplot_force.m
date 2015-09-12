% First, create 4  figures with four different graphs (each with  a 
% colorbar):
figure(1)
plot_quaternions_length(q1)
% colorbar
figure(2)
plot_quaternions_length(q2)
% colorbar
figure(3)
plot_quaternions_length(q3)
% colorbar
figure(4)
plot_quaternions_length(q4)
% colorbar
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
close(figure(1))
close(figure(2))
close(figure(3))
close(figure(4))