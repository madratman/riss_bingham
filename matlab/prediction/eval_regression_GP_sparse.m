meanfunc = {@meanZero};hyp.mean = [];

likfunc = @likGauss; sn = 0.1; hyp.lik = log(sn); 
% DO NOT KNOW WHAT SHOULD BE THE HYPER-PARAMS FOR LIKELIHOOD FUNCTION

% For training data, don't be smart and think of using Angle Axis. I tried that. Doesn't work for all case.
% Visualize with plot_quaternions_sphere or just look at the angle, axis to understand why it doesn't work. 

euler_predicted = [];
euler_actual = [];
for i=1:6
    clearvars euler_error euler_predicted euler_actual x y_cos y_sin z ymu_cos ymu_sin training_target;

    eval(['x = face_' num2str(i) '_init(1:10:end,:)']) 
    % training -> init quats -> features

    if(i==1|i==2)
        eval(['euler_actual = EulerAngles(quaternion(pred_face_' num2str(i) '_as_' num2str(i) '_final), ''zyx'');'])
        eval(['training_target = EulerAngles(quaternion(face_' num2str(i) '_final(1:10:end,:)), ''zyx'');'])
    elseif(i==3|i==4)
        eval(['euler_actual = EulerAngles(quaternion(pred_face_' num2str(i) '_as_' num2str(i) '_final), ''xyz'');'])
        eval(['training_target = EulerAngles(quaternion(face_' num2str(i) '_final(1:10:end,:)), ''xyz'');'])
    elseif(i==5|i==6)
        eval(['euler_actual = EulerAngles(quaternion(pred_face_' num2str(i) '_as_' num2str(i) '_final), ''xzx'');'])
        eval(['training_target = EulerAngles(quaternion(face_' num2str(i) '_final(1:10:end,:)), ''xzx'');'])
    end
  
    euler_actual = real(euler_actual);% weird bug
    euler_actual = permute(euler_actual,[3 1 2]);
    training_target = permute(training_target, [3 1 2]);
    euler_actual;%debug
    training_target;%debug
    
    if(i==1|i==2)
        % zyx convention            
        % Pattern is [theta 0 0]         
        % 1st column. Range is (-pi,pi). Don't know interval closed on which side. 
        euler_actual = euler_actual(:,1);
        training_target = training_target(:,1);
        % Now this error is in the range [0, 2*pi]
        
    elseif(i==3|i==4)
        % xyz convention 
        % Pattern is [90 0 theta]         
        euler_actual = euler_actual(:,3);
        training_target = training_target(:,3);
    
    elseif(i==5|i==6)
        % xzx convention 
        % Pattern is [theta 90 90]          
        euler_actual = euler_actual(:,1);
        training_target = training_target(:,1);
    end

    y_cos = cos(training_target);
    y_sin = sin(training_target);
    % training -> final orientation on face -> target

    eval(['z = pred_face_' num2str(i) '_as_' num2str(i) '_final;'])
    % testing  sample -> correctly classified quats -> testing samples

%    I don't remember what's the use of the following line
%    It is negative ML entropy--something
%    nlml = gp(hyp, @infExact, meanfunc, covfunc, likfunc, x, y);
    
%   The following line is for training the hyperparams
%   Initialize to params mentioned in Muriel's paper.
%   TODO : Implement minimize function for combined likelihood of sin and
%   cos. And use same hyperparams for both GPs. 

    covfunc = @covQuaternionArc; sf = 0.08; lambda = 0.4; hyp.cov = [sf; lambda];
    hyp = minimize(hyp, @gp, -10000, @infExact, [], covfunc, likfunc, x, y_cos)    
    [ymu_cos ys2 fmu fs2 lp] = gp(hyp, @infExact, meanfunc, covfunc, likfunc, x, y_cos, z);
    hyp.cov
    
    covfunc = @covQuaternionArc; sf = 0.08; lambda = 0.4; hyp.cov = [sf; lambda];
    hyp = minimize(hyp, @gp, -10000, @infExact, [], covfunc, likfunc, x, y_sin);
    [ymu_sin ys2 fmu fs2 lp] = gp(hyp, @infExact, meanfunc, covfunc, likfunc, x, y_sin, z);
    hyp.cov
    
    for j = 1:size(ymu_sin,1)    
       % Fix for out of domain points, which lead to erroneous, complex outputs, which go undetected to atan
       % For the case something/0, Matlab assigns it to inf, and atan(inf) = pi/2
       if (ymu_sin(j) < -1)
           ymu_sin(j) = -1;
       elseif (ymu_cos(j) < -1)
           ymu_cos(j) = -1;
       elseif (ymu_sin(j) > 1)
           ymu_sin(j) = 1;
       elseif (ymu_cos(j) > 1)
           ymu_cos(j) = 1;
       end
       euler_predicted(j,1) = atan2(ymu_sin(j), ymu_cos(j)); % 4 quad inv tangent. output of atan2 is always real and is in [-pi,pi] unlike atan 
    end

    % Only calculate errors for those points which were correctly classified.
    euler_error = euler_actual - euler_predicted; 

    error_cell{i} = euler_error;
    euler_predicted_cell{i} = euler_predicted;
    euler_actual_cell{i} = euler_actual;

end


stats_actual = [];
stats_predicted = [];
stats_error = [];

%%%CIRC_STATS%%%
for i = 1:6
% i = 1
    actual_circ = [];
    actual_circ = cell2mat(euler_actual_cell(i));
    circ_eval = circ_stats(actual_circ);
    stats_actual(i).mean = circ_rad2ang(circ_eval.mean);
    stats_actual(i).median = circ_rad2ang(circ_eval.median);
    stats_actual(i).var = circ_rad2ang(circ_eval.var);
    stats_actual(i).std = circ_rad2ang(circ_eval.std);
    stats_actual(i).skewness = circ_rad2ang(circ_eval.skewness);
    stats_actual(i).kurtosis = circ_rad2ang(circ_eval.kurtosis); 
    stats_actual(i).res_vector_length = circ_r(actual_circ);

    figure;
    subplot(3,2,1);
    circ_plot(actual_circ,'pretty','bo',true,'linewidth',2,'color','r');
    subplot(3,2,2);
    circ_plot(actual_circ,'hist',[],20,true,true,'linewidth',2,'color','r');

    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    predicted_circ = [];
    predicted_circ = cell2mat(euler_predicted_cell(i));
    circ_eval = circ_stats(predicted_circ);
    stats_predicted(i).mean = circ_rad2ang(circ_eval.mean);
    stats_predicted(i).median = circ_rad2ang(circ_eval.median);
    stats_predicted(i).var = circ_rad2ang(circ_eval.var);
    stats_predicted(i).std = circ_rad2ang(circ_eval.std);
    stats_predicted(i).skewness = circ_rad2ang(circ_eval.skewness);
    stats_predicted(i).kurtosis = circ_rad2ang(circ_eval.kurtosis); 
    stats_predicted(i).res_vector_length = circ_r(predicted_circ);    
    subplot(3,2,3);
    circ_plot(predicted_circ,'pretty','bo',true,'linewidth',2,'color','r');
    subplot(3,2,4);
    circ_plot(predicted_circ,'hist',[],20,true,true,'linewidth',2,'color','r');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    error_circ = [];
    error_circ_findmax = [];
    error_circ = cell2mat(error_cell(i));
    error_circ_findmax = abs(circ_rad2ang(error_circ));

    for j = 1:length(error_circ_findmax)
        if error_circ_findmax(j) > 180
            error_circ_findmax(j) = 360-error_circ_findmax(j);
        end
    end

    circ_eval = circ_stats(error_circ);
    stats_error(i).mean = circ_rad2ang(circ_eval.mean);
    stats_error(i).median = circ_rad2ang(circ_eval.median);
    stats_error(i).var = circ_rad2ang(circ_eval.var);
    stats_error(i).std = circ_rad2ang(circ_eval.std);
    stats_error(i).max = max(error_circ_findmax)
    stats_error(i).min = min(error_circ_findmax)
    stats_error(i).skewness = circ_rad2ang(circ_eval.skewness);
    stats_error(i).kurtosis = circ_rad2ang(circ_eval.kurtosis); 
    stats_error(i).res_vector_length = circ_r(error_circ);
    [c,p] = circ_corrcc(actual_circ, predicted_circ);
    stats_error(i).correlation = c;
    stats_error(i).correlation_p_value = p;
    clearvars c p;

    subplot(3,2,5);
    circ_plot(error_circ,'pretty','bo',true,'linewidth',2,'color','r');
    subplot(3,2,6);
    circ_plot(error_circ,'hist',[],20,true,true,'linewidth',2,'color','r');
    set(gcf,'units','normalized','outerposition',[0 0 1 1])

    euler_actual_deg = circ_rad2ang(euler_actual);
    euler_predicted_deg = circ_rad2ang(euler_predicted);
    figure;
    subplot(131);
    plot(euler_actual_deg,euler_predicted_deg,'.');
    formatSubplot(gca,'xl','euler actual','yl','euler predicted', 'ax','square','box','off')
    set(gcf,'units','normalized','outerposition',[0 0 1 1])

    [euler_actual_deg_sorted euler_indices] = sort(euler_actual_deg);
    euler_predicted_deg_sorted_acc_to_actual = euler_predicted_deg(euler_indices);
    subplot(132)
    plot(euler_actual_deg_sorted, 'black')
    hold on;
    plot(euler_predicted_deg_sorted_acc_to_actual, 'red')
    formatSubplot(gca,'xl','no of test samples','yl','euler actual sorted(black) / euler predicted sorted(red)', 'ax','square','box','off')

    subplot(133)
    plot(1:size(euler_actual_deg_sorted,1),euler_actual_deg_sorted,'.k',1:size(euler_predicted_deg_sorted_acc_to_actual,1),euler_predicted_deg_sorted_acc_to_actual,'.r')
    formatSubplot(gca,'xl','no of test samples','yl','euler actual(black) / euler predicted (red)', 'ax','square','box','off')
    set(gcf,'units','normalized','outerposition',[0 0 1 1]);
end

%Generate LaTeX table
latex_regression_error_stats(stats_error);