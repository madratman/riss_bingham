function B = bingham_normalize(B)
% 
% B = struct();
% B.d = d;
% B.Z = Z;
% B.V = V;

[B.F B.dF] = bingham_F(B.Z);
