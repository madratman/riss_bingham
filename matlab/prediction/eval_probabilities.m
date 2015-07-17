% function eval_probabilities(quat)
for i = 1:6
    eval(['prob_face_init_' num2str(i) '= zeros(5000,1);']);
    for j = 1:length(bing_uniform_samples)
        eval(['prob_face_init_' num2str(i) '(j) = bingham_mixture_pdf(bing_uniform_samples(j,:), face_init_' num2str(i) '_fitted_BMM, face_init_' num2str(i) '_fitted_BMM_weights);'])
    end
end

prob_face_init_net = [prob_face_init_1 prob_face_init_2 prob_face_init_3 prob_face_init_4 prob_face_init_5 prob_face_init_6];

for i = 1:length(bing_uniform_samples)
    [values(i,1) index(i,1)]= max(prob_face_init_net(i,:));
end

for i = 1:6
    eval(['predict_face_' num2str(i) '= [];'])
end

for i = 1:length(bing_uniform_samples)
    switch index(i)
        case 1
            predict_face_1 = [predict_face_1; bing_uniform_samples(i,:)];
        case 2
            predict_face_2 = [predict_face_2; bing_uniform_samples(i,:)];
        case 3
            predict_face_3 = [predict_face_3; bing_uniform_samples(i,:)];
        case 4
            predict_face_4 = [predict_face_4; bing_uniform_samples(i,:)];
        case 5
            predict_face_5 = [predict_face_5; bing_uniform_samples(i,:)];
        case 6
            predict_face_6 = [predict_face_6; bing_uniform_samples(i,:)];
    end
end

for i = 1:6
    figure;
    eval(['plot_quaternions_rotations(predict_face_' num2str(i) ');'])
end