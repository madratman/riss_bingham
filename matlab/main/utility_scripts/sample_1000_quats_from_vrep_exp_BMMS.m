for i= 1:6
    eval(['face_' num2str(i) '_init_BMM_samples = bingham_mixture_sample(face_' num2str(i) '_init_BMM, face_' num2str(i) '_init_BMM_weights, 1000);'])
    eval(['face_' num2str(i) '_final_BMM_samples = bingham_mixture_sample(face_' num2str(i) '_final_BMM, face_' num2str(i) '_final_BMM_weights, 1000);'])
end
