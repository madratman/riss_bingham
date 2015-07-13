function B = create_bingham(d, V, Z)

B = struct();
B.d = d;
B.Z = Z;
B.V = V;

[B.F B.dF] = bingham_F(B.Z);
