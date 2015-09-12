% This is how I found the out of domain bug. 
% Predicted values of y_cos and y_sin, i.e. ymu_cos and ymu_sin
% can fall out of [-1,1]. When you take atan of these combined values, you
% get those outliers. 
% Plotting functions ignore the complex values returned by asin and acos when
% the input is out of the domain of [-1,1]
plot(y_cos)
plot(sort(y_cos))
plot(sort(training_target))
plot(sort(y_cos))
plot(cos(sort(training_target)))
plot(sort(ymu_cos))
hold on
plot(sort(y_cos), 'r')
plot(sort(y_sin), 'r')
hold on
plot(sort(ymu_sin), 'b')
plot(sin(sort(training_target)))
plot(asin(sort(ymu_sin)))
plot(ymu_sin)
plot(sort(ymu_sin))
plot(sort(y_sin))
plot(asin(sort(y_sin)))
plot(asin(sort(ymu_sin)))
plot(asin(sort(y_sin)))
plot(asin(sort(ymu_sin)))
sort(y_sin)

% USEFUL STUFF:
plot(asin(sort(y_sin)))
plot(sort(y_sin), asin(sort(y_sin)))
plot(sort(ymu_sin), asin(sort(ymu_sin)))
plot(sort(ymu_cos), acos(sort(ymu_cos)))
plot(sort(euler_predicted), 

% For circ_to_circ regression
plot(training_input_sin, training_target_sin)
plot(training_input_sin, training_target_sin, '.')
plot(testing_input_sin, sin(euler_actual), '.')
plot(testing_input_sin, sin(euler_predicted), '.')

subplot(131)
plot(cos(sort(testing_input)))
subplot(132)
plot(training_input_cos)
subplot(133)
plot(training_input_cos, cos(sort(testing_input)))

