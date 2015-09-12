function quat = clean_and_format_vrep_quat(quat)

%delete 1st three colums which is cartesian position
% quat = pose(:,4:end)
%4 significant digits
quat = round(quat, 4);
%change quat from xyzw to wxyz
quat = circshift(quat, 1, 2);
