% simple script from 612345 to 123456
for i = 1:6
    eval(['test_face_final_' num2str(i) '_fitted_BMM = face_final_' num2str(i) '_fitted_BMM;']) 
    eval(['test_face_final_' num2str(i) '_fitted_BMM_weights = face_final_' num2str(i) '_fitted_BMM_weights;']) 
    eval(['test_face_final_' num2str(i) '_BMM_samples = face_final_' num2str(i) '_BMM_samples;']) 
    eval(['test_face_init_' num2str(i) '_fitted_BMM = face_init_' num2str(i) '_fitted_BMM;']) 
    eval(['test_face_init_' num2str(i) '_fitted_BMM_weights = face_init_' num2str(i) '_fitted_BMM_weights;']) 
    eval(['test_face_init_' num2str(i) '_BMM_samples = face_init_' num2str(i) '_BMM_samples;']) 
end

for i = 1:5
    eval(['face_' num2str(i+1) '_final_fitted_BMM = test_face_final_' num2str(i) '_fitted_BMM;']) 
    eval(['face_' num2str(i+1) '_final_fitted_BMM_weights = test_face_final_' num2str(i) '_fitted_BMM_weights;']) 
    eval(['face_' num2str(i+1) '_final_BMM_samples = test_face_final_' num2str(i) '_BMM_samples;']) 
    eval(['face_' num2str(i+1) '_init_fitted_BMM = test_face_init_' num2str(i) '_fitted_BMM;']) 
    eval(['face_' num2str(i+1) '_init_fitted_BMM_weights = test_face_init_' num2str(i) '_fitted_BMM_weights;']) 
    eval(['face_' num2str(i+1) '_init_BMM_samples = test_face_init_' num2str(i) '_BMM_samples;']) 
end

i = 6
eval(['face_' num2str(1) '_final_fitted_BMM = test_face_final_' num2str(6) '_fitted_BMM;']) 
eval(['face_' num2str(1) '_final_fitted_BMM_weights = test_face_final_' num2str(6) '_fitted_BMM_weights;']) 
eval(['face_' num2str(1) '_final_BMM_samples = test_face_final_' num2str(6) '_BMM_samples;']) 
eval(['face_' num2str(1) '_init_fitted_BMM = test_face_init_' num2str(6) '_fitted_BMM;']) 
eval(['face_' num2str(1) '_init_fitted_BMM_weights = test_face_init_' num2str(6) '_fitted_BMM_weights;']) 
eval(['face_' num2str(1) '_init_BMM_samples = test_face_init_' num2str(6) '_BMM_samples;']) 

for i = 1:6
    eval(['clearvars test_face_final_' num2str(i) '_fitted_BMM;'])
    eval(['clearvars test_face_final_' num2str(i) '_fitted_BMM_weights;'])
    eval(['clearvars test_face_final_' num2str(i) '_BMM_samples;'])
    eval(['clearvars test_face_init_' num2str(i) '_fitted_BMM;'])
    eval(['clearvars test_face_init_' num2str(i) '_fitted_BMM_weights;'])
    eval(['clearvars test_face_init_' num2str(i) '_BMM_samples;'])
end