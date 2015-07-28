function [c ceq] = nonlcon(req_var)

c=[]; % coz no nonlinear inequalities

theta = req_var(5:end);
quat_trans =  req_var(1:4)';
quat_input = quaternion.angleaxis(linspace(0,2*pi,360), repmat([1 0 0],360,1));
quat_trans = quaternion(quat_trans);
for i = 1:length(theta)
    final_quat = [cos(theta(i)/2) 0 0 sin(theta(i)/2)];
    ceq(i,:) = from_quaternion_class_to_array(times(quat_input(i), quat_trans)) - final_quat;
end
quat_trans
ceq