% Stores the indices of the closest quaternions in training data (2nd argument)when
% compared to the testing data(1st argument)

% Evaluate errors only for the correct classifications
% Beware of euler angle range. Can be [-pi, pi] and also [-pi/2, pi2]! And
% different colums. 

for i = 1:6
%    eval(['closest_quat_indices{i} = find_closest_quaternions(face_' num2str(i) '_init_predicted, face_' num2str(i)  '_init);'])
   eval(['closest_quat_indices{i} = find_closest_quaternions(pred_face_' num2str(i) '_as_' num2str(i) '_init, face_' num2str(i)  '_init);'])
end

% Then, for now this is the predicted pose. 
% Naivest regression eva. 
for i = 1:6
   eval(['face_' num2str(i) '_final_predicted_without_vrep = face_' num2str(i) '_final(cell2mat(closest_quat_indices(i)), :);'])
end

% Now find difference between euler angles of what actually happened in the
% simulator - face_n_final_predicted v/s what we did just now -
% face_n_final_predicted_without_vrep

% Another measure could be angle axis 
% On using eval with EulerAngles, somehow I get complex numbers.
% bug 

% In all rotation operations, the rotations operate from left to right on
% 3x1 column vectors and create rotated vectors, not representations of
% those vectors in rotated coordinate systems.
% For Euler angles, '123' means rotate the vector about x first, about y
% second, about z third, i.e.:
% vp = rotate(z,angle(3)) * rotate(y,angle(2)) * rotate(x,angle(1)) * v
error_cell = []

% Because euler angles are so awesome, I had to hardcode different
% conventions, so that there is no ambiguity for each pair of opposite
% faces.

for i = 1:6
%   Only calculate errors for those points which were correctly classified.
    if(i==1|i==2)
        eval(['euler_predicted = EulerAngles(quaternion(face_' num2str(i) '_final_predicted_without_vrep), ''zyx'');'])
        eval(['euler_actual = EulerAngles(quaternion(pred_face_' num2str(i) '_as_' num2str(i) '_final), ''zyx'');'])
    elseif(i==3|i==4)
        eval(['euler_predicted = EulerAngles(quaternion(face_' num2str(i) '_final_predicted_without_vrep), ''xyz'');'])
        eval(['euler_actual = EulerAngles(quaternion(pred_face_' num2str(i) '_as_' num2str(i) '_final), ''xyz'');'])
    elseif(i==5|i==6)
        eval(['euler_predicted = EulerAngles(quaternion(face_' num2str(i) '_final_predicted_without_vrep), ''xzx'');'])
        eval(['euler_actual = EulerAngles(quaternion(pred_face_' num2str(i) '_as_' num2str(i) '_final), ''xzx'');'])
    end
    
    euler_predicted = real(euler_predicted);% weird bug
    euler_predicted = permute(euler_predicted,[3 1 2]);
    euler_predicted = euler_predicted.*(180/pi);
    euler_actual = real(euler_actual);
    euler_actual = permute(euler_actual,[3 1 2]);
    euler_actual = euler_actual.*(180/pi);
   
    if(i==1|i==2)
        % zyx convention            
        % Pattern is [theta 0 0]         
        % 1st column. Range is (-pi,pi). Don't know interval closed on which side. 
        euler_predicted(:,1) = euler_predicted(:,1)+180;
        euler_actual(:,1) = euler_actual(:,1)+180;
        error = abs(euler_predicted(:,1) - euler_actual(:,1));
        % Now this error is in the range [0, 2*pi]
        
    elseif(i==3|i==4)
        % xyz convention 
        % Pattern is [90 0 theta]         
        euler_predicted(:,3) = euler_predicted(:,3)+180;
        euler_actual(:,3) = euler_actual(:,3)+180;
        error = abs(euler_predicted(:,3) - euler_actual(:,3));
    
    elseif(i==5|i==6)
        % xzx convention 
        % Pattern is [theta 90 90]          
        euler_predicted(:,1) = euler_predicted(:,1)+180;
        euler_actual(:,1) = euler_actual(:,1)+180;
        error = abs(euler_predicted(:,1) - euler_actual(:,1));
    end
    
    for j = 1:length(error)
        if error(j) > 180
            error(j) = 360- error(j);
        end
    end
    error_cell{i} = error;
end

[error_std error_mean error_mode error_median error_max error_min] = deal(zeros(6,1));
for i = 1:6
    error_std(i,1) = std(cell2mat(error_cell(i)));
    error_mean(i,1) = mean(cell2mat(error_cell(i)));
    error_mode(i,1) = mode(cell2mat(error_cell(i)));
    error_median(i,1) = median(cell2mat(error_cell(i)));
    error_max(i,1) = max(cell2mat(error_cell(i)));
    error_min(i,1) = min(cell2mat(error_cell(i)));

%     stem(cell2mat(error_cell(i)));
    count = 1:1:size(cell2mat(error_cell(i)), 1);
    plot_error(count, cell2mat(error_cell(i)));
end
error_stats = [error_mean error_mode error_median error_std error_max error_min];
latex_regression_error_stats(error_stats);

clearvars error euler_predicted euler_actual;