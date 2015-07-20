function B = create_bingham(d, V, Z, F, dF)

% use F and dF as parameters
B = struct('d',d);
B.d = d;
B.Z = Z;
B.V = V;
B.F = F;
B.dF = dF
