%-- Saturday 18 July 2015 11:33:59 PM EDT --%
for i = 1:6
    eval(['face_' num2str(i) '_final_predicted = importdata(''face_' num2str(i) '_final_predicted.csv'');'])
end

face_2_final_predicted = face_2_final_predicted(1:889, :)
face_3_final_predicted = face_3_final_predicted(1:786, :)
face_4_final_predicted = face_4_final_predicted(1:825, :)
face_5_final_predicted = face_5_final_predicted(1:857, :)
face_6_final_predicted = face_6_final_predicted(1:756, :)

for i=1:6
    eval(['face_' num2str(i) '_final_predicted = face_' num2str(i) '_final_predicted(:, 2:end);'])
end

for i=1:6
    eval(['face_' num2str(i) '_init_predicted = predict_face_' num2str(i) ';'])
    eval(['clearvars predict_face_' num2str(i) ';']) 
end
for i=1:6
    figure;
    eval(['plot_quaternions_rotations(face_' num2str(i) '_final_predicted);'])
end

