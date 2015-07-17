for i= 1:6
    eval(['face_init_' num2str(i) '_BMM_samples = bingham_mixture_sample(face_init_' num2str(i) '_fitted_BMM, face_init_' num2str(i) '_fitted_BMM_weights, 1000);'])
    eval(['face_final_' num2str(i) '_BMM_samples = bingham_mixture_sample(face_final_' num2str(i) '_fitted_BMM, face_final_' num2str(i) '_fitted_BMM_weights, 1000);'])
end
