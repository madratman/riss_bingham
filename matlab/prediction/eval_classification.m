% function eval_probabilities(quat)
for i = 1:6
    eval(['prob_face_init_' num2str(i) '= zeros(5000,1);']);
    for j = 1:length(bing_uniform_samples)
        eval(['prob_face_init_' num2str(i) '(j) = bingham_mixture_pdf(bing_uniform_samples(j,:), face_' num2str(i) '_init_BMM, face_' num2str(i) '_init_BMM_weights);'])
    end
end

prob_face_init_net = [prob_face_init_1 prob_face_init_2 prob_face_init_3 prob_face_init_4 prob_face_init_5 prob_face_init_6];

for i = 1:length(bing_uniform_samples)
    [values(i,1) index(i,1)]= max(prob_face_init_net(i,:));
end

for i = 1:6
    eval(['face_' num2str(i) '_init_predicted= [];'])
end

for i = 1:length(bing_uniform_samples)
    switch index(i)
        case 1
            face_1_init_predicted = [face_1_init_predicted; bing_uniform_samples(i,:)];
        case 2
            face_2_init_predicted = [face_2_init_predicted; bing_uniform_samples(i,:)];
        case 3
            face_3_init_predicted = [face_3_init_predicted; bing_uniform_samples(i,:)];
        case 4
            face_4_init_predicted = [face_4_init_predicted; bing_uniform_samples(i,:)];
        case 5
            face_5_init_predicted = [face_5_init_predicted; bing_uniform_samples(i,:)];
        case 6
            face_6_init_predicted = [face_6_init_predicted; bing_uniform_samples(i,:)];
    end
end

for i = 1:6
    figure;
    eval(['plot_quaternions_rotations(face_' num2str(i) '_init_predicted);'])
end