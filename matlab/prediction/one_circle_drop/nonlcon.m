function [c ceq] = nonlcon(req_var)

c=[]; % coz no nonlinear inequalities

theta = req_var(5:end);
quat_trans =  req_var(1:4)';
% req_var is the vector of the optimization variables.
% The first four elements are just the transformation quaternion, which is
% unknown. 
% The elements from 5th onwards are the angles of the final quaternions in
% the "plane normal to Z axis"

global quat_input;

quat_trans = quaternion(quat_trans); 

for i = 1:length(theta)
    final_quat = [cos(theta(i)/2) 0 0 sin(theta(i)/2)];
    % As the final_quat is in plane normal to Z axis.
    ceq(i,:) = from_quaternion_class_to_array(times(quat_input(i), quat_trans)) - final_quat;
    % Rotate each element of quat_input by multiplying with quat_trans and
    % subtract the final_quat from it     
end

% fmincon wants the ceq(the equality constraints) to be a vector. Right now
% it is of size length(theta)*4. So we make it into a vector. 

%%debug%%
quat_trans;
ceq;
%%debug%%

ceq = ceq(:)
