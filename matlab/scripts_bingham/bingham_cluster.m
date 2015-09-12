% function [B weights] = bingham_cluster(X, min_points)
% % [B weights] = bingham_cluster(X, min_points) -- where each B(i) contains fields V, Z, F

% if nargin < 2
%    min_points = 20;
% end

% for i=1:100 %max no of clusters
%   fprintf('Bingham distrubution #: %d', i);
%   % [B(i) outliers] = bingham_fit_mlesac(X');
%   [B(i) outliers] = bingham_fit_mlesac_orig(X');

%   % outliers is a row vector
%   weights(i) = size(X,1) - length(outliers);
  
%   % fprintf('no of points left are', weights(i));
%   % weight of a particular bingham is no of points left - no of ouliers

%   if weights(i) < min_points
%     break;
%   end

%   if length(outliers) < min_points
%     break;
%   end

%   X_updater = zeros(length(outliers), size(X,2));
%   % initialize the outlier data for next iteration to zeros
%   for j = 1:length(outliers)
%     X_updater(j,:) = X(outliers(j),:);
%   end
%   % get them outliers
%   X = X_updater;
%   % update the outliers for the next iteration
% end

% % C code: fit a uniform distribution to the remaining outliers
% % or just fit a bingham?
% num_outliers = size(X, 1) - sum(weights, 1);
% % if(num_outliers > 0)
% %   % weights(i+1) = num_outliers;
% %   for j = 1
% %   Bingham(i+1) = bingham_fit(X(outliers(j),:));
% %   end
% % end

% % for i = 1:size(weights, 2)
% %   weights(i) = weights(i)/sum(weights, 1)
% % end



function [B weights] = bingham_cluster(X, min_points)
% [B weights] = bingham_cluster(X, min_points) -- where each B(i) contains fields V, Z, F

if nargin < 2
   min_points = 20;
end

for i=1:100 %max no of clusters
  fprintf('Bingham distrubution #: %d', i);
  [B(i) outliers] = bingham_fit_mlesac_orig(X');
  % outliers is a row vector
  weights(i) = size(X,1) - length(outliers);
  
  fprintf('no of points left are', weights(i));
  weights(i)
  % weight of a particular bingham is no of points left - no of ouliers
  if length(outliers) < min_points
    break;
  end
  X_updater = zeros(length(outliers), size(X,2));
  % initialize the outlier data for next iteration to zeros
  for j = 1:length(outliers)
    X_updater(j,:) = X(outliers(j),:);
  end
  % get them outliers
  X = X_updater;
  % update the outliers for the next iteration
  i
  X
end