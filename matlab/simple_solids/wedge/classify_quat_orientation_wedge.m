% TODO 9 out of 6000(for ex) aren't (manually) "classified"
% Return the "outliers"
function [face_1_final, face_2_final, face_3_final, face_4_final, face_5_final, face_1_init, face_2_init, face_3_init, face_4_init, face_5_init, total] = classify_quat_orientation_wedge(init_quat, final_quat)

[face_1_final,face_2_final,face_3_final,face_4_final,face_5_final,total] = deal([]);
[face_1_init,face_2_init,face_3_init,face_4_init,face_5_init] = deal([]);

% Could use only 5613/6000 :\
% See comments inside the loop
test_class = quaternion(final_quat);
test_euler = EulerAngles(test_class, 'xyz');
test_euler = permute(test_euler, [3 1 2]);
test_euler = test_euler.*180/pi; % To avoid name conflict with final_euler
test_euler = round(test_euler);

for(i=1:size(final_quat, 1))
	 
    %final_quat = [_ 0 0 _]. Corresponds to [0 0 ___] roll pitch yaw
	if(final_quat(i,2)== 0 && final_quat(i,3)== 0)
		face_1_final = [face_1_final; final_quat(i,:)];
		face_1_init = [face_1_init; init_quat(i, :)];
    end
    
    %final_quat = [0 _ _ 0]. Corresponds to [+-180  0  ___] roll pitch yaw.
	if(final_quat(i,1)==0 && final_quat(i,4)==0)
		face_2_final = [face_2_final; final_quat(i,:)];
		face_2_init = [face_2_init; init_quat(i, :)];
    end
    
    %final_quat = [x -x y -y]
    if(final_quat(i,1)== -final_quat(i,2) && final_quat(i,3)== -final_quat(i,4))
		face_3_final = [face_3_final; final_quat(i,:)];
		face_3_init = [face_3_init; init_quat(i, :)];
	end

    % Now we don't have neat patterns for the faces of the traingle other
    % than the hypotenuse 
    % So I ll convert to euler angles using a convention which has range
    % (0,2pi) or (-pi,pi) and NOT (-pi/2, pi/2) because in that this
    % "classification" is not one-line as the other two angles change in
    % between. For details, see the final_euler.csv got from the V-REP
    % experiment. 
   
    % I am using the 'xyz' convention, which is also how the synthetic data
    % was generated in VREP. 
    % In this convention:
    % face_4 = [90,  45, theta]
    % face_5 = [90, -45, theta]
    % face_1,2,3 won't conflict as they are [0,0,theta],[180,0,theta], &
    % [90,0,theta] and I let them be "classified" using the quat
    % equivalence method, heh.
    
	if(test_euler(i,1)== 90 && test_euler(i,2)== 45)
		face_4_final = [face_4_final; final_quat(i,:)];
		face_4_init = [face_4_init; init_quat(i, :)];	
	end

	if(test_euler(i,1)== 90 && test_euler(i,2)== -45)
		face_5_final = [face_5_final; final_quat(i,:)];
		face_5_init = [face_5_init; init_quat(i, :)];
    end
    
end

total = size(face_1_final,1) + size(face_2_final,1) + size(face_3_final,1) + size(face_4_final,1) + size(face_5_final,1) 
% 


