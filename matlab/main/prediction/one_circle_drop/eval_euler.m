init_quat = importdata('init_quat.csv');
final_quat = importdata('final_quat.csv');
final_quat = final_quat(1:size(init_quat, 1),:); % vrep error

% Shuffle the data. Not required. But to see different classification
% accuracies. 
% Indices should remain the same!
rand_perm = randperm(size(init_quat,1))';
init_quat = init_quat(rand_perm, :);
final_quat = final_quat(rand_perm, :);
clearvars rand_perm;

% Split training:testing::90:10
l_quat = size(init_quat, 1);
ninety_percent = ceil(0.9*l_quat); 
training_init_quat = init_quat(1:ninety_percent, :);
training_final_quat = final_quat(1:ninety_percent, :);
testing_init_quat = init_quat(ninety_percent:end, :);
testing_final_quat = final_quat(ninety_percent:end, :);

% for i = 1:6
    test= EulerAngles(quaternion(init_quat), 'xyz');
    test = permute(test,[3 1 2]);
% end

% Round off for pseudo classification
training_init_quat = round(init_quat, 4);
training_final_quat = round(final_quat, 4);

test_final = EulerAngles(quaternion(final_quat), 'xyz');
test_final = permute(test_final,[3 1 2]);

% Pseudo classification
[face_1_final, face_2_final, face_3_final, face_4_final, face_5_final, face_6_final, face_1_init, face_2_init, face_3_init, face_4_init, face_5_init, face_6_init, total] = classify_quat_orientation_cube(training_init_quat, training_final_quat);

for i = 1:6
    
    % clearvars eval(['euler_face_' num2str(i) '_final';])
    if(i==1|i==2)
        eval(['euler_face_' num2str(i) '_final = EulerAngles(quaternion(face_' num2str(i) '_final), ''zyx'');'])
    elseif(i==3|i==4)
        eval(['euler_face_' num2str(i) '_final = EulerAngles(quaternion(face_' num2str(i) '_final), ''xyz'');'])
    elseif(i==5|i==6)
        eval(['euler_face_' num2str(i) '_final = EulerAngles(quaternion(face_' num2str(i) '_final), ''xzx'');'])
    end
    
    eval(['euler_face_' num2str(i) '_final = permute(euler_face_' num2str(i) '_final,[3 1 2]);'])
%      WARNING. try manually and change 
    eval(['euler_face_' num2str(i) '_init = EulerAngles(quaternion(face_' num2str(i) '_init), ''xzx'');'])
    eval(['euler_face_' num2str(i) '_init = permute(euler_face_' num2str(i) '_init,[3 1 2]);']) 
    
     if eval(['isempty(euler_face_' num2str(i) '_final)']) 
         % Do nothing.
     else
%          WARNING CHANGE. 2 FOR 45 theta 0  
         eval(['euler_face_' num2str(i) '_init = euler_face_' num2str(i) '_init(:,2);']) % 3 if xyz convention
     end
    i
    if eval(['isempty(euler_face_' num2str(i) '_final)']) 
         % Do nothing.
    else
       if(i==1|i==2)
            % zyx convention. Pattern is [theta 0 0]. Use 1st column. Range is (-pi,pi). 
            eval(['euler_face_' num2str(i) '_final = euler_face_' num2str(i) '_final(:,1);'])
        elseif(i==3|i==4)
            % xyz convention. Pattern is [90 0 theta]         
            eval(['euler_face_' num2str(i) '_final = euler_face_' num2str(i) '_final(:,3);'])

        elseif(i==5|i==6)
            % xzx convention. Pattern is [theta 90 90]          
            eval(['euler_face_' num2str(i) '_final = euler_face_' num2str(i) '_final(:,1);'])
       end
    end
    
    if eval(['isempty(face_' num2str(i) '_init)']) 
        % generate empty bingham structs to avoid conflicts
        eval(['bing_face_' num2str(i) '_init = [];'])
        eval(['bing_face_' num2str(i) '_final = [];'])
    else
        eval(['bing_face_' num2str(i) '_init = bingham_fit(face_' num2str(i) '_init);']);
        eval(['bing_face_' num2str(i) '_final = bingham_fit(face_' num2str(i) '_final);'])
    end
end

bing_init = bingham_fit(init_quat);
face_init_cluster = {face_1_init, face_2_init, face_3_init, face_4_init, face_5_init, face_6_init};
% quat clusters are cells
bing_init_cluster = [bing_face_1_init, bing_face_2_init, bing_face_3_init, bing_face_4_init, bing_face_5_init, bing_face_6_init];
% bing clusters are arrays of struct


%%%%%%Plotting%%%%%%%%%%%%%%%%%%
% count = 0
% for i = 1:6    
%     if eval(['~isempty(euler_face_' num2str(i) '_init)'])
%         count = count+1
%     end
% end
% 
% iter = 1
% for i = 1:6
%     if eval(['~isempty(euler_face_' num2str(i) '_init)'])
%         subplot(ceil(count/2)*2, 2, iter);
%         circ_plot(eval(['euler_face_' num2str(i) '_init']),'pretty','bo',true,'linewidth',2,'color','r');
%         subplot(ceil(count/2)*2,2,iter+1);
%         circ_plot(eval(['euler_face_' num2str(i) '_init']),'hist',[],100,true,true,'linewidth',2,'color','r');
%         iter = iter+2
%     end
% end
% set(gcf,'units','normalized','outerposition',[0 0 1 1])
% 
% count = 0
% for i = 1:6    
%     if eval(['~isempty(euler_face_' num2str(i) '_final)'])
%         count = count+1
%     end
% end
% 
% iter = 1
% figure;
% for i = 1:6
%     if eval(['~isempty(euler_face_' num2str(i) '_final)'])
%         subplot(ceil(count/2)*2, 2, iter);
%         circ_plot(eval(['euler_face_' num2str(i) '_final']),'pretty','bo',true,'linewidth',2,'color','r');
%         subplot(ceil(count/2)*2,2,iter+1);
%         circ_plot(eval(['euler_face_' num2str(i) '_final']),'hist',[],100,true,true,'linewidth',2,'color','r');
%         iter = iter+2
%     end
% end
% set(gcf,'units','normalized','outerposition',[0 0 1 1])


%%%%%%%clusters%%%%%%%%%%%%%%
% plot_bingham_cluster(bing_init_cluster, 500, 'rotations')
% plot_quaternions_cluster(face_init_cluster, 'rotations')