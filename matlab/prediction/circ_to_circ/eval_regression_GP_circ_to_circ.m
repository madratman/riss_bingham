clearvars hyp meanfunc covfunc euler_error euler_predicted euler_actual x training_target_cos training_target_sin z ymu_cos ymu_sin training_target;

meanfunc = {@meanZero};hyp.mean = [];

likfunc = @likGauss; sn = 0.1; hyp.lik = log(sn); 
% DO NOT KNOW WHAT SHOULD BE THE HYPER-PARAMS FOR LIKELIHOOD FUNCTION

% For training data, don't be smart and think of using Angle Axis. I tried that. Doesn't work for all case.
% Visualize with plot_quaternions_sphere or just look at the angle, axis to understand why it doesn't work. 

euler_predicted = [];
euler_actual = [];

training_target = syn_final_euler(:,3);
training_input = syn_init_euler(:,2);

% testing_input = circ_ang2rad((rand(179,1).*179));
% testing_target = testing_input; %Ranges of angles are fucked up. But we ll let circ_stats take care of that

testing_input = rand(360,1).*2*pi + circ_ang2rad(100);
testing_target = testing_input - circ_ang2rad(100); %Ranges of angles are fucked up. But we ll let circ_stats take care of that

testing_input_sin = sin(testing_input);
testing_input_cos = cos(testing_input);

training_input_cos = cos(training_input);
training_input_sin = sin(training_input);

training_target_cos = cos(training_target);
training_target_sin = sin(training_target);

% cn  = {'covNoise'}; sn = .1;  hypn = log(sn);  % one hyperparameter
% cgi = {'covSEiso'}; ell = 1/4; sf = 1; hypgi = log([ell;sf]);    % isotropic Gaussian
% covfunc = {'covSum',{cn,cgi}}; hypsu = [hypn; hypgi];      % sum
% feval(covfunc{:})
% covfunc = {'covSum', {'covSEiso','covNoise'}};
% hypn = log(sn);ell = 1/4; sf = 1; hypgi = log([ell;sf]);
% hypsu = [hypn; hypgi];
covfunc = {@covSEiso}; ell = 1/4; sf = 1; hyp.cov = log([ell; sf]);
% covfunc = {@covPeriodic}; ell = 2.5; p = 2*pi; sf = 2; hyp.cov = log([ell;p;sf]);
hyp = minimize(hyp, @gp, -1000, @infExact, [], covfunc, likfunc, training_input_cos, training_target_cos)    
[ymu_cos ys2 fmu fs2 lp] = gp(hyp, @infExact, meanfunc, covfunc, likfunc, training_input_cos, training_target_cos, testing_input_cos) ;
hyp.cov

covfunc = {@covSEiso}; ell = 1/4; sf = 1; hyp.cov = log([ell; sf]);
% covfunc = {@covPeriodic}; ell = 2.5; p = 2*pi; sf = 2; hyp.cov = log([ell;p;sf]);
hyp = minimize(hyp, @gp, -10000, @infExact, [], covfunc, likfunc, training_input_sin, training_target_sin);
[ymu_sin ys2 fmu fs2 lp] = gp(hyp, @infExact, meanfunc, covfunc, likfunc, training_input_sin, training_target_sin, testing_input_sin);
% hyp.cov

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
euler_actual = testing_target;

euler_error = euler_actual - euler_predicted; 

error_cell{i} = euler_error;
euler_predicted_cell{i} = euler_predicted;
euler_actual_cell{i} = euler_actual;

stats_actual = [];
stats_predicted = [];
stats_error = [];

%%%CIRC_STATS%%%% i = 1
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
set(gcf,'units','normalized','outerposition',[0 0 1 1])



%Generate LaTeX table
% latex_regression_error_stats(stats_error);