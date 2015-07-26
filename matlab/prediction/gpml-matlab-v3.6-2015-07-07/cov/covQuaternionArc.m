function K = covQuaternionArc(hyp, x, z, i)

if nargin<2, K = '2'; return; end                  % report number of parameters
if nargin<3, z = []; end                                   % make sure, z exists
xeqz = isempty(z); dg = strcmp(z,'diag');                       % determine mode

% x is n*4 (quaternion)

sf = hyp(1);
lambda = hyp(2);

if xeqz
    dot_prod = x*x';%dot_prod is n*n
else
    dot_prod = x*z';
end
    
numerator = (real(acos(dot_prod))).^2;
    
% Weird bug: Why is it returning a complex number matrix?
% Turned out it was a floating point error, if dot_prod is slightly greater
% than 1, it falls outside the domain of acos(but Matlab has a different
% definition for inputs outside domain and it returns:
% 0 + ____i  
% So we extract the real parts for ALL. 
% Edit: Similarly, for inputs < -1, it returns 3.1416+___i, so we just
% extract real parts.
% Or else when we square a complex number, we ll get erroneous distance. 

denominator = -2*(lambda^2); %Note: The negative sign

K = (sf^2)*(exp(numerator/denominator));

