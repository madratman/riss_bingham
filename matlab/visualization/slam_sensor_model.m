B = struct();

V = [0 1 0 0; 0 0 1 0; 0 0 0 1]';
B.V = V;
B.Z = [-60 -60 -900]
[B.F B.dF] = bingham_F(B.Z);

plot_bingham_rotations_rand(B, 500);
xlabel('x')
ylabel('y')
zlabel('z')