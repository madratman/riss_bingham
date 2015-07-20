function q2 = qinv(q)
% q2 = qinv(q) -- invert a quaternion

% Check q_inv = q_conj/(q_norm)^2
% Assumes norm = 1, which is okay!
if size(q,1) == 1
    q2 = [q(1), -q(2:4)];
else
    q2 = [q(1); -q(2:4)];
end
