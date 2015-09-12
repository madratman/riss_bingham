clearvars quat_final quat_init t_init req_var quat_trans
global quat_input;
% 
% no_of_quat_input = 3
% quat_input = quaternion.angleaxis(linspace(0,2*pi,no_of_quat_input), repmat([1 0 0],no_of_quat_input,1));

quat_input = init_quat(1,:);
no_of_quat_input = size(quat_input,1);

t_init = rand(4+no_of_quat_input,1)

req_var = fmincon(@obj,t_init,[],[],[],[],[],[],@nonlcon)

quat_trans = [req_var(1) req_var(2) req_var(3) req_var(4)]

for i = 5:length(req_var)
    i;
    quat_final(i-4,:) = [cos(req_var(i)/2) 0 0 sin(req_var(i)/2)];
end
quat_final
% check = quaternion(quat_input), quaternion(quat_final)
% plot_quaternions_length(quat_final);
