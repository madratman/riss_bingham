function B = slam_create_bingham(d, V, Z, F)

B = struct('d',d);
B.d = d;
B.Z = Z;
B.V = V;
B.F = F;
% [B.F B.dF] = bingham_F(B.Z);