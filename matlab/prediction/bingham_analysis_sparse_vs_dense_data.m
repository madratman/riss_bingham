eigenvectors = zeros(360,4,3);
eigenvector_third = zeros(360,4);
for i=1:360
    eval(['bing_' num2str(i) '= bingham_fit(syn_init_quat(1:' num2str(i) ':end, :));'])
    eval(['concentration_params(i,:) = bing_' num2str(i) '.Z;'])
    eval(['eigenvectors(i,:,:) = bing_' num2str(i) '.V;'])
    eval(['eigenvector_third(i,:) = eigenvectors(i,:,3);'])
    eval(['eigenvector_second(i,:) = eigenvectors(i,:,2);'])
    eval(['eigenvector_first(i,:) = eigenvectors(i,:,1);'])
    eval(['modes(i,:) = bingham_mode(bing_' num2str(i) ');'])
    i
%     bing_cell{i} = bing_
end
