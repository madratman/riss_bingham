% TODO 9 out of 6000(for ex) aren't (manually) "classified"
% Return the "outliers"
function [face_1, face_2, face_3, face_4, face_5, face_6, face_1_init, face_2_init, face_3_init, face_4_init, face_5_init, face_6_init,total] = classify_quat_orientation(init_quat_clean, final_quat_clean, length)

[face_1,face_2,face_3,face_4,face_5,face_6,total] = deal([]);
[face_1_init,face_2_init,face_3_init,face_4_init,face_5_init,face_6_init] = deal([]);

for(i=1:size(final_quat_clean, 1))
	%final_quat_clean = [0 _ _ 0]. Corresponds to [+-180  0  ___] roll pitch yaw.
	if(final_quat_clean(i,1)==0 && final_quat_clean(i,4)==0)
		face_1 = [face_1; final_quat_clean(i,:)];
		face_1_init = [face_1_init; init_quat_clean(i, :)];
	end

	%final_quat_clean = [x x y y]
	if(final_quat_clean(i,1)==final_quat_clean(i,2) && final_quat_clean(i,3)==final_quat_clean(i,4))
		face_2 = [face_2; final_quat_clean(i,:)];
		face_2_init = [face_2_init; init_quat_clean(i, :)];
	end

	%final_quat_clean = [x -x y -y]
	if(final_quat_clean(i,1)== -final_quat_clean(i,2) && final_quat_clean(i,3)== -final_quat_clean(i,4))
		face_3 = [face_3; final_quat_clean(i,:)];
		face_3_init = [face_3_init; init_quat_clean(i, :)];
	end

	%final_quat_clean = [x y -x y]
	if(final_quat_clean(i,1)== -final_quat_clean(i,3) && final_quat_clean(i,2)==final_quat_clean(i,4))
		face_4 = [face_4; final_quat_clean(i,:)];
		face_4_init = [face_4_init; init_quat_clean(i, :)];	
	end

	%final_quat_clean = [x y x -y]
	if(final_quat_clean(i,1)== final_quat_clean(i,3) && final_quat_clean(i,2)== -final_quat_clean(i,4))
		face_5 = [face_5; final_quat_clean(i,:)];
		face_5_init = [face_5_init; init_quat_clean(i, :)];
    end
    
    %final_quat_clean = [_ 0 0 _]. Corresponds to [0 0 ___] roll pitch yaw
	if(final_quat_clean(i,2)== 0 && final_quat_clean(i,3)== 0)
		face_6 = [face_6; final_quat_clean(i,:)];
		face_6_init = [face_6_init; init_quat_clean(i, :)];
    end
end

total = size(face_1,1) + size(face_2,1) + size(face_3,1) + size(face_4,1) + size(face_5,1) + size(face_6,1)
% 
if(length==1)
	figure
	subplot(2,6,1);
	plot_quaternions_sphere(face_1);

	subplot(2,6,2);
	plot_quaternions_sphere(face_2);

	subplot(2,6,3);
	plot_quaternions_sphere(face_3);

	subplot(2,6,4);
	plot_quaternions_sphere(face_4);

	subplot(2,6,5);
	plot_quaternions_sphere(face_5);

	subplot(2,6,6);
	plot_quaternions_sphere(face_6);

	subplot(2,6,7);
	plot_quaternions_sphere(face_1_init);

	subplot(2,6,8);
	plot_quaternions_sphere(face_2_init);

	subplot(2,6,9);
	plot_quaternions_sphere(face_3_init);

	subplot(2,6,10);
	plot_quaternions_sphere(face_4_init);

	subplot(2,6,11);
	plot_quaternions_sphere(face_5_init);

	subplot(2,6,12);
	plot_quaternions_sphere(face_6_init);
end

if(length==2)

	figure
	subplot(2,6,1);
	plot_quaternions_length(face_1);
   
    figure
	subplot(2,6,2);
	plot_quaternions_length(face_2);
    
    figure
	subplot(2,6,3);
	plot_quaternions_length(face_3);

    figure
	subplot(2,6,4);
	plot_quaternions_length(face_4);

    figure
	subplot(2,6,5);
	plot_quaternions_length(face_5);

    figure
	subplot(2,6,6);
	plot_quaternions_length(face_6);
    
    figure
	subplot(2,6,7);
	plot_quaternions_length(face_1_init);

    figure
	subplot(2,6,8);
	plot_quaternions_length(face_2_init);

    figure
    subplot(2,6,9);
	plot_quaternions_length(face_3_init);
    
    figure
	subplot(2,6,10);
	plot_quaternions_length(face_4_init);
    
    figure
	subplot(2,6,11);
	plot_quaternions_length(face_5_init);
    
    figure
	subplot(2,6,12);
	plot_quaternions_length(face_6_init);
end

if(length ==0)
end

