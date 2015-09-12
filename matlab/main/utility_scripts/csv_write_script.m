mkdir(strcat('data/hex_prism/', datestr(now, 30)));
% mkdir(strcat('data/square_pyr_eq_triangle/', datestr(now, 30)));
right_now = datestr(now, 30);
for i = 1:7
    csvwrite(strcat('data/hex_prism/', right_now, '/quat_hex_prism_face_', num2str(i), '.csv'), eval(strcat('quat_hex_prism_face_', num2str(i))));
end

% for i = 1:5
%    csvwrite(strcat('data/square_pyr_eq_triangle/', right_now, '/quat_square_pyr_eq_triangle_', num2str(i),'.csv'), eval(strcat('quat_square_pyr_eq_triangle_face_', num2str(i))));
% end
