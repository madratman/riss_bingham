function plot_bingham_3d(B, Q)
% plot_bingham_3d(B, Q)

V = B.V;
Z = B.Z;
F = B.F;
clf;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hold on;
% plot_quaternions_length(B.V');

clf;

angle = [];
direction = [];

% axis vis3d;
axis equal;
hold on;
origin  = zeros(1000, 3);
Q = B.V';
for i=1:size(Q,1)
   a = 2*acos(Q(i,1));  
   if abs(sin(a/2)) < 1e-10   % no rotation, so pick an arbitrary axis
      fprintf('.');
      v = [1 0 0]; 
   else
      v = Q(i,2:4) / sin(a/2);
   end
   
   angle = [angle; a];
   direction = [direction; v];

   starts = zeros(1,3);
   ends = (v.*a)/2;
%    ends = v; 
   quiver3(starts(:,1), starts(:,2), starts(:,3), ends(:,1), ends(:,2), ends(:,3), 0);
%    title(['B.V=' mat2str(B.V(:,1)) ',' B.V(1, 2) ',' B.V(1,3) ')'])

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%subplot(2,1,1);
[SX,SY,SZ] = sphere(50);
n = size(SX,1);


% compute the marginal distribution of the axis 'u'
C = zeros(n);
for i=1:n
   for j=1:n
      u = [SX(i,j) SY(i,j) SZ(i,j)];
      for a=0:.1:2*pi
         q = [cos(a/2), sin(a/2)*u];
         C(i,j) = C(i,j) + bingham_pdf_3d(q, Z(1), Z(2), Z(3), V(:,1), V(:,2), V(:,3), F);
      end
   end
end

C = C./max(max(C));
%C = .5*C + .5
zlabel = ('Z-axis');
ylabel = ('Y-axis');
xlabel = ('X-axis');

surf(SX,SY,SZ,C, 'EdgeColor', 'none', 'FaceAlpha', .7);

zlabel = ('Z-axis');
ylabel = ('Y-axis');
xlabel = ('X-axis');
%colormap(.5*gray+.5);
% cmap = pink;
% cmap(1:2:end,:) = cmap(end/2+1:end,:);
% cmap(2:2:end,:) = cmap(1:2:end,:);
% cmap = .75*cmap + .15*autumn + .1*gray;
% colormap(cmap);

if nargin >= 2
   n = size(Q,1);
   cmap = jet;
   P = zeros(1, n);
   for j=1:n
      P(j) = bingham_pdf(Q(j,:), B);
   end
   P = P./max(P);
   C = repmat(cmap(1,:), [n 1]); %cmap(round(1+63*P), :);
   plot_quaternions(Q, C, 1, 0);
end


