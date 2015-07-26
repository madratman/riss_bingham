% TODO 9 out of 6000(for ex) aren't (manually) "classified"
% Return the "outliers"
function [face_1_final, face_2_final, face_3_final, face_4_final, face_5_final, face_6_final, face_1_init, face_2_init, face_3_init, face_4_init, face_5_init, face_6_init, total] = classify_quat_orientation_cube(init_quat, final_quat)

[face_1_final,face_2_final,face_3_final,face_4_final,face_5_final,face_6_final,total] = deal([]);
[face_1_init,face_2_init,face_3_init,face_4_init,face_5_init,face_6_init] = deal([]);

for(i=1:size(final_quat, 1))
	 
    %final_quat = [_ 0 0 _]. Corresponds to [0 0 ___] roll pitch yaw
	if(final_quat(i,2)== 0 && final_quat(i,3)== 0)
		face_1_final = [face_1_final; final_quat(i,:)];
		face_1_init = [face_1_init; init_quat(i, :)];

    %final_quat = [0 _ _ 0]. Corresponds to [+-180  0  ___] roll pitch yaw.
    elseif(final_quat(i,1)==0 && final_quat(i,4)==0)
		face_2_final = [face_2_final; final_quat(i,:)];
		face_2_init = [face_2_init; init_quat(i, :)];

	%final_quat = [x x y y]
    elseif(final_quat(i,1)==final_quat(i,2) && final_quat(i,3)==final_quat(i,4))
		face_3_final = [face_3_final; final_quat(i,:)];
		face_3_init = [face_3_init; init_quat(i, :)];

	%final_quat = [x -x y -y]
    elseif(final_quat(i,1)== -final_quat(i,2) && final_quat(i,3)== -final_quat(i,4))
		face_4_final = [face_4_final; final_quat(i,:)];
		face_4_init = [face_4_init; init_quat(i, :)];

	%final_quat = [x y -x y]
    elseif(final_quat(i,1)== -final_quat(i,3) && final_quat(i,2)==final_quat(i,4))
		face_5_final = [face_5_final; final_quat(i,:)];
		face_5_init = [face_5_init; init_quat(i, :)];	

	%final_quat = [x y x -y]
    elseif(final_quat(i,1)== final_quat(i,3) && final_quat(i,2)== -final_quat(i,4))
		face_6_final = [face_6_final; final_quat(i,:)];
		face_6_init = [face_6_init; init_quat(i, :)];
    end
    
end

total = size(face_1_final,1) + size(face_2_final,1) + size(face_3_final,1) + size(face_4_final,1) + size(face_5_final,1) + size(face_6_final,1)
% 
% if(length==1)
% 	figure
% 	subplot(2,6,1);
% 	plot_quaternions_sphere(face_1_final);
% 
% 	subplot(2,6,2);
% 	plot_quaternions_sphere(face_2_final);
% 
% 	subplot(2,6,3);
% 	plot_quaternions_sphere(face_3_final);
% 
% 	subplot(2,6,4);
% 	plot_quaternions_sphere(face_4_final);
% 
% 	subplot(2,6,5);
% 	plot_quaternions_sphere(face_5_final);
% 
% 	subplot(2,6,6);
% 	plot_quaternions_sphere(face_6_final);
% 
% 	subplot(2,6,7);
% 	plot_quaternions_sphere(face_1_init);
% 
% 	subplot(2,6,8);
% 	plot_quaternions_sphere(face_2_init);
% 
% 	subplot(2,6,9);
% 	plot_quaternions_sphere(face_3_init);
% 
% 	subplot(2,6,10);
% 	plot_quaternions_sphere(face_4_init);
% 
% 	subplot(2,6,11);
% 	plot_quaternions_sphere(face_5_init);
% 
% 	subplot(2,6,12);
% 	plot_quaternions_sphere(face_6_init);
% end
% 
% if(length==2)
% 
% 	figure
% 	subplot(2,6,1);
% 	plot_quaternions_length(face_1_final);
%    
%     figure
% 	subplot(2,6,2);
% 	plot_quaternions_length(face_2_final);
%     
%     figure
% 	subplot(2,6,3);
% 	plot_quaternions_length(face_3_final);
% 
%     figure
% 	subplot(2,6,4);
% 	plot_quaternions_length(face_4_final);
% 
%     figure
% 	subplot(2,6,5);
% 	plot_quaternions_length(face_5_final);
% 
%     figure
% 	subplot(2,6,6);
% 	plot_quaternions_length(face_6_final);
%     
%     figure
% 	subplot(2,6,7);
% 	plot_quaternions_length(face_1_init);
% 
%     figure
% 	subplot(2,6,8);
% 	plot_quaternions_length(face_2_init);
% 
%     figure
%     subplot(2,6,9);
% 	plot_quaternions_length(face_3_init);
%     
%     figure
% 	subplot(2,6,10);
% 	plot_quaternions_length(face_4_init);
%     
%     figure
% 	subplot(2,6,11);
% 	plot_quaternions_length(face_5_init);
%     
%     figure
% 	subplot(2,6,12);
% 	plot_quaternions_length(face_6_init);
% end
% 
% if(length ==0)
% end
% 
